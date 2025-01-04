CREATE DATABASE Olympics;
USE Olympics;


CREATE TABLE Countries (
    CountryID INT AUTO_INCREMENT PRIMARY KEY,
    CountryName VARCHAR(100),
    CountryCode CHAR(3),
    Continent VARCHAR(50)
);


CREATE TABLE Athletes (
    AthleteID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(100),
    Gender ENUM('Male', 'Female'),
    DateOfBirth DATE,
    CountryID INT,
    FOREIGN KEY (CountryID) REFERENCES Countries(CountryID)
);

CREATE TABLE Events (
    EventID INT AUTO_INCREMENT PRIMARY KEY,
    EventName VARCHAR(100),
    Sport VARCHAR(50),
    EventType ENUM('Individual', 'Team'),
    Gender ENUM('Male', 'Female', 'Mixed')
);

CREATE TABLE Medals (
    MedalID INT AUTO_INCREMENT PRIMARY KEY,
    AthleteID INT,
    EventID INT,
    MedalType ENUM('Gold', 'Silver', 'Bronze'),
    Year INT,
    FOREIGN KEY (AthleteID) REFERENCES Athletes(AthleteID),
    FOREIGN KEY (EventID) REFERENCES Events(EventID)
);

INSERT INTO Countries (CountryName, CountryCode, Continent) VALUES
('United States', 'USA', 'North America'),
('China', 'CHN', 'Asia'),
('India', 'IND', 'Asia'),
('Germany', 'GER', 'Europe'),
('Brazil', 'BRA', 'South America'),
('Australia', 'AUS', 'Oceania'),
('South Africa', 'RSA', 'Africa'),
('Canada', 'CAN', 'North America');

INSERT INTO Athletes (FullName, Gender, DateOfBirth, CountryID) VALUES
('John Doe', 'Male', '1995-03-12', 1),
('Jane Smith', 'Female', '1997-06-22', 2),
('Akash Sharma', 'Male', '2000-01-15', 3),
('Anna Müller', 'Female', '1994-10-08', 4);

INSERT INTO Events (EventName, Sport, EventType, Gender) VALUES
('100m Sprint', 'Athletics', 'Individual', 'Male'),
('200m Sprint', 'Athletics', 'Individual', 'Female'),
('4x100m Relay', 'Athletics', 'Team', 'Mixed'),
('Marathon', 'Athletics', 'Individual', 'Male'),
('Basketball', 'Basketball', 'Team', 'Male');

INSERT INTO Medals (AthleteID, EventID, MedalType, Year) VALUES
(1, 1, 'Gold', 2020),
(2, 2, 'Silver', 2020),
(3, 3, 'Bronze', 2020),
(4, 1, 'Gold', 2024);

DELIMITER //
CREATE PROCEDURE PopulateAthletes()
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 500 DO
        INSERT INTO Athletes (FullName, Gender, DateOfBirth, CountryID)
        VALUES (
            CONCAT('Athlete_', i),
            IF(i MOD 2 = 0, 'Male', 'Female'),
            DATE_ADD('1990-01-01', INTERVAL FLOOR(RAND() * 10000) DAY),
            FLOOR(1 + RAND() * 8)
        );
        SET i = i + 1;
    END WHILE;
END//
DELIMITER ;

CALL PopulateAthletes();

select * from athletes

select count(*) from athletes;

select * from Countries where Continent='Asia' or Continent='North America';

select * from Countries where Continent not in ('Asia','North America');

select * from Athletes where Gender='Male';

select * from Athletes where FullName like'S%';

select * from Athletes where FullName like 'M%';

select * from Athletes where FullName like '%H';

select a.* from Athletes a join Countries c on a.CountryId=c.countryId where c.Countrycode='USA';

select * from Athletes where Date_Format(DateOfBirth,'%m-%d') Between Date_Format(CurDate(),'%m-%d') and Date_Format(CurDate()+Interval 7 Day,'%m-%d');


INSERT INTO Countries (CountryName, CountryCode, Continent) VALUES
('Nepal', 'NEP', 'Asia'),
('France', 'FRA', 'Europe'),
('Italy','ITL','Europe'),
('Argentima', 'Arg', 'South America'),
('Poland', 'pol', 'Europe');


INSERT INTO Athletes (FullName, Gender, DateOfBirth, CountryID) VALUES
('Paras Khadka', 'Male', '1997-06-20', 9),
('Mbappe', 'Male', '2000-09-13', 10),
('Laura', 'Female', '2003-01-15', 13),
('Raechal', 'Female', '1989-07-28', 20),
('Lewis', 'Male', '1995-12-21', 11);

INSERT INTO Events (EventName, Sport, EventType, Gender) VALUES
('100m Swimming', 'Swimming', 'Individual', 'Male'),
('High Jump', 'Athletics', 'Individual','Male'),
('Volleyball', 'Volleyball', 'Team', 'Female'),
('Badminton', 'Badminton', 'Individual', 'Female'),
('Triple Jump', 'Athletics', 'Individual', 'Male');



INSERT INTO Medals (AthleteID, EventID, MedalType, Year) VALUES
(6, 6, 'Bronze', 2017),
(7, 7, 'Silver', 2018),
(8, 8, 'Gold', 2019),
(9, 9, 'Silver', 2020),
(10, 10, 'Silver', 2021);


select * from Medals where MedalType='Gold';

update Countries set CountryName='Gorkhali',CountryCode='NP' where CountryId = 11;
update Countries set CountryName='Paris',CountryCode='FR' where CountryId = 19;
update Countries set CountryName='Rome',CountryCode='Itl' where CountryId = 17;

update Athletes set FullName ='Bimal Mager',CountryId=25 where AthleteId=26;
update Athletes set FullName ='Utshav Basnet',CountryId=29 where AthleteId=30;
update Athletes set FullName ='Jennifer',CountryId=32 where AthleteId=33;

select * from Athletes where CountryId>11;

update Events set Sport ='Doudge Ball',EventType='Team' where EventId=9;
update Events set Sport ='RelayRace',EventType='Team' where EventId=10;
update Events set Sport ='TripleJump',EventType='Individual' where EventId=11;


update Medals set MedalType='Gold' where MedalId=3;
update Medals set MedalType='Bronze' where MedalId=9;
update Medals set MedalType='Sliver' where MedalId=11;

select * from Medals where MedalType='Gold';

delete from Athletes order by AthleteId Desc Limit 4;

select * from Athletes where AthleteId>5;






