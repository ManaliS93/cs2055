drop table Plane cascade constraints;
create table Plane(plane_type char(4), manufacture varchar2(10), plane_capacity int, last_service_date date, year int, owner_id varchar2(5),Constraint Plane_PK PRIMARY KEY (plane_type, owner_id), Constraint Plane_FK FOREIGN KEY(owner_id) REFERENCES Airline(airline_id));
drop table Flight cascade constraints;
create table Flight(flight_number varchar2(3), airline_id varchar2(5), plane_type char(4), departure_city varchar2(3), arival_city varchar2(3), departure_time varchar2(4), arrival_time varchar2(4), weekly_schedule varchar2(7),Constraint Flight_PK PRIMARY KEY (flight_number), Constraint Flight_FK FOREIGN KEY(plane_type, airline_id) REFERENCES Plane(plane_type, owner_id));
drop table Price cascade constraints;
create table Price(departure_city varchar2(3), arrival_city varchar2(3), airline_id varchar2(5), high_price int, low_price int,Constraint Price_PK PRIMARY KEY (departure_city, arrival_city), Constraint Price_FK FOREIGN KEY(airline_id) REFERENCES Airline(airline_id));
drop table Customer cascade constraints;
create table Customer(cid varchar2(9), salutation varchar2(3), first_name varchar2(30), last_name varchar2(30), credit_card_num varchar2(16), credit_card_expire date, street varchar2(30), city varchar2(30), state varchar2(2),phone varchar2(10), email varchar2(30), frequent_miles varchar2(5), Constraint Customer_PK PRIMARY KEY (cid));
drop table Reservation cascade constraints;
create table Reservation(reservation_number varchar2(5), cid varchar2(9), cost int, credit_card_num varchar2(16),start_city varchar2(3), end_city varchar2(3), reservation_date date, ticketed varchar2(1), Constraint Reservation_PK PRIMARY KEY (reservation_number), Constraint Reservation_FK FOREIGN KEY(cid) REFERENCES Customer(cid));
drop table Reservation_detail cascade constraints;
create table Reservation_detail(reservation_number varchar2(5), flight_number varchar2(3), flight_date date, leg int,Constraint Reservation_detail_PK PRIMARY KEY (reservation_number, leg), Constraint Reservation_detail_FK1 FOREIGN KEY(reservation_number) REFERENCES Reservation(reservation_number), Constraint Reservation_detail_FK2 FOREIGN KEY(flight_number) REFERENCES Flight(flight_number));
drop table CDate cascade constraints;
create table CDate(c_date date,Constraint Date_PK PRIMARY KEY (c_date));
