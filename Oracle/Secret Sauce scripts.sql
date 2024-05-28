create table attendee(
  aid   number,
  name  varchar(128),
  free_ticket boolean,
  constraint attendee primary key (aid)
);
insert into attendee values(1, 'Steve', true); 
insert into attendee values(2, 'Sophie', false);

create table speaker(
  sid    number,
  name   varchar(128),
  phone  varchar2(10),
  constraint pk_speaker primary key (sid)
);

insert into speaker values(1, 'Pascal', '123459');
insert into speaker values(2, 'Bodo', '555566');

create table sessions(
  ssid        number,
  name        varchar2(128),
  room        varchar2(128),
  time_slot   varchar2(128),
  speaker_id  number,
  constraint pk_session primary key (ssid),
  constraint fk_session 
      foreign key (speaker_id) 
      references speaker(sid)
);
insert into sessions values  
 (1,'Intro to Hackolade','Room 1','10:00-10:45',1);  
insert into sessions values  
 (2, 'Data models 101', 'Room 2', '13:15-14:00',1); 
insert into sessions values  
 (3, 'Duality Views', 'Room 1', '9:00-9:45',2);

create table schedule (
  schedule_id number,
  session_id  number,
  attendee_id number,
  constraint pk_schedule primary key(schedule_id),
  constraint fk_schedule_attendee  
      foreign key (attendee_id) 
      references attendee(aid),
  constraint fk_schedule_session 
      foreign key (session_id) 
      references sessions(ssid)
);

insert into schedule values (1,1,1);
insert into schedule values (2,2,1);
insert into schedule values (3,2,2);
insert into schedule values (4,3,1);


create or replace JSON Duality view speakerDV as 
select JSON {'_id' : sid,
             name,
             phone
            }
from speaker with insert update delete;


create or replace JSON Duality view attendeeDV as 
select JSON {
              '_id' : aid, 
              name
            } 
from attendee;

create or replace JSON Duality view ScheduleDV AS
select JSON {
   '_id'      : a.aid,
   'name'     : a.name,
   'schedule' : [ 
      select JSON {
          'scheduleId' : sch.schedule_id, 
          'session' : (
              select JSON {
                 ss.ssid,
                 ss.name,
                 ss.room,
                 'time' : ss.time_slot,
                 'speaker' : ( 
                     select JSON {
                         s.sid, 
                         s.name
                     } 
                     from SPEAKER s
                     where s.sid = ss.speaker_id)
              }
              from SESSIONS ss
              where ss.ssid = sch.session_id)
      } 
     from SCHEDULE sch with insert delete
     where sch.attendee_id = a.aid
  ]
} from ATTENDEE a;

create or replace JSON Duality view ScheduleUnnestDV AS
select JSON {
   '_id'      : a.aid,
   'name'     : a.name,
   'schedule' : [ 
      select JSON {
          'scheduleId' : sch.schedule_id,
          UNNEST  (
              select JSON {
                 'sessionId' : ss.ssid,
                 'sessionName' : ss.name,
                 ss.room,
                 'time' : ss.time_slot,
                 UNNEST  ( 
                     select JSON {
                         'speakerId': s.sid,
                         'speaker' : s.name
                     } 
                     from speaker s
                     where s.sid = ss.speaker_id)
              } 
              from sessions ss
              where ss.ssid = sch.session_id)
      } 
     from schedule sch with update insert delete
     where sch.attendee_id = a.aid
  ]
} from attendee a;
