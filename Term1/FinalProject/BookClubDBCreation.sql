CREATE DATABASE bookclub;
go

USE bookclub;
go

CREATE TABLE Members (
	member_ID int IDENTITY(1,1) PRIMARY KEY,
	member_Fname nvarchar(255),
	member_Lname nvarchar(255),
	member_DOB date,
	member_Email nvarchar(255),
	member_Phone char(10),
	member_Ad_Line1 nvarchar(255),
	member_Ad_Line2 nvarchar(255),
	member_City_ID int,
	member_Postal_Code char(6),
	member_Fav_Author int
	);

CREATE TABLE Cities (
	city_ID int IDENTITY(1,1) PRIMARY KEY,
	city_Name nvarchar(255),
	city_Province_ID int,
	UNIQUE (city_Name, city_ProvinceID)
	);

CREATE TABLE Provinces (
	province_ID int IDENTITY(1,1) PRIMARY KEY,
	province_Name nvarchar(255) UNIQUE,
	province_Abbreviation char(2) UNIQUE
	);

CREATE TABLE BookGenres (
	genre_ID int IDENTITY(1,1) PRIMARY KEY,
	genre_Name nvarchar(255) UNIQUE
	);

CREATE TABLE MemberGenrePreference (
	pref_ID int IDENTITY(1,1) PRIMARY KEY,
	pref_Member_ID int,
	pref_Genre_ID int
	);

CREATE TABLE Authors (
	author_ID int IDENTITY(1,1) PRIMARY KEY,
	author_Fname nvarchar(255),
	author_Lname nvarchar(255),
	UNIQUE (author_Fname, author_Lname)
	);

CREATE TABLE Books (
	book_ID int IDENTITY(1,1) PRIMARY KEY,
	book_Title nvarchar(255),
	book_Main_Author_ID int,
	book_Main_Genre_ID int,
	UNIQUE (book_Title, book_Main_Author)
	);

CREATE TABLE MeetingDays (
	day_ID int IDENTITY(1,1) PRIMARY KEY,
	day_Name nvarchar(255) UNIQUE
	);

CREATE TABLE MemberAvailability (
	available_ID int IDENTITY(1,1) PRIMARY KEY,
	available_member_ID int,
	available_day_ID int
	);
go

ALTER TABLE Members
ADD CONSTRAINT FK_City FOREIGN KEY (member_CityID) REFERENCES Cities(city_ID) ON UPDATE CASCADE;

ALTER TABLE Members
ADD CONSTRAINT FK_Author FOREIGN KEY (member_Fav_Author) REFERENCES Authors(author_ID) ON UPDATE CASCADE;

ALTER TABLE Cities
ADD CONSTRAINT FK_Province FOREIGN KEY (city_ProvinceID) REFERENCES Provinces(province_ID) ON UPDATE CASCADE;

ALTER TABLE MemberGenrePreference
ADD CONSTRAINT FK_Member FOREIGN KEY (pref_Member_ID) REFERENCES Members(member_ID) ON UPDATE CASCADE;

ALTER TABLE MemberGenrePreference
ADD CONSTRAINT FK_Genre FOREIGN KEY (pref_Genre_ID) REFERENCES BookGenres(genre_ID) ON UPDATE CASCADE;

ALTER TABLE MemberAvailability
ADD CONSTRAINT FK_MemberAvailable FOREIGN KEY (available_member_ID) REFERENCES Members(member_ID) ON UPDATE CASCADE;

ALTER TABLE MemberAvailability
ADD CONSTRAINT FK_Day FOREIGN KEY (available_day_ID) REFERENCES MeetingDays(day_ID) ON UPDATE CASCADE;

ALTER TABLE Books
ADD CONSTRAINT FK_BookAuthor FOREIGN KEY (book_Main_Author) REFERENCES Authors(author_ID) ON UPDATE CASCADE;

ALTER TABLE Books
ADD CONSTRAINT FK_BookGenre FOREIGN KEY (book_Main_Genre) REFERENCES BookGenres(genre_ID) ON UPDATE CASCADE;

go

INSERT bookBookGenres(genre_Name) VALUES ('General Fiction')
GO
INSERT bookBookGenres(genre_Name) VALUES ('Historical Fiction')
GO
INSERT bookBookGenres(genre_Name) VALUES ('Science-Fiction')
GO
INSERT bookBookGenres(genre_Name) VALUES ('Fantasy')
GO
INSERT bookBookGenres(genre_Name) VALUES ('Mystery')
GO
INSERT bookBookGenres(genre_Name) VALUES ('Horror')
GO
INSERT bookBookGenres(genre_Name) VALUES ('Romance')
GO
INSERT bookBookGenres(genre_Name) VALUES ('Young Adult')
GO
INSERT bookBookGenres(genre_Name) VALUES ('Biography')
GO
INSERT bookBookGenres(genre_Name) VALUES ('Self-Help')
GO
INSERT bookBookGenres(genre_Name) VALUES ('True Crime')
GO

INSERT MeetingDays(day_Name) VALUES ('Monday')
GO
INSERT MeetingDays(day_Name) VALUES ('Tuesday')
GO
INSERT MeetingDays(day_Name) VALUES ('Wednesday')
GO
INSERT MeetingDays(day_Name) VALUES ('Thursday')
GO
INSERT MeetingDays(day_Name) VALUES ('Friday')
GO
INSERT MeetingDays(day_Name) VALUES ('Saturday')
GO
INSERT MeetingDays(day_Name) VALUES ('Sunday')
GO

INSERT Provinces(province_Name, province_Abbreviation) VALUES ('Nova Scotia','NS')
GO

CREATE VIEW MembersWhoLikeHistoricalFiction AS
SELECT member_Fname, member_Lname, member_Email, member_Fav_Author
FROM MemberGenrePreference
JOIN BookGenres ON MemberGenrePreference.pref_Genre_ID = BookGenres.genre_ID
JOIN Members ON MemberGenrePreference.pref_Member_ID = Members.member_ID
WHERE genre_name = 'Historical Fiction';