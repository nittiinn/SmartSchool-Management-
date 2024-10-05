USE SchoolManagDB;

CREATE TABLE Student (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100),
    RollNo NVARCHAR(50),
    ApplicationNo NVARCHAR(50),
    Email NVARCHAR(100),
    MobileNo NVARCHAR(15),
    DateOfBirth DATE,
    Gender NVARCHAR(10),
    Password NVARCHAR(100)
);

SELECT * FROM Student;

CREATE TABLE Attendance (
    Id INT PRIMARY KEY IDENTITY(1,1),
    StudentId INT,
    Date DATETIME,
    Status NVARCHAR(10),
    FOREIGN KEY (StudentId) REFERENCES Student(Id)
);

DELETE FROM Attendance  
WHERE Id IN (9,3);


CREATE PROCEDURE sp_InsertAtten
    @StudentId INT,
    @Status VARCHAR(10)
AS
BEGIN
    SET NOCOUNT ON;
    IF EXISTS (SELECT 1 FROM Attendance WHERE StudentId = @StudentId AND CAST(Date AS DATE) = CAST(GETDATE() AS DATE))
    BEGIN
        -- Optionally update the existing record
        UPDATE Attendance 
        SET Status = @Status 
        WHERE StudentId = @StudentId AND CAST(Date AS DATE) = CAST(GETDATE() AS DATE);
    END
    ELSE
    BEGIN
        -- Insert new attendance record if it doesn't exist
        INSERT INTO Attendance (StudentId, Status, Date) 
        VALUES (@StudentId, @Status, GETDATE());
    END
END





SELECT 
    s.Id,
    s.RollNo, 
    s.Name AS StudentName,
    s.Email,  
    a.Status
FROM 
    Student s 
INNER JOIN 
    Attendance a ON s.Id = a.StudentId 
    AND CAST(a.Date AS DATE) = CAST(GETDATE() AS DATE)

