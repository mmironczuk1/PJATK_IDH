﻿CREATE PROCEDURE [stg].[InsertTime]
AS
DECLARE @korektor INT
DECLARE @data DATE
DECLARE @pnm VARCHAR(30),
    @anm VARCHAR(30),
    @ant VARCHAR(30),
    @pnt VARCHAR(30)
SELECT @korektor = 0
WHILE @korektor < 1500 -- dwa lata 
    BEGIN
    SELECT @data = DATEADD(DAY, @korektor, '2011-01-01')
    IF DATEPART(MM, @data) = 1
SELECT
        @anm = 'January'
    ELSE IF DATEPART(MM, @data) = 2
SELECT @pnm = 'Luty',
        @anm = 'February'
    ELSE IF DATEPART(MM, @data) = 3
SELECT @pnm = 'Marzec',
        @anm = 'March'
    ELSE IF DATEPART(MM, @data) = 4
SELECT @pnm = 'Kwiecień',
        @anm = 'April'
    ELSE IF DATEPART(MM, @data) = 5
SELECT @pnm = 'Maj',
        @anm = 'May'
    ELSE IF DATEPART(MM, @data) = 6
SELECT @pnm = 'Czerwiec',
        @anm = 'June'
    ELSE IF DATEPART(MM, @data) = 7
SELECT @pnm = 'Lipiec',
        @anm = 'July'
    ELSE IF DATEPART(MM, @data) = 8
SELECT @pnm = 'Sierpień',
        @anm = 'August'
    ELSE IF DATEPART(MM, @data) = 9
SELECT @pnm = 'Wrzesień',
        @anm = 'September'
    ELSE IF DATEPART(MM, @data) = 10
SELECT @pnm = 'Październik',
        @anm = 'October'
    ELSE IF DATEPART(MM, @data) = 11
SELECT @pnm = 'Listopad',
        @anm = 'November'
    ELSE
SELECT @pnm = 'Grudzień',
        @anm = 'December'
    IF DATEPART(W, @data) = 1
SELECT @pnt = 'Niedziela',
        @ant = 'Sunday'
    ELSE IF DATEPART(W, @data) = 2
SELECT @pnt = 'Poniedziałek',
        @ant = 'Monday'
    ELSE IF DATEPART(W, @data) = 3
SELECT @pnt = 'Wtorek',
        @ant = 'Tuesday'
    ELSE IF DATEPART(W, @data) = 4
SELECT @pnt = 'Środa',
        @ant = 'Wednesday'
    ELSE IF DATEPART(W, @data) = 5
SELECT @pnt = 'Czwartek',
        @ant = 'Thursday'
    ELSE IF DATEPART(W, @data) = 6
SELECT @pnt = 'Piątek',
        @ant = 'Friday'
    ELSE
SELECT @pnt = 'Sobota',
        @ant = 'Saturday'
    INSERT INTO [stg].[Date]
    VALUES(
            @data,
            @anm,
            DATEPART(DAY, @data),
            DATEPART(MM, @data),
            DATEPART(YEAR, @data)
    )
    SELECT @korektor = @korektor + 1
END