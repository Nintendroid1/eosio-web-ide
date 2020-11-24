USE HospitalVT

DROP PROCEDURE IF EXISTS addcontact, addem, addstaff, addvital, addpatient
GO

CREATE PROCEDURE addcontact (@user VARCHAR(50),
				@address VARCHAR(50), 
				@phone VARCHAR(12), 
				@email VARCHAR(50))
   AS  
   BEGIN
      INSERT HospitalVT.ContactInfo (Address, Phone, Email)
		VALUES (@address, @phone, @email)
	  
	  PRINT 'Contact is created.'
   END
GO

CREATE PROCEDURE addem (@user VARCHAR(50),
				@emergency VARCHAR(50),
				@relationship VARCHAR(50),
				@e_address VARCHAR(50), 
				@e_phone VARCHAR(12), 
				@e_email VARCHAR(50))
   AS  
   BEGIN
	  EXEC addcontact @user, @e_address, @e_phone, @e_email
	  DECLARE @con_id INT
          SET @con_id = (SELECT Contact_ID from HospitalVT.ContactInfo)

      INSERT HospitalVT.Emergency (Name, Relationship, Contact_ID) 
		VALUES (@emergency, @relationship, @con_id)
	  
	  PRINT 'Emergency contact is created.' 
   END  
GO 

CREATE PROCEDURE addstaff (@user VARCHAR(50),
				@primary VARCHAR(50),
				@hours VARCHAR(50),
				@p_address VARCHAR(50), 
				@p_phone VARCHAR(12), 
				@p_email VARCHAR(50))
   AS  
   BEGIN
	  EXEC addcontact @user, @p_address, @p_phone, @p_email
	  DECLARE @con_id INT
	  SET @con_id = (SELECT Contact_ID from HospitalVT.ContactInfo)

      INSERT HospitalVT.MedicalPro (Name, Hours, Contact_ID) 
		VALUES (@primary, @hours, @con_id)
	  
	  PRINT 'Primary contact is created.'  
   END  
GO

CREATE PROCEDURE addvital (@user VARCHAR(50))
   AS  
   BEGIN
      INSERT HospitalVT.Vitals (BodyTemp, PulseRate, RespirationRate, BloodPressure, LastModified) 
		VALUES (98.6, 60.0, 12.0, 120.0, CURRENT_TIMESTAMP)
	  
	  PRINT 'Vitals are created.'  
   END  
GO

CREATE PROCEDURE addpatient (@user VARCHAR(50),
				@name VARCHAR(50), 
				@gender VARCHAR(50), 
				@dob date, 
				@address VARCHAR(50), 
				@phone VARCHAR(12),
				@email VARCHAR(50),				
				@emergency VARCHAR(50), 
				@relationship VARCHAR(50), 
				@e_address VARCHAR(50), 
				@e_phone VARCHAR(12), 
				@e_email VARCHAR(50),
				@primary VARCHAR(50))
   AS  
   BEGIN
	  EXEC addcontact @user, @address, @phone, @email
	  EXEC addem @user, @emergency, @relationship, @e_address, @e_phone, @e_email
	  EXEC addvital @user
	  
	  DECLARE @con_id INT
	  SET @con_id = (SELECT Contact_ID from HospitalVT.ContactInfo WHERE Address=@address AND Phone=@phone AND Email=@email)
	  DECLARE @em_id INT
	  SET @em_id = (SELECT Emergency_ID from HospitalVT.Emergency WHERE Name=@emergency)
	  DECLARE @med_id INT
	  SET @med_id = (SELECT Admin_ID from HospitalVT.MedicalPro WHERE Name=@primary)
	  DECLARE @vit_id INT
	  SET @vit_id = (SELECT Vital_ID from HospitalVT.Vitals WHERE LastModified=(SELECT MAX(LastModified) from HospitalVT.Vitals))
	  
      INSERT HospitalVT.Patient (Name, Gender, DOB, Contact_ID, Emergency_ID, Primary_ID, Vital_ID) 
		VALUES (@name, @gender, @dob, @con_id, @em_id, @med_id, @vit_id)
	  
	  PRINT 'Patient: ' + @name + ' is created.'  
   END  
GO

