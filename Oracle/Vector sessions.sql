create table sessions(
  said        number,
  name        varchar2(128),
  room        varchar2(128),
  time_slot   varchar2(128),
  abstract    varchar2(32767),
  content     vector,
  speaker_id  number,
  constraint pk_session primary key (ssid)
);
