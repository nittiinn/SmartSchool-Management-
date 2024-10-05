USE SchoolManagDB;


ALTER PROCEDURE sp_GetAttendance
AS
BEGIN
    -- Declare the output variables
    DECLARE @PresentCount INT;
    DECLARE @AbsentCount INT;

    -- Count present students
    SELECT @PresentCount = COUNT(*)
    FROM Attendance
    WHERE Status = 'Present';  

    -- Count absent students
    SELECT @AbsentCount = COUNT(*)
    FROM Attendance
    WHERE Status = 'Absent';  

    -- Return the output values
    SELECT @PresentCount AS PresentCount, @AbsentCount AS AbsentCount;
END;

EXEC sp_GetAttendance;