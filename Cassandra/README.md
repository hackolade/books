# Cassandra Data Modeling and Schema Design

This repository contains the data models used to illustrate the book "Cassandra Data Modeling and Schema Design" of the series Align > Design > Refine 

Purchase your copy of the book on: 

- [Amazon United States](https://www.amazon.com/dp/1634623150?tag=hackolade02-20)
- [Amazon Canada](https://www.amazon.ca/1634623150?tag=hackolade02-20)
- [Amazon United Kingdom](https://www.amazon.co.uk/1634623150?tag=hackolade02-20)
- [Amazon Belgium](https://www.amazon.com.be/1634623150?tag=hackolade02-20)
- [Amazon France](https://www.amazon.fr/1634623150?tag=hackolade02-20)
- [Amazon Germany](https://www.amazon.de/1634623150?tag=hackolade02-20)
- [Amazon Italy](https://www.amazon.it/1634623150?tag=hackolade02-20)
- [Amazon Netherlands](https://www.amazon.nl/1634623150?tag=hackolade02-20)
- [Amazon Spain](https://www.amazon.es/1634623150?tag=hackolade02-20)
- [Amazon Sweden](https://www.amazon.se/1634623150?tag=hackolade02-20)

![img](https://m.media-amazon.com/images/I/41j1llaHYbL._SY445_SX342_.jpg)

Apache Cassandra is designed to handle large amounts of data across many commodity servers, providing high availability through robust support for clusterspanning of multiple datacenters and asynchronous masterless replication and low latency operations. It is essentially a hybrid between a key-value and a column-oriented database. Rows are organized into tables. The first component of a primary key is a partition key, and rows clustered by the remaining columns of the key. Other columns may be indexed separately from the primary key.

Some statements like CREATE TABLE make it seem like you can model your data like a relational database. This is very deceptive, as Cassandra does not support joins. This book explains in details, not only Cassandra features, but how to best leverage them with a thorough understanding of 9 different schema design patterns, and 5 anti-patterns.

Read *Cassandra Data Modeling and Schema Design* if you are a data architect or modeler who needs to expand your modeling skills to include Cassandra, or if you are a database administrator or developer who knows Cassandra but needs to expand your schema design skills.



## Co-authors

Betul O’Reilly is a Solutions Architect at DataStax. She is an experienced Solutions Architect with a strong focus on Cassandra and relational data modeling. Before her role at DataStax, Betul was Principal Cloud Solution Architect at Oracle, planning, designing, and implementing data and artificial intelligence (AI) solutions for EMEA clients. With 20 years of experience in the telecom, finance, e-commerce, and IT sectors, Betul has established herself as a dynamic figure in data management, analytics, and data science.

Steve Hoberman has trained more than 10,000 people in data modeling since 1992. Steve is known for his entertaining and interactive teaching style (watch out for flying candy!), and organizations around the globe have brought Steve in to teach his Data Modeling Master Class, which is recognized as the most comprehensive data modeling course in the industry.

Steve is the author of nine books on data modeling. He is the founder of the Design Challenges group, creator of the Data Modeling Institute’s Data Modeling Certification exam, Conference Chair of the Data Modeling Zone conferences, director of Technics Publications, lecturer at Columbia University, and recipient of the Data Administration Management Association (DAMA) International Professional Achievement Award.



The data models are licensed under [Apache 2.0 license](https://github.com/hackolade/books/blob/main/LICENSE).
The book is Copyright © 2024 by Technics Publications
