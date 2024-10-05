CREATE DATABASE SchoolManagDB;
USE SchoolManagDB;

CREATE TABLE UploadDetails (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Semester VARCHAR(50),
    Subject VARCHAR(50),
    DateField DATE,
    TimeField TIME,
    PDFPath VARCHAR(255),
    VideoPath VARCHAR(255)
);

DELETE FROM UploadDetails
WHERE ID IN (1, 2, 3, 4, 5);


SELECT * FROM UploadDetails

CREATE PROCEDURE USP_SaveUploadDetails
    @Semester VARCHAR(50),
    @Subject VARCHAR(50),
    @DateField DATE,
    @TimeField TIME,
    @PDFPath VARCHAR(255),
    @VideoPath VARCHAR(255)
AS
BEGIN
    INSERT INTO UploadDetails (Semester, Subject, DateField, TimeField, PDFPath, VideoPath)
    VALUES (@Semester, @Subject, @DateField, @TimeField, @PDFPath, @VideoPath);
END;
