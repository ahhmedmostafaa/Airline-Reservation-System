-- Airline Reservation System — Database Schema (MySQL)

CREATE DATABASE IF NOT EXISTS Airline_Database;
USE Airline_Database;

CREATE TABLE AIRPORT (
    Airportcode INT PRIMARY KEY,
    Airportname VARCHAR(30) NOT NULL,
    city VARCHAR(30) NOT NULL,
    state VARCHAR(30) NOT NULL
);

CREATE TABLE AIRPLANE_TYPE (
    type_name VARCHAR(30) PRIMARY KEY,
    maximum_number_of_seats INT NOT NULL,
    manufacturingcompany VARCHAR(30) NULL
);

CREATE TABLE AIRPORT_AIRPLANE_TYPE (
    Airportcode INT NOT NULL,
    type_name VARCHAR(30) NOT NULL,
    CONSTRAINT AIRPORT_fk FOREIGN KEY (Airportcode)
        REFERENCES AIRPORT (Airportcode),
    CONSTRAINT AIRPLANE_TYPE_fk FOREIGN KEY (type_name)
        REFERENCES AIRPLANE_TYPE (type_name)
);

CREATE TABLE AIRPLANE (
    AirplaneId INT PRIMARY KEY,
    total_no_of_seats INT NOT NULL,
    type_name VARCHAR(30) NOT NULL,
    CONSTRAINT AIRPLANE_TYPE_AIRPLANE_fk FOREIGN KEY (type_name)
        REFERENCES AIRPLANE_TYPE (type_name)
);

CREATE TABLE FLIGHT (
    FlightNumber INT PRIMARY KEY,
    Airline VARCHAR(30) NOT NULL,
    weekdays VARCHAR(30) NOT NULL
);

CREATE TABLE FLIGHT_LEG (
    LegNumber INT PRIMARY KEY,
    Departure_Airportcode INT NOT NULL,
    Arrival_Airportcode INT NOT NULL,
    FlightNumber INT NOT NULL,
    Scheduled_departure_time TIME NOT NULL,
    Scheduled_arrival_time TIME NOT NULL,
    CONSTRAINT AIRPORT_FLIGHT_LEG_Departure_fk FOREIGN KEY (Departure_Airportcode)
        REFERENCES AIRPORT (Airportcode),
    CONSTRAINT AIRPORT_FLIGHT_LEG_Arrival_fk FOREIGN KEY (Arrival_Airportcode)
        REFERENCES AIRPORT (Airportcode),
    CONSTRAINT FLIGHT_FLIGHT_LEG_fk FOREIGN KEY (FlightNumber)
        REFERENCES FLIGHT (FlightNumber)
);

CREATE TABLE LEG_ISTANCE (
    Data VARCHAR(30) PRIMARY KEY,
    Actual_departure_time TIME NOT NULL,
    Actual_arrival_time TIME NOT NULL,
    Number_of_available_seats INT NOT NULL,
    LegNumber INT NOT NULL,
    AirplaneId INT NOT NULL,
    Departure_Airportcode INT NOT NULL,
    Arrival_Airportcode INT NOT NULL,
    CONSTRAINT FLIGHT_LEG_LEG_ISTANCE_fk FOREIGN KEY (LegNumber)
        REFERENCES FLIGHT_LEG (LegNumber),
    CONSTRAINT AIRPLANE_LEG_ISTANCE_fk FOREIGN KEY (AirplaneId)
        REFERENCES AIRPLANE (AirplaneId),
    CONSTRAINT AIRPORT_LEG_ISTANCE_Departure_fk FOREIGN KEY (Departure_Airportcode)
        REFERENCES AIRPORT (Airportcode),
    CONSTRAINT AIRPORT_LEG_ISTANCE_Arrival_fk FOREIGN KEY (Arrival_Airportcode)
        REFERENCES AIRPORT (Airportcode)
);

CREATE TABLE SEATS_RESERVATION (
    SeatNumber INT PRIMARY KEY,
    Customername VARCHAR(30) NOT NULL,
    Customerphone INT NOT NULL,
    Data VARCHAR(30) NOT NULL,
    CONSTRAINT LEG_ISTANCE_SEATS_RESERVATION_fk FOREIGN KEY (Data)
        REFERENCES LEG_ISTANCE (Data)
);
