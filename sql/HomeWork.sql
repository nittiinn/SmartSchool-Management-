USE SchoolManagDB;

CREATE TABLE HomeworkSubmissions (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Subject NVARCHAR(50),
    Date DATE,
    HomeworkTitle NVARCHAR(100),
    SubmissionDate DATE,
    Description NVARCHAR(MAX),
    CreatedAt DATETIME DEFAULT GETDATE()
);

SELECT * FROM HomeworkSubmissions;
CREATE PROCEDURE USP_InsertHomeworkSubmission
    @Subject NVARCHAR(50),
    @Date DATE,
    @HomeworkTitle NVARCHAR(100),
    @SubmissionDate DATE,
    @Description NVARCHAR(MAX)
AS
BEGIN
    INSERT INTO HomeworkSubmissions (Subject, Date, HomeworkTitle, SubmissionDate, Description)
    VALUES (@Subject, @Date, @HomeworkTitle, @SubmissionDate, @Description);
END;
