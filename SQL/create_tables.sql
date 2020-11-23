USE HospitalVT

CREATE TABLE Vitals (Vital_ID INT NOT NULL IDENTITY(1,1), BodyTemp FLOAT, PulseRate FLOAT, RespirationRate FLOAT, BloodPressure FLOAT, LastModified date, PRIMARY KEY (Vital_ID));

CREATE TABLE MedicalPro (Admin_ID INT NOT NULL IDENTITY(1,1), Name VARCHAR(50), Hours VARCHAR(50), Contact_ID INT, PRIMARY KEY (Admin_ID));

CREATE TABLE SignIn (Sign_ID INT NOT NULL IDENTITY(1,1), Patient_ID INT, Location_ID INT, Sign_Date datetime, PRIMARY KEY (Sign_ID));

CREATE TABLE ContactInfo (Contact_ID INT NOT NULL IDENTITY(1,1), Address VARCHAR(50), Phone VARCHAR(10), Email VARCHAR(50), PRIMARY KEY (Contact_ID));

CREATE TABLE Location (Location_ID INT NOT NULL IDENTITY(1,1), Name VARCHAR(50), Room VARCHAR(50), Address VARCHAR(50), Manager INT, CurrentOccupancy INT, Limit INT, Assignment datetime, Patient_ID INT, PRIMARY KEY (Location_ID));

CREATE TABLE Emergency (Emergency_ID INT NOT NULL IDENTITY(1,1), Name VARCHAR(50), Relationship VARCHAR(50), Contact_ID INT, PRIMARY KEY (Emergency_ID));

CREATE TABLE Patient (Patient_ID INT NOT NULL IDENTITY(1,1), Name VARCHAR(50), Gender VARCHAR(50), DOB date, Contact_ID INT, Emergency_ID INT, Primary_ID INT, Vital_ID INT, PRIMARY KEY (Patient_ID));

GO
