#download database
wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/example-guided-project/flights_RUSSIA_small.sql

#copy database
\i flights_RUSSIA_small.sql

#showing all the tables
\dt

#read_only
#create a new read_only role
CREATE ROLE read_only;

#grant this privilege
GRANT CONNECT ON DATABASE demo TO read_only;

#Grant the privilege
GRANT USAGE ON SCHEMA bookings TO read_only;

#access the information in tables in a database
GRANT SELECT ON ALL TABLES IN SCHEMA bookings TO read_only;

#read_write
#create a new role called read_write
CREATE ROLE read_write;

#given the privileges to connect to the database
GRANT CONNECT ON DATABASE demo TO read_write;

#Give the role the privileges to use
GRANT USAGE ON SCHEMA bookings TO read_write;

#have the privileges to not only access the contents of the database, but also to create, delete, and modify entries
GRANT SELECT, INSERT, DELETE, UPDATE ON ALL TABLES IN SCHEMA bookings TO read_write;

#create a new user named user_a
CREATE USER user_a WITH PASSWORD 'user_a_password';

#assign user_a the read_only role
GRANT read_only TO user_a;

#list all the roles
\du

#REVOKE command to remove specific privileges
REVOKE SELECT ON aircrafts_data FROM user_a;

#revoking the read_only role
REVOKE read_only FROM user_a;

#check all the users and their roles
\du

#Suppose there is a new employee at the airline in which you are the database administrator for. 
#They interact directly with clients to create new bookings for flights. 
#As such, they will need to not only access the information in the database, but also to create new bookings
# create a new user called user_b
CREATE USER user_b WITH PASSWORD 'user_b_password';

#created the read_write role
GRANT read_write TO user_b;


