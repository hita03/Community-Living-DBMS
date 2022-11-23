
-- 1. Get the names, designation of staff who have been assigned a ticket at the apartment.
SELECT  t.tid, s.sid, s.fname, s.lname, s.type
FROM ticket t
INNER JOIN staff s
ON t.tid = s.tid;

-- 2. Display the staff that hasn’t come for work at the apartment.
SELECT s.sid, s.fname, s.lname, s.type
FROM staff s
WHERE s.sid NOT IN (SELECT DISTINCT sid FROM attendance);


-- 3. Get the names, designations of staff that have worked for more than 8 hours in November.
SELECT s.sid, s.fname, s.lname, s.type
FROM staff s
WHERE s.sid IN (SELECT DISTINCT sid FROM attendance WHERE timestampdiff(hour,intime, outtime) < 8);

-- 4. Get details of resident who have raised a ticket. 
SELECT * FROM resident
WHERE rid IN(SELECT DISTINCT rid from ticket)


-- 5. Get the tickets that have not been resolved and number of days since.
SELECT tid, complaint, is_resolved, date_generated,
DATEDIFF(curdate(), date_generated ) as no_of_days
FROM ticket
WHERE is_resolved=0; 

-- 6. Fetch the staff details that have a record of attendance. Correspondingly fetch the staff details that don't have a record of attendance yet.
SELECT sid, fname, lname, type
FROM staff s
WHERE EXISTS(SELECT sid
FROM attendance
WHERE sid =
s.sid);


SELECT sid, fname, lname, type
FROM staff s
WHERE NOT EXISTS(SELECT sid
FROM attendance
WHERE sid =
s.sid);







-- View 


-- Create a view that holder resident details that a visitor visits.
-- Every visitor has an associated resident rid (whom he has come to visit).
-- Join the 2 tables resident and visitor as a view.

-- Query to get the flat and block of all cab drivers who has come to pick up a resident. (visitor_type=’C’ -> Cab driver)


CREATE VIEW view3 AS SELECT r.rid, r.fname as resident_fname, r.lname as resident_lname, r.block, r.flat, v.name as visitor_name, v.type as visitor_type
FROM resident r
INNER JOIN visitor v
WHERE r.rid=v.rid;

SELECT * from view3;

SELECT flat, block from view3
WHERE visitor_type='C';






-- Aggregate operations

-- 1. Get number of residents that are tenants at the apartment
SELECT count(rid) as no_of_tenants
FROM resident
WHERE is_owner=0; 


-- 2. List the occupancy of each block. (How many residents occupy each block)
SELECT count(rid) as occupancy, block
FROM resident 
GROUP BY(block);



-- 3. List the maximum occupancy in all blocks. (Which block has the maximum occupants)
SELECT count(rid) as occupancy, BLOCK from resident 
GROUP BY(block)
ORDER BY occupancy DESC LIMIT 1;

-- 4. Number of staff on duty in the night.(their duty is in 2nd shift)

SELECT count(sid) as night_duty_staff
FROM staff 
WHERE shift=2;







-- Set operations

-- 1. Get owners in block A who are also residents.
-- Set operation

SELECT * FROM resident where rid IN(
SELECT rid FROM  resident WHERE block='A'
INTERSECT
SELECT oid FROM owner);


-- 2. Tickets that’s not been assigned to staff

SELECT tid FROM ticket
EXCEPT
SELECT tid FROM staff;

-- 3. List those staff members that don’t have a record of attendance in the month of November
SELECT * from staff where sid IN(
SELECT sid FROM staff
EXCEPT
SELECT sid FROM record WHERE sid IN (SELECT sid FROM record WHERE month='NOV' ));


INSERT INTO `staff` (`sid`, `tid`, `fname`, `lname`, `dob`, `shift`, `type`,`password`) VALUES
('S011', NULL, 'Fiyaz', 'Shaqib', '1996-01-12',2, 'electrician','1234');

DELETE FROM staff WHERE sid='S011'; 







-- Function
-- It returns the number of guests that have visited the apartment within a day(24 hours). 

DELIMITER $$
CREATE FUNCTION func2() 
RETURNS int
READS SQL DATA
DETERMINISTIC
BEGIN
DECLARE tot_count int;
SET tot_count = (SELECT count(name) AS guests FROM visitor WHERE type='G' and timestampdiff(hour, outtime, curdate()) < 24;);
RETURN tot_count;
END;$$
DELIMITER ;
-- updating a visitor to the current date so that function returns 1 as no. of visitor in last 24 hours.

UPDATE TABLE visitor SET intime = '2022-11-17 12:15:01', outtime = '2022-11-17 14:15:00' WHERE type='G' and name='Sarita';







-- Trigger

DELIMITER $$
CREATE TRIGGER check_staff_type BEFORE INSERT
ON STAFF FOR EACH ROW
BEGIN
DECLARE error_msg VARCHAR(255);
IF new.type != 'plumber'  or  new.type = 'electrician'  or new.type='security' or new.type='supervisor' or new.type='housekeeping'
THEN
SET error_msg = ('Invalid type. Accepts any one of (plumber, electrician, housekeeping, security, supervisor) as valid inputs');
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = error_msg;
END IF;
END $$
DELIMITER ; 

INSERT INTO staff (sid, tid, fname, lname, dob, shift, type, password) VALUES
('S111', NULL, 'Guru', 'Veer', '1985-06-12', 1,'delivery','1234');

-- this will trigger the 'trigger' because staff type is invalid (delivery is not a valid staff type)

