CREATE DATABASE University;

USE University;

CREATE TABLE Classroom (
    building VARCHAR(30),
    room_number INT,
    capacity INT,
    PRIMARY KEY (building, room_number)
);

CREATE TABLE Department (
    dept_name VARCHAR(30),
    building VARCHAR(30),
    budget FLOAT,
    PRIMARY KEY (dept_name)
);

CREATE TABLE Course (
    course_id VARCHAR(10),
    title VARCHAR(30),
    dept_name VARCHAR(30),
    credits INT,
    PRIMARY KEY (course_id),
    FOREIGN KEY (dept_name) REFERENCES Department(dept_name)
);

CREATE TABLE Instructor (
    id VARCHAR(10),
    name VARCHAR(30),
    dept_name VARCHAR(30),
    salary INT,
    PRIMARY KEY (id),
    FOREIGN KEY (dept_name) REFERENCES Department(dept_name)
);

CREATE TABLE Section (
    course_id VARCHAR(10),
    sec_id VARCHAR(10),
    semester VARCHAR(10),
    year YEAR,
    building VARCHAR(30),
    room_number INT,
    time_slot_id VARCHAR(15),
    PRIMARY KEY (course_id, sec_id, semester, year),
    FOREIGN KEY (course_id) REFERENCES Course(course_id),
    FOREIGN KEY (building, room_number) REFERENCES Classroom(building, room_number)
);

CREATE TABLE Teaches (
    id VARCHAR(10),
    course_id VARCHAR(10),
    sec_id VARCHAR(10),
    semester VARCHAR(10),
    year YEAR,
    PRIMARY KEY (id, course_id, sec_id, semester, year),
    FOREIGN KEY (id) REFERENCES Instructor(id),
    FOREIGN KEY (course_id, sec_id, semester, year) REFERENCES Section(course_id, sec_id, semester, year)
);

CREATE TABLE Student (
    id VARCHAR(10),
    name VARCHAR(30),
    dept_name VARCHAR(30),
    tot_cred INT,
    PRIMARY KEY (id),
    FOREIGN KEY (dept_name) REFERENCES Department(dept_name)
);

CREATE TABLE Takes (
    id VARCHAR(10),
    course_id VARCHAR(10),
    sec_id VARCHAR(10),
    semester VARCHAR(10),
    year YEAR,
    grade INT,
    PRIMARY KEY (id, course_id, sec_id, semester, year),
    FOREIGN KEY (id) REFERENCES Student(id),
    FOREIGN KEY (course_id, sec_id, semester, year) REFERENCES Section(course_id, sec_id, semester, year)
);

CREATE TABLE Advisor (
    s_id VARCHAR(10),
    i_id VARCHAR(10),
    PRIMARY KEY (s_id),
    FOREIGN KEY (s_id) REFERENCES Student(id),
    FOREIGN KEY (i_id) REFERENCES Instructor(id)
);

CREATE TABLE Time_Slot (
    time_slot_id VARCHAR(15),
    day VARCHAR(10),
    start_time TIME,
    end_time TIME,
    PRIMARY KEY (time_slot_id)
);

CREATE TABLE Prereq (
    course_id VARCHAR(10),
    prereq_id VARCHAR(10),
    PRIMARY KEY (course_id, prereq_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id),
    FOREIGN KEY (prereq_id) REFERENCES Course(course_id)
);
