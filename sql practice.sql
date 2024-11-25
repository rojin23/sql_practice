CREATE schema Olympics;
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


Select count(*) from athletes;

select * from Countries where Continent='Asia' or Continent='North America';






