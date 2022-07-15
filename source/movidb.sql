/*person table schema*/
CREATE TABLE Person(
    Person_Id INTEGER NOT NULL AUTO_INCREMENT,
    Gender char(1) NOT NULL CHECK (Gender IN('M','F','O')),
    First_Name VARCHAR(30) NOT NULL,
    Middle_Name VARCHAR(30),
    Last_Name VARCHAR(30) NOT NULL,
    DOB DATE NOT NULL,
    Age INTEGER CHECK (Age > 0),
    PRIMARY KEY(Person_Id),
    UNIQUE(First_Name,Last_Name,DOB,Gender)
    
);


/*Award Table Schema*/
CREATE TABLE Award(
    Award_Id INTEGER NOT NULL AUTO_INCREMENT,
    Name VARCHAR(50),
    Title VARCHAR(30),
    Organization VARCHAR(20),
    Year INTEGER CHECK (Year > 1850),
    PRIMARY KEY(Award_Id)
);


/* Shows Table */

CREATE TABLE Shows(
    Show_Id INTEGER NOT NULL AUTO_INCREMENT,
    Title VARCHAR(30),
    Language VARCHAR(30),
    Rating FLOAT CHECK (Rating >= 0 and Rating <= 10.0),
    Certification VARCHAR (10),
    Budget INTEGER CHECK (Budget >0),
    Popularity FLOAT CHECK(Popularity >0),
    Location VARCHAR(30),
    PRIMARY KEY(Show_Id)
    
);

/*Persons Nominated table Schema*/
CREATE TABLE PersonsNominated(
    Person_Id INTEGER NOT NULL,
    Award_Id INTEGER NOT NULL,
    PRIMARY KEY(Person_Id, Award_Id),
    FOREIGN KEY(Person_Id) REFERENCES Person(Person_Id),
    FOREIGN KEY(Award_Id) REFERENCES Award(Award_Id)
);

/*Shows Nominated */
CREATE TABLE ShowsNominated(
    Show_Id INTEGER NOT NULL,
    Award_Id INTEGER NOT NULL,
    PRIMARY KEY(Show_Id, Award_Id),
    FOREIGN KEY(Show_Id) REFERENCES Shows(Show_Id),
    FOREIGN KEY(Award_Id) REFERENCES Award(Award_Id)
);





/* Actor Table */

CREATE TABLE Actor(
    Person_Id INTEGER NOT NULL,
    Role_Name VARCHAR(30),
    Worth INTEGER,
    StartDate INTEGER,
    Experience INTEGER,
    PRIMARY KEY(Person_Id),
    FOREIGN KEY(Person_Id) REFERENCES Person(Person_Id) ON DELETE CASCADE
);


/* Acting Table */


CREATE TABLE Acting(
    Actor_Id INTEGER NOT NULL,
    Show_Id INTEGER NOT NULL,
    Role_First_Name VARCHAR(50),
    Role_Last_Name VARCHAR(50),
    PRIMARY KEY(Actor_Id,Show_Id),
    FOREIGN KEY(Actor_Id) REFERENCES Actor(Person_Id) ON DELETE CASCADE,
    FOREIGN KEY(Show_Id) REFERENCES Shows(Show_Id) ON DELETE CASCADE
);

/* Director Table */

CREATE TABLE Director(
    Person_Id INTEGER NOT NULL,
    Direction_Type VARCHAR(10) CHECK (Direction_Type IN('Music','Movie','Dance','Art')),
    StartDate INTEGER,
    Experience INTEGER,
    PRIMARY KEY(Person_Id),
    FOREIGN KEY(Person_Id) REFERENCES Person(Person_Id) ON DELETE CASCADE
);

/* Direction Table */

CREATE TABLE Direction(
    Director_Id INTEGER NOT NULL,
    Show_Id INTEGER NOT NULL,
    PRIMARY KEY(Director_Id,Show_Id),
    FOREIGN KEY(Director_Id) REFERENCES Director(Person_Id) ON DELETE CASCADE,
    FOREIGN KEY(Show_Id) REFERENCES Shows(Show_Id) ON DELETE CASCADE
);

/* Producer Table */

CREATE TABLE Producer(
    Person_Id INTEGER NOT NULL,
    PRIMARY KEY(Person_Id),
    FOREIGN KEY(Person_Id) REFERENCES Person(Person_Id) ON DELETE CASCADE
);



/* Writer Table */

CREATE TABLE Writer(
    Person_Id INTEGER NOT NULL,
    PRIMARY KEY(Person_Id),
    FOREIGN KEY(Person_Id) REFERENCES Person(Person_Id) ON DELETE CASCADE
);

/* Written Table */

CREATE TABLE Written(
    Writer_Id INTEGER NOT NULL,
    Show_Id INTEGER NOT NULL,
    PRIMARY KEY(Writer_Id,Show_Id),
    FOREIGN KEY(Writer_Id) REFERENCES Writer(Person_Id) ON DELETE CASCADE,
    FOREIGN KEY(Show_Id) REFERENCES Shows(Show_Id) ON DELETE CASCADE
);


/* User Table */

CREATE TABLE Users(
    User_Id INTEGER NOT NULL AUTO_INCREMENT,
    User_Name VARCHAR(30) NOT NULL,
    Pswrd INTEGER NOT NULL,
    PRIMARY KEY(User_Id),
    UNIQUE(User_Name)
);



/* Reviews table */

CREATE TABLE Reviews(
    Review_Id INTEGER NOT NULL,
    User_Name VARCHAR(30) NOT NULL,
    Show_Id Integer NOT NULL,
    UpVotes INTEGER, /* up and down stands for review is good or not by other users*/
    DownVotes INTEGER,
    Rating FLOAT CHECK (Rating >= 0 and Rating <= 10),
    Review_Description VARCHAR(20000),
    Review_Date DATE,
    PRIMARY KEY(Review_Id)
     
);





/* Movie Table */

CREATE TABLE Movies(
    Show_Id INTEGER NOT NULL,
    Duration FLOAT CHECK (Duration > 0),
    Year INTEGER CHECK (Year > 1850),
    Hour FLOAT CHECK (Hour > 0),
    PRIMARY KEY(Show_Id),
    FOREIGN KEY(Show_Id) REFERENCES Shows(Show_Id) ON DELETE CASCADE
);


/* TV Series Table */

CREATE TABLE TVSeries(
    Show_Id INTEGER NOT NULL,
    Start_date DATE,
    End_date DATE,
    Air_Channel VARCHAR(50),
    Air_Day VARCHAR(30),
    Air_time TIME,
    FOREIGN KEY(Show_Id) REFERENCES Shows(Show_Id) ON DELETE CASCADE,
    PRIMARY KEY(Show_Id)
);




/*Genre table Schema*/
CREATE TABLE Genres(
    Genre_Id INTEGER NOT NULL,
    Name VARCHAR(30),
    PRIMARY KEY(Genre_Id)
    );

/*In_Genre table Schema*/
CREATE TABLE In_Genre(
    Genre_Id INTEGER NOT NULL,
    Show_Id INTEGER NOT NULL,
    PRIMARY KEY(Genre_Id, Show_Id),
    FOREIGN KEY(Genre_Id) REFERENCES Genres(Genre_Id),
    FOREIGN KEY(Show_Id) REFERENCES Shows(Show_Id)
 );

/*******TRIGGERS*********


CREATE TRIGGER calcmovieage 
before INSERT on Movies  for each row update
if new.Age= NULL then set new.Age  =2022 - new.Year ;
*/







DELIMITER | 
CREATE TRIGGER calcduration 
before INSERT on Movies  FOR EACH ROW
BEGIN
 IF new.Hour IS NULL THEN 
 set new.Hour  = Floor(new.duration / 60) + (new.duration % 60)/100;
END IF;  
END |
DELIMITER ;


DELIMITER | 
CREATE TRIGGER calcpopularity 
before INSERT ON Shows 
FOR EACH ROW 
BEGIN 
	IF new.Popularity IS NULL   THEN 
		SET new.Popularity  = (new.Rating / 10) + new.Budget / 100000 ; 
	END IF; 
END |
DELIMITER ;





DELIMITER | 
CREATE TRIGGER calcpersonage 
before INSERT on Person  for each row  
BEGIN
  IF new.Age IS NULL THEN 
    set new.Age  = 2022 - Year(new.DOB) ;
  END IF;  
END |
DELIMITER ;

DELIMITER | 
CREATE TRIGGER calcdirectorexperience 
before INSERT on Director  for each row 
BEGIN
  IF new.experience IS NULL THEN 
    set new.experience  = 2022- new.StartDate ;
  END IF;  
END |
DELIMITER ;

DELIMITER | 
CREATE TRIGGER calcdirectorexperienceup 
before UPDATE on Director  for each row 
BEGIN
  IF new.experience IS NULL THEN 
    set new.experience  = 2022- new.StartDate ;
  END IF;  
END |
DELIMITER ;

DELIMITER | 
CREATE TRIGGER calcactorexperience 
before INSERT on Actor  for each row
BEGIN
  IF new.experience IS NULL THEN
    set new.experience  = 2022- new.StartDate ;
   END IF;  
END |
DELIMITER ;

DELIMITER | 
CREATE TRIGGER calcactorexperienceup 
before UPDATE on Actor  for each row
BEGIN
  IF new.experience IS NULL THEN
    set new.experience  = 2022- new.StartDate ;
   END IF;  
END |
DELIMITER ;


/**VIEWS PART**/
/*Movie View

CREATE VIEW movie_view AS
SELECT * FROM Movies m1 Left Outer Join Shows s1 on m1.Show_Id = s1.Show_Id;
*/
CREATE VIEW movie_view AS
SELECT s1.*,m1.Year,m1.Duration,m1.Hour FROM Movies m1 Left Outer Join Shows s1 on m1.Show_Id = s1.Show_Id;



/*Tv Show View
CREATE VIEW tv_view AS
SELECT * FROM shows s1 Right Outer Join tvseries t1  ON t1.Show_ID = s1.Show_Id;

*/
/*Actor View
CREATE VIEW actor_view AS
SELECT * FROM Actor a1 Left Outer Join Person p2 on a1.Person_Id = p2.Person_Id
UNION ALL
SELECT * FROM Actor a1 Right Outer Join Person p2 on a1.Person_Id = p2.Person_Id;
*/
/*director View
CREATE VIEW director_view AS
SELECT * FROM Director t1 JOIN Person t2 ON t1.Person_Id = t2.Person_Id;

*//*person View
CREATE VIEW person_view AS
SELECT * FROM Person;

*//*review View
CREATE VIEW review_view AS
SELECT * FROM Reviews t1 JOIN Shows t2 ON t1.Show_Id = t2.Show_Id;

*/




 /*Year(2020-02-12)=2020
 
 Flooe(4.56)= 4
 */


/* *********** Inserting part *****************/


/*Datasets*/

/*Dataset for person*/
INSERT INTO Person
(Gender, First_Name, Middle_Name, Last_Name, DOB)
VALUES
('M', 'Haluk', null, 'Bilginer', '1954-10-20'),
('M', 'Sener', null, 'Sen', '1944-10-20'),
('F', 'Demet', null, 'Akbag', '1959-01-23'),
('F', 'Adile', null, 'Nasit', '1939-01-23'),
('M', 'Tuncel', null, 'Kurtiz', '1979-10-20'),
('F', 'Anna', 'Taylor', 'Joy', '1988-06-26'),
('F', 'Emily', null, 'Blunt', '1983-01-23'),
('M', 'Chris', null, 'Evans', '1981-03-13'),
('M', 'Tom', null, 'Holland', '1997-08-26'),
('M', 'Robert',  'Downey', 'Jr','1965-4-4'),
('M', 'Ryan', null, 'Gosling', '1980-11-12'),
('F', 'Margot', null, 'Robbie', '1990-06-02'),
('F' , 'Sienna', null, 'Miller', '1980-04-11'),
('F', 'Emma', null, 'Stone', '1988-11-06'),
('F', 'Gal', null, 'Gadot', '1985-04-30'),
('M', 'Tom', null, 'Hanks', '1969-10-20'),
('F', 'Jennifer', null, 'Lawrence', '1982-07-24'),
('M', 'Matt', null, 'Damon', '1971-07-24'),
('F', 'Turkan', null, 'Soray', '1979-10-20'),
('F', 'Jennifer', 'Brown', 'Aniston', '1977-07-24'),
('M', 'Robert', null, 'Pattinson', '1971-07-24'),
('M', 'Damien', null, 'Chazelle', '1985-01-19'),
('M', 'Johnny', null, 'Depp', '1974-07-14'),
('M', 'Brad', null, 'Pitt', '1984-02-15'),
('F', 'Emilia', null, 'Clarke', '1971-07-24'),
('M', 'Rami', null, 'Malek', '1984-02-15'),
('M', 'Ayhan', null, 'Isık', '1928-08-20'),
('M', 'Ethan ', null, 'Hawke', '1983-12-24');

/*Dataset for Shows*/
INSERT INTO Shows
(Title, Language, Rating, Certification, Budget,Location)
VALUES
('The Shawshank Redemption', 'English', 9.3, 'PG-13', 35000000 ,'USA'),
('Avengers:End Game', 'English', 8.5, 'PG-13', 850000000,'USA'),
('Avengers: Infinity War', 'English', 8.3, 'PG-13', 321000000,'USA'),
('A Quiet Place', 'English', 7.6, 'PG-15', 17000000,'USA'),
('The Dark Knight', 'English', 9.0, 'PG-13', 30000000,'USA'),
('Last Dance', 'English', 9.1, 'TV-14', 6709874,'USA'),
('Game of Thrones', 'English', 9.5, 'TV-MA', 98709874,'USA'),
('Breaking Bad', 'English', 9.5, 'TV-MA', 528874,'USA'),
('Chernobyl', 'English', 9.3, 'TV-PG', 129874,'USA'),
('Sherlock', 'English', 8.6, 'TV-14', 769874,'USA'),
('Rick and Morty', 'English', 9.1, 'TV-14', 879874,'USA'),
('Se7en', 'English', 8.8, 'PG', 62000000,'USA'),
('Fight Club', 'English', 8.9, 'PG', 175070000,'USA'),
('Pulp Fiction', 'English', 8.6, 'R', 18000000,'USA'),
('Before We Go', 'English', 6.8, 'PG-13', 209874,'USA'),
('I am a Legend', 'English', 7.4, 'PG', 11000000,'USA'),
('Black Panther', 'English', 7.9, 'PG-13', 123000000,'USA'),
('Lord Of The Rings', 'English', 9.0, 'PG', 57000000,'USA'),
('Avatar', 'English', 7.2, 'PG', 978000000,'USA'),
('Inception', 'English', 8.9, 'PG-13', 290000000,'USA');


/*Dataset for Genre*/
INSERT INTO Genres
 (Genre_Id, Name)
VALUES
  (1, 'Action'),
  (2, 'Comedy'),
  (3, 'Science-Fiction'),
  (4, 'Romance'),
  (5, 'Drama'),
  (6, 'Adventure'),
  (7, 'Family'),
  (8, 'Mystery'),
  (9, 'Musical'),
  (10, 'Fantasy'),
  (11, 'Animation'),
  (12, 'Horror');

/*Dataset for In_Genre , determines show's genre*/
INSERT INTO In_Genre
(Show_Id, Genre_Id)
VALUES
  (1,2),
  (1,3),
  (2,1),
  (2,5),
  (2,6),
  (3,3),
  (3,7),
  (3,8),
  (4,1),
  (4,6),
  (4,2),
  (5,2),
  (5,3),
  (5,8),
  (6,3),
  (6,7),
  (6,1),
  (7,1),
  (7,3),
  (7,6),
  (8,2),
  (9,11),
  (9,2),
  (9,12),
  (10,11),
  (10,6),
  (10,10),
  (11,2),
  (12,1),
  (12,6),
  (12,10),
  (13,2),
  (13,3),
  (14,2),
  (14,3),
  (14,4),
  (15,2),
  (15,3),
  (15,4),
  (16,3),
  (16,4),
  (17,3);


/*Dataset for Movies*/
INSERT INTO Movies
(Show_Id, Duration, Year)
VALUES
(1, 109, 2006),
(2, 147, 2016),
(3, 90, 2018),
(4, 141, 2022),
(5, 128, 2016),
(12, 95, 2003),
(13, 95, 2010),
(14, 95, 2010),
(15, 95, 2010),
(16, 105, 2017),
(17, 149, 2018);




/*Dataset for Award*/
INSERT INTO Award
(Name, Title, Year)
VALUES
  ('Golden Globe', 'Best Actress in Support Role', 2015),
  ('Oscar', 'Best Actress in Support Role', 2015),
  ('Oscar', 'Best Picture', 2015),
  ('Oscar', 'Best Animated Feature Film', 2022),
  ('Oscar', 'Best Actress', 2022),
  ('Oscar', 'Best Film Music', 2022),
  ('Oscar', 'Best Short Movie', 2022),
  ('Oscar', 'Best Actress', 2022),
  ('Oscar', 'Best Director', 2022),
  ('Golden Globe', 'Best Actress in Support Role', 2022),
  ('Oscar', 'Best Cinematography', 2022),
  ('Oscar', 'Best Director', 2022),
  ('Oscar', 'Best Picture', 2022),
  ('Oscar', 'Best Actor', 2022),
  ('Oscar', 'Best Costume Design', 2022),
  ('Oscar', 'Best Actor in Support Role', 2022),
  ('Oscar', 'Best Actor in Support Role', 2022),
  ('Critics Choice', 'Best Picture', 2016),
  ('Critics Choice', 'Best Movie', 2022),
  ('Golden Globe', 'Best TV Series - Drama', 2022),
  ('Critics Choice', 'Best Drama Series', 2022),
  ('Critics Choice', 'Best Support Actor', 2022);





/*Dataset for PersonsNominated*/
INSERT INTO PersonsNominated
(Person_Id, Award_Id)
VALUES
  (5,1),
  (5,2),
  (1,5),
  (21,6),
  (5,7),
  (12,8),
  (24,12),
  (8,16),
  (11,17),
  (18,11);

/*Dataset for ShowsNominated*/
INSERT INTO ShowsNominated
(Show_Id, Award_Id)
VALUES
  (13,3),
  (10,4),
  (5,9),
  (5,10),
  (4,13),
  (7,14),
  (6,15);


/*Dataset for Actor*/
INSERT INTO Actor
(Person_Id, Worth, StartDate)
VALUES
  (1, 90, 1969),
  (2, 300, 1970),
  (3, 30, 2000),
  (5, 28, 2004),
  (6, 10, 2004),
  (8, 15, 1995),
  (9, 3, 2013),
  (10, 6, 2008),
  (11, 13, 2009),
  (21, 16, 2004),
  (22, 50, 1995),
  (23, 20, 2013),
  (24, 60, 2008),
  (25, 50, 2009),
  (26, 10, 2009);

/*Dataset for Acting*/
INSERT INTO Acting
(Actor_Id, Show_Id, Role_First_Name, Role_Last_Name)
VALUES
  (1,1, 'Agah', 'Beyoglu'),
  (21,1, 'Emily', null),
  (2,2, 'Tony', 'Stark'),
  (22,2, 'Steve', 'Rogers'),
  (3,3, 'Don', 'Carlone'),
  (21,3, 'Jack', 'Carlone'),
  (6,4, 'Hermonie', 'Granger'),
  (23,4, 'Steve', 'Trevor'),
  (5,5, 'Mia', 'Cheby'),
  (24,5, 'Sebastian', 'Vettel'),
  (9,6, 'Black', 'Panther'),
  (8,7, 'Gandalf', null),
  (11,7, 'Daenerys', 'Targaryen'),
  (10,8, 'Ginny', 'Williams'),
  (25,9, 'Fiona', null),
  (25,11, 'Michael', 'Scott'),
  (3,11, 'Jim', 'Halpert'),
  (2,12, 'Tony', 'Stark'),
  (22,12, 'Steve', 'Rogers'),
  (5,13, 'Samy', 'Joe'),
  (22,14, 'Nick', null),
  (26,15, 'Rebecca', 'Pearson'),
  (26,16, 'Jamie', 'Sullivan'),
  (24,17, 'Noah', null);

 

/*Dataset for Director*/
INSERT INTO Director
(Person_Id, Direction_Type,StartDate)
VALUES
  (3, 'Movie', 2010),
  (4, 'Movie', 1994),
  (28, 'Movie', 1994),
  (7, 'Movie', 1995),
  (13, 'Music', 1998),
  (12, 'Movie', 2009),
  (14, 'Movie', 2005),
  (15, 'Movie', 2005),
  (22, 'Movie', 2014);

/*Dataset for Direction*/
INSERT INTO Direction
(Director_Id, Show_Id)
VALUES
  (3,3),
  (4,2),
  (7,4),
  (12,5),
  (13,7),
  (14, 6),
  (15, 6),
  (22,14);

/*Dataset for Producer*/
INSERT INTO Producer
(Person_Id)
VALUES
  (3),
  (4),
  (7);


/*Dataset for Writer*/
INSERT INTO Writer
(Person_Id)
VALUES
  (12),
  (14),
  (15),
  (16);

/*Dataset for Written*/
INSERT INTO Written
(Writer_Id, Show_Id)
VALUES
  (12,5),
  (14,6),
  (15,6),
  (16,1);



/*Dataset for User*/
INSERT INTO Users
( User_Name,Pswrd)
VALUES
  ('admin',0000),
  ('bond',0007),
  ('kristen', 1234),
  ('jennifer',1234);





/*Dataset for Reviews*/
INSERT INTO Reviews
  (Review_Id, User_Name, Show_Id, UpVotes, DownVotes, Rating, Review_Description, Review_Date)
VALUES
  (1,'jennifer', 1, 5, 0, 5, 'very good movie, must watch',  '2018-09-15'),
  (2, 'kristen', 4, 5, 0, 5, 'the best female superhero movie of all timer',  '2022-07-15'),
  (3, 'jennifer', 6, 5, 0, 5, 'Best show i have ever seen',  '2016-04-15'),
  (4, 'kristen', 2, 5, 0, 5, 'the best marvel movie so far',  '2022-07-15');




/*Dataset for TVSeries*/
INSERT INTO TVSeries
(Show_Id, Start_Date, End_Date, Air_Channel, Air_Day, Air_Time)
VALUES
(6, '2020-07-15', '2020-07-15', 'Netflix', null, null),
(7, '2014-04-06', null, 'HBO', 'Sunday', null),
(8, '2013-04-06', null, 'Exxen', 'Sunday', null),
(9, '2019-04-06', null, 'BluTv', 'Sunday', null),
(10, '2018-04-06', null, 'Disney+', 'Sunday', null),
(11, '2015-09-20', null, 'Amazon', 'Tuesday', '21:00:00');

