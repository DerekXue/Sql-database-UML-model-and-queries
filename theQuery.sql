Create database dbRaceRegistrationSystem
go

Use dbRaceRegistrationSystem
Create table Club (
[ClubID] varchar(10) primary key not null ,
[ClubName] varchar(20) not null ,
[ClubAddress] varchar(50) ,
[ContactNumber] int ,
);
Select * from Club

Use dbRaceRegistrationSystem
Create table Member (
[TRANumber] int primary key not null identity(1,1) ,
[MarshalStatus] varchar(5) not null ,
[MemberName] varchar(20) not null ,
[MembershipType] varchar(10) ,
[DateOfBirth] date ,
[MembershipRegistrationDate] date ,
[MedicalCondition] varchar(50) ,
);
Select * from Member

Use dbRaceRegistrationSystem
Create table Venue (
[VenueID] int primary key not null identity(1,1) ,
[VenueName] varchar(20) not null ,
[VenueAddress] varchar(50) not null ,
[RentalFee] int ,
[MaxGuestCapacity] int ,
[ContactNumber] int ,
);
Select * from Venue 

Use dbRaceRegistrationSystem
Create table RaceEvent (
[RaceEventID] int primary key not null identity(1,1) ,
[VenueID] int foreign key references Venue(VenueID) not null ,
[EventDate] date not null ,
);
Select * from RaceEvent

Use dbRaceRegistrationSystem
Create table RacerEntry (
[RaceEventID] int foreign key references RaceEvent(RaceEventID) not null ,
[TRANumber] int foreign key references Member(TRANumber) ,
[ClubID] varchar(10) foreign key references Club(ClubID) not null ,
[AgeCategory] varchar(10) not null ,
[BibNumber] int not null ,
[FinishStatus] varchar(5) not null ,
[FinishPosition] int ,
);
Select * from RacerEntry

Use dbRaceRegistrationSystem
Create table RaceMarshal (
[TRANumber] int foreign key references Member(TRANumber) not null ,
[RaceEventID] int foreign key references RaceEvent(RaceEventID) not null ,
[MarshalNumber] int not null ,
);
Select * from RaceMarshal


INSERT INTO Club (ClubID, ClubName, ClubAddress, ContactNumber)
VALUES 
('1', 'AClub',  'ARoad', '99999999') ,
('2', 'BClub',  'BRoad', '88888888') ,
('3', 'CClub',  'CRoad', '77777777') ,
('4', 'DClub',  'DRoad', '66666666') ,
('IND', 'IndependentRacer', '', '')
Select * from Club

SET IDENTITY_INSERT Member ON
INSERT INTO Member (TRANumber, MarshalStatus, MemberName, MembershipType, DateOfBirth, MembershipRegistrationDate ,MedicalCondition)
VALUES 
('1111', 'yes', 'AName', '1stClass' ,'1990-1-1', '2017-1-1', 'Asthma') ,
('2222', 'yes', 'BName', '2ndClass' ,'1990-2-1', '2017-2-1', 'Asthma') ,
('3333', 'yes', 'CName', '3rdClass' ,'1990-3-1', '2017-3-1', '') ,
('4444', 'yes', 'DName', 'standard' ,'1990-4-1', '2017-4-1', '') ,
('5555', 'yes', 'EName', 'standard' ,'1990-5-1', '2017-5-1', '') ,
('6666', 'no',  'FName', 'standard' ,'1990-6-1', '2017-6-1', '') ,
('7777', 'no',  'GName', 'standard' ,'1990-7-1', '2017-7-1', '') ,
('8888', 'no',  'HName', 'standard' ,'1990-8-1', '2017-8-1', '') ,
('9999', 'no',  'IName', 'standard' ,'1990-9-1', '2017-8-1', '') ,
('0000', 'no',  'NonMember', '' ,'', '', '') 
Select * from Member

SET IDENTITY_INSERT Member OFF
SET IDENTITY_INSERT Venue ON
INSERT INTO Venue (VenueID, VenueName, VenueAddress, RentalFee, MaxGuestCapacity, ContactNumber)
VALUES 
('1', 'AVenue', 'Address1', '1000','300', '99999999') ,
('2', 'BVenue', 'Address2', '800' ,'250', '88888888') ,
('3', 'CVenue', 'Address3', '600' ,'200', '77777777') ,
('4', 'DVenue', 'Address4', '400' ,'150', '66666666') ,
('5', 'EVenue', 'Address5', '200' ,'100', '55555555')
Select * from Venue 

SET IDENTITY_INSERT Venue OFF
SET IDENTITY_INSERT RaceEvent ON
INSERT INTO RaceEvent (RaceEventID, VenueID, EventDate)
VALUES 
('1', '5', '2017-12-1'),
('2', '4', '2017-12-2'),
('3', '3', '2017-12-3'),
('4', '2', '2017-12-4'),
('5', '1', '2017-12-5')
Select * from RaceEvent

INSERT INTO RacerEntry (RaceEventID, TRANumber, ClubID, AgeCategory, BibNumber, FinishStatus, FinishPosition)
VALUES 
('1', '6666', '1', 'Adult',      '1', 'yes', '1'),
('1', '7777', '2', 'Adult',      '2', 'no', ''),
('1', '8888', '3', 'Adult',      '3', 'yes', '2'),
('1', '9999', '4', 'Teenager',   '4', 'no', ''),
('1', '0000', 'IND', 'Adult',    '5', 'yes', '3'),
('1', '0000', 'IND', 'Teenager', '6', 'no', ''),
('1', '0000', 'IND', 'Adult',    '7', 'yes', '4') ,
('1', '1111', '1', 'Adult',   '', '', ''),
('1', '2222', '2', 'Adult',   '', '', ''),
('1', '3333', '3', 'Adult',   '', '', ''),
('1', '4444', '4', 'Adult',   '', '', ''),
('1', '5555', '4', 'Adult',   '', '', ''),

('2', '6666', '1', 'Adult',      '1', 'no', ''),
('2', '7777', '2', 'Adult',      '2', 'yes', '1'),
('2', '8888', '3', 'Adult',      '3', 'no', ''),
('2', '9999', '4', 'Teenager',   '4', 'yes', '2'),
('2', '0000', 'IND', 'Adult',    '5', 'no', ''),
('2', '0000', 'IND', 'Teenager', '6', 'yes', '3'),
('2', '0000', 'IND', 'Adult',    '7', 'no', ''),
('2', '1111', '1', 'Adult',   '', '', ''),
('2', '2222', '2', 'Adult',   '', '', ''),
('2', '3333', '3', 'Adult',   '', '', ''),
('2', '4444', '4', 'Adult',   '', '', ''),
('2', '5555', '4', 'Adult',   '', '', '') 
Select * from RacerEntry

INSERT INTO RaceMarshal (TRANumber, RaceEventID, MarshalNumber)
VALUES 
('1111', '1', '1') ,
('2222', '1', '2') ,
('3333', '1', '3') ,
('4444', '1', '4') ,
('5555', '1', '5') ,
('1111', '2', '1') ,
('2222', '2', '2') ,
('3333', '2', '3') ,
('4444', '2', '4') ,
('5555', '2', '5') 
Select * from RaceMarshal 




Select Distinct RaceEvent.RaceEventID ,VenueID,EventDate From RaceEvent 
Left Join 
(RacerEntry Inner Join Member
On RacerEntry.TRANumber <> 0000
)
On RaceEvent.RaceEventID=RacerEntry.RaceEventID
Where RacerEntry.RaceEventID IS NULL

Order By RaceEventID, VenueID ,EventDate Asc



INSERT INTO RacerEntry (RaceEventID, TRANumber, ClubID, AgeCategory, BibNumber, FinishStatus, FinishPosition)
VALUES 
('2', '0000', 'IND', 'Adult', '8', 'yes', '4') 
Select * From RacerEntry
Order By RaceEventID, BibNumber Asc 


SELECT TRANumber ,
COUNT( 
	CASE 
	WHEN FinishStatus='yes' THEN 1  
	ELSE null 
	END
	) AS CompleteRaceNumber,
	
SUM (
	CASE
    WHEN FinishStatus='yes' and FinishPosition >= 1 and FinishPosition <=50 THEN 100-2*(FinishPosition-1)
    WHEN FinishStatus='yes' and FinishPosition > 50 THEN '1'
    ELSE '0'
END 
	) AS AggregatePoints

FROM RacerEntry 
Where TRANumber <> 0000
GROUP BY TRANumber 
ORDER BY TRANumber Asc

Select RacerEntry.RaceEventID, VenueName, EventDate, VenueAddress, BibNumber, 
	RacerEntry.ClubID, MemberName, AgeCategory, ClubName, RacerEntry.TRANumber, 
	FinishStatus, FinishPosition,

 SUM (
CASE
    WHEN FinishStatus='yes' and FinishPosition >= 1 and FinishPosition <=50 THEN 100-2*(FinishPosition-1)
    WHEN FinishStatus='yes' and FinishPosition > 50 THEN '1'
    ELSE '0'
END 
	) AS Points

From RacerEntry, Member, Club, Venue, RaceEvent
Where    RacerEntry.TRANumber=Member.TRANumber AND
	  RacerEntry.ClubID=Club.ClubID AND 
	  RaceEvent.VenueID=Venue.VenueID AND 
	  RaceEvent.RaceEventID=RacerEntry.RaceEventID
Group by RacerEntry.RaceEventID, VenueName, EventDate, VenueAddress, BibNumber, 
	  RacerEntry.ClubID, MemberName, AgeCategory, ClubName, RacerEntry.TRANumber, 
	  FinishStatus, FinishPosition
Order by RaceEventID, EventDate, BibNumber, ClubID, MemberName, TRANumber, FinishPosition Asc
