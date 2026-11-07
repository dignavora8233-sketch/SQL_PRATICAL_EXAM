/*
PROJECT NAME: SMART EVENT MANAGEMENT SYSTEM
DATABASE: smart_event_db
*/

-- =====================================
-- CREATE DATABASE
-- =====================================

CREATE DATABASE IF NOT EXISTS smart_event_db;
USE smart_event_db;





-- =====================================
-- CREATE TABLES
-- =====================================

-- VENUES TABLE

CREATE TABLE Venues (
    venue_id INT PRIMARY KEY,
    venue_name VARCHAR(50),
    location VARCHAR(100),
    capacity INT
);


-- ORGANIZERS TABLE

CREATE TABLE Organizers (
    organizer_id INT PRIMARY KEY,
    organizer_name VARCHAR(50),
    contact_email VARCHAR(100),
    phone_number VARCHAR(10)
);


-- ATTENDEES TABLE

CREATE TABLE Attendees (
    attendee_id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(50),
    phone_number VARCHAR(10)
);


-- EVENTS TABLE

CREATE TABLE Events (
    event_id INT PRIMARY KEY,
    event_name VARCHAR(50),
    event_date DATE,
    venue_id INT,
    organizer_id INT,
    ticket_price DECIMAL(10,2),
    total_seats INT,
    available_seats INT,

    FOREIGN KEY (venue_id) REFERENCES Venues(venue_id),
    FOREIGN KEY (organizer_id) REFERENCES Organizers(organizer_id)
);


-- TICKETS TABLE

CREATE TABLE Tickets (
    ticket_id INT PRIMARY KEY,
    event_id INT,
    attendee_id INT,
    booking_date DATE,
    status VARCHAR(20),

    FOREIGN KEY (event_id) REFERENCES Events(event_id),
    FOREIGN KEY (attendee_id) REFERENCES Attendees(attendee_id),

    UNIQUE (attendee_id, event_id)
);


-- PAYMENTS TABLE

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    ticket_id INT,
    amount_paid DECIMAL(10,2),
    payment_status VARCHAR(20),
    payment_date DATETIME,

    FOREIGN KEY (ticket_id) REFERENCES Tickets(ticket_id)
);


-- =====================================
--  INSERT SAMPLE DATA
-- =====================================

-- VENUES

INSERT INTO Venues VALUES
(1,'City Hall','Surat',250),
(2,'Royal Palace','Ahmedabad',180),
(3,'Town Hall','Vadodara',200),
(4,'Green Garden','Rajkot',350),
(5,'Sky Hall','Navsari',150);


-- ORGANIZERS

INSERT INTO Organizers VALUES
(1,'Rahul Shah','rahul@gmail.com','9876543210'),
(2,'Priya Patel','priya@gmail.com','9876543211'),
(3,'Amit Mehta','amit@gmail.com','9876543212'),
(4,'Neha Desai','neha@gmail.com','9876543213');


-- ATTENDEES

INSERT INTO Attendees VALUES
(1,'Riya','riya@gmail.com','9876543215'),
(2,'Jay','jay@gmail.com','9876543216'),
(3,'Meet','meet@gmail.com','9876543217'),
(4,'Diya','diya@gmail.com','9876543218'),
(5,'Raj','raj@gmail.com','9876543219'),
(6,'Krisha','krisha@gmail.com','9876543220'),
(7,'Kunal','kunal@gmail.com','9876543221'),
(8,'Mira',NULL,'9876543222');


-- EVENTS

INSERT INTO Events VALUES
(1,'Music Concert','2026-12-10',1,1,500.00,200,196),
(2,'Tech Seminar','2026-12-15',2,1,300.00,100,98),
(3,'Dance Show','2026-12-20',3,1,400.00,150,148),
(4,'Food Festival','2026-12-25',4,1,200.00,300,298),
(5,'Art Exhibition','2026-12-30',5,2,250.00,120,118),
(6,'Coding Workshop','2027-01-10',1,2,350.00,100,98),
(7,'Business Meetup','2027-01-15',2,3,600.00,180,179),
(8,'Design Conference','2027-01-20',3,4,450.00,200,199);


-- TICKETS

INSERT INTO Tickets VALUES
(1,1,1,'2026-11-01','Confirmed'),
(2,2,1,'2026-11-02','Confirmed'),
(3,3,2,'2026-11-03','Confirmed'),
(4,4,3,'2026-11-04','Pending'),
(5,5,4,'2026-11-05','Confirmed'),
(6,6,5,'2026-11-06','Cancelled'),
(7,7,6,'2026-11-07','Confirmed'),
(8,8,7,'2026-11-08','Pending'),
(9,1,2,'2026-11-09','Confirmed'),
(10,2,3,'2026-11-10','Confirmed'),
(11,3,4,'2026-11-11','Confirmed'),
(12,5,5,'2026-11-12','Confirmed');


-- PAYMENTS

INSERT INTO Payments VALUES
(1,1,500.00,'Success','2026-11-01 10:00:00'),
(2,2,300.00,'Success','2026-11-02 11:00:00'),
(3,3,400.00,'Success','2026-11-03 12:00:00'),
(4,4,200.00,'Pending','2026-11-04 13:00:00'),
(5,5,250.00,'Success','2026-11-05 14:00:00'),
(6,6,350.00,'Failed','2026-11-06 15:00:00'),
(7,7,600.00,'Success','2026-11-07 16:00:00'),
(8,8,450.00,'Pending','2026-11-08 17:00:00'),
(9,9,500.00,'Success','2026-11-09 10:30:00'),
(10,10,300.00,'Success','2026-11-10 11:30:00'),
(11,11,400.00,'Success','2026-11-11 12:30:00'),
(12,12,250.00,'Success','2026-11-12 13:30:00');


-- =====================================
-- DISPLAY TABLES
-- =====================================

SHOW TABLES;

SELECT * FROM Venues;
SELECT * FROM Organizers;
SELECT * FROM Attendees;
SELECT * FROM Events;
SELECT * FROM Tickets;
SELECT * FROM Payments;


-- =====================================
-- CRUD OPERATIONS
-- =====================================

-- VENUES

INSERT INTO Venues VALUES
(99,'Temporary Venue','Mumbai',100);

SELECT * FROM Venues;

UPDATE Venues
SET location='Pune', capacity=120
WHERE venue_id=99;

SELECT * FROM Venues
WHERE venue_name LIKE '%Temporary%';

DELETE FROM Venues
WHERE venue_id=99;


-- ORGANIZERS

INSERT INTO Organizers VALUES
(99,'Temporary Organizer','temp@gmail.com','9999999999');

SELECT * FROM Organizers;

UPDATE Organizers
SET organizer_name='Updated Organizer'
WHERE organizer_id=99;

SELECT * FROM Organizers
WHERE organizer_name LIKE '%Updated%';

DELETE FROM Organizers
WHERE organizer_id=99;


-- ATTENDEES

INSERT INTO Attendees VALUES
(99,'Temporary Attendee','tempattendee@gmail.com','9999999998');

SELECT * FROM Attendees;

UPDATE Attendees
SET name='Updated Attendee'
WHERE attendee_id=99;

SELECT * FROM Attendees
WHERE name LIKE '%Updated%';

DELETE FROM Attendees
WHERE attendee_id=99;


-- EVENTS

INSERT INTO Events VALUES
(99,'Temporary Event','2027-02-01',1,1,100.00,100,100);

SELECT * FROM Events;

UPDATE Events
SET ticket_price=150.00
WHERE event_id=99;

SELECT * FROM Events
WHERE event_name LIKE '%Temporary%';

DELETE FROM Events
WHERE event_id=99;


-- TICKETS

INSERT INTO Tickets VALUES
(99,1,8,CURDATE(),'Pending');

SELECT * FROM Tickets;

UPDATE Tickets
SET status='Confirmed'
WHERE ticket_id=99;

SELECT * FROM Tickets
WHERE status='Confirmed';

DELETE FROM Tickets
WHERE ticket_id=99;


-- PAYMENTS

INSERT INTO Payments VALUES
(99,1,500.00,'Pending',NOW());

SELECT * FROM Payments;

UPDATE Payments
SET payment_status='Success'
WHERE payment_id=99;

SELECT * FROM Payments
WHERE payment_status='Success';

DELETE FROM Payments
WHERE payment_id=99;


-- =====================================
--  WHERE, HAVING, LIMIT
-- =====================================

-- Upcoming events in Surat

SELECT E.*
FROM Events E
JOIN Venues V
ON E.venue_id=V.venue_id
WHERE E.event_date>=CURDATE()
AND V.location='Surat';


-- TOP 5 HIGHEST REVENUE EVENTS

SELECT E.event_id,E.event_name,
SUM(P.amount_paid) AS total_revenue
FROM Events E
JOIN Tickets T
ON E.event_id=T.event_id
JOIN Payments P
ON T.ticket_id=P.ticket_id
WHERE P.payment_status='Success'
GROUP BY E.event_id,E.event_name
ORDER BY total_revenue DESC
LIMIT 5;


-- ATTENDEES BOOKED IN LAST 7 DAYS

SELECT DISTINCT A.*
FROM Attendees A
JOIN Tickets T
ON A.attendee_id=T.attendee_id
WHERE T.booking_date
BETWEEN CURDATE()-INTERVAL 7 DAY
AND CURDATE();


-- =====================================
-- AND, OR, NOT OPERATORS
-- =====================================

-- DECEMBER EVENTS AND MORE THAN 50% AVAILABLE SEATS

SELECT *
FROM Events
WHERE MONTH(event_date)=12
AND available_seats>total_seats*0.50;


-- ATTENDEES WHO BOOKED TICKET OR HAVE PENDING PAYMENT

SELECT DISTINCT A.*
FROM Attendees A
LEFT JOIN Tickets T
ON A.attendee_id=T.attendee_id
LEFT JOIN Payments P
ON T.ticket_id=P.ticket_id
WHERE T.ticket_id IS NOT NULL
OR P.payment_status='Pending';


-- EVENTS THAT ARE NOT FULLY BOOKED

SELECT *
FROM Events
WHERE NOT (available_seats=0);


-- =====================================
-- ORDER BY AND GROUP BY
-- =====================================

-- SORT EVENTS BY DATE

SELECT *
FROM Events
ORDER BY event_date ASC;


-- COUNT ATTENDEES PER EVENT

SELECT E.event_id,E.event_name,
COUNT(T.ticket_id) AS total_attendees
FROM Events E
LEFT JOIN Tickets T
ON E.event_id=T.event_id
AND T.status='Confirmed'
GROUP BY E.event_id,E.event_name;


-- TOTAL REVENUE PER EVENT

SELECT E.event_id,E.event_name,
COALESCE(
SUM(
CASE
WHEN P.payment_status='Success'
THEN P.amount_paid
ELSE 0
END
),0) AS total_revenue
FROM Events E
LEFT JOIN Tickets T
ON E.event_id=T.event_id
LEFT JOIN Payments P
ON T.ticket_id=P.ticket_id
GROUP BY E.event_id,E.event_name;


-- =====================================
--  AGGREGATE FUNCTIONS
-- SUM, AVG, MAX, MIN, COUNT
-- =====================================

-- TOTAL REVENUE

SELECT SUM(amount_paid) AS total_revenue
FROM Payments
WHERE payment_status='Success';


-- EVENT WITH HIGHEST ATTENDEES

SELECT E.event_id,E.event_name,
COUNT(T.ticket_id) AS total_attendees
FROM Events E
JOIN Tickets T
ON E.event_id=T.event_id
WHERE T.status='Confirmed'
GROUP BY E.event_id,E.event_name
ORDER BY total_attendees DESC
LIMIT 1;


-- AVERAGE TICKET PRICE

SELECT AVG(ticket_price) AS average_ticket_price
FROM Events;


-- MAX, MIN, COUNT

SELECT
MAX(ticket_price) AS maximum_price,
MIN(ticket_price) AS minimum_price,
COUNT(*) AS total_events
FROM Events;


-- =====================================
--  PRIMARY KEY AND FOREIGN KEY
-- =====================================

-- UNIQUE(attendee_id,event_id)
-- Prevents same attendee from booking
-- the same event more than once.

SELECT * FROM Tickets;

SELECT * FROM Payments;


-- =====================================
-- JOIN OPERATIONS
-- =====================================

-- INNER JOIN: EVENT DETAILS WITH VENUE

SELECT E.event_id,E.event_name,E.event_date,
V.venue_name,V.location,V.capacity
FROM Events E
INNER JOIN Venues V
ON E.venue_id=V.venue_id;


-- LEFT JOIN: ATTENDEES WHOSE PAYMENT IS NOT SUCCESSFUL

SELECT A.attendee_id,A.name,
T.ticket_id,P.payment_status
FROM Attendees A
JOIN Tickets T
ON A.attendee_id=T.attendee_id
LEFT JOIN Payments P
ON T.ticket_id=P.ticket_id
WHERE P.payment_status IS NULL
OR P.payment_status<>'Success';


-- RIGHT JOIN: EVENTS WITHOUT ATTENDEES

SELECT E.event_id,E.event_name,T.ticket_id
FROM Tickets T
RIGHT JOIN Events E
ON T.event_id=E.event_id
WHERE T.ticket_id IS NULL;


-- FULL OUTER JOIN USING UNION
-- ATTENDEES WHO HAVE NOT BOOKED ANY TICKET

SELECT full_join_result.attendee_id,
full_join_result.name,
full_join_result.ticket_id
FROM
(
    SELECT A.attendee_id,A.name,T.ticket_id
    FROM Attendees A
    LEFT JOIN Tickets T
    ON A.attendee_id=T.attendee_id

    UNION

    SELECT A.attendee_id,A.name,T.ticket_id
    FROM Attendees A
    RIGHT JOIN Tickets T
    ON A.attendee_id=T.attendee_id

) AS full_join_result
WHERE full_join_result.ticket_id IS NULL;


-- =====================================
--  SUBQUERIES
-- =====================================

-- EVENTS WITH REVENUE ABOVE AVERAGE TICKET PRICE

SELECT E.event_id,E.event_name
FROM Events E
WHERE
(
    SELECT COALESCE(SUM(P.amount_paid),0)
    FROM Tickets T
    JOIN Payments P
    ON T.ticket_id=P.ticket_id
    WHERE T.event_id=E.event_id
    AND P.payment_status='Success'
)
>
(
    SELECT AVG(ticket_price)
    FROM Events
);


-- ATTENDEES WHO BOOKED MULTIPLE EVENTS

SELECT *
FROM Attendees
WHERE attendee_id IN
(
    SELECT attendee_id
    FROM Tickets
    GROUP BY attendee_id
    HAVING COUNT(DISTINCT event_id)>1
);


-- ORGANIZERS WHO MANAGED MORE THAN 3 EVENTS

SELECT *
FROM Organizers
WHERE organizer_id IN
(
    SELECT organizer_id
    FROM Events
    GROUP BY organizer_id
    HAVING COUNT(*)>3
);


-- =====================================
--  DATE AND TIME FUNCTIONS
-- =====================================

-- EXTRACT MONTH

SELECT event_name,
MONTH(event_date) AS event_month
FROM Events;


-- REMAINING DAYS FOR UPCOMING EVENTS

SELECT event_name,event_date,
DATEDIFF(event_date,CURDATE()) AS remaining_days
FROM Events
WHERE event_date>=CURDATE();


-- FORMAT PAYMENT DATE

SELECT payment_id,
DATE_FORMAT(
payment_date,
'%Y-%m-%d %H:%i:%s'
) AS formatted_payment_date
FROM Payments;


-- =====================================
--  STRING FUNCTIONS
-- =====================================

-- UPPERCASE ORGANIZER NAMES

SELECT UPPER(organizer_name) AS organizer_name
FROM Organizers;


-- REMOVE EXTRA SPACES

SELECT TRIM(name) AS attendee_name
FROM Attendees;


-- REPLACE NULL EMAIL

SELECT attendee_id,
COALESCE(email,'Not Provided') AS email
FROM Attendees;


-- =====================================
-- WINDOW FUNCTIONS
-- =====================================

-- RANK EVENTS BY TOTAL REVENUE

SELECT E.event_id,E.event_name,
SUM(P.amount_paid) AS total_revenue,

RANK() OVER (
    ORDER BY SUM(P.amount_paid) DESC
) AS revenue_rank

FROM Events E
JOIN Tickets T
ON E.event_id=T.event_id
JOIN Payments P
ON T.ticket_id=P.ticket_id

WHERE P.payment_status='Success'

GROUP BY E.event_id,E.event_name;


-- CUMULATIVE SUM OF TICKET SALES

SELECT payment_id,amount_paid,

SUM(amount_paid) OVER (
    ORDER BY payment_date,payment_id
) AS cumulative_sales

FROM Payments
WHERE payment_status='Success';


-- RUNNING TOTAL OF ATTENDEES

SELECT event_id,attendee_id,booking_date,

COUNT(*) OVER (
    PARTITION BY event_id
    ORDER BY booking_date,ticket_id
) AS running_total_attendees

FROM Tickets
WHERE status='Confirmed';


-- =====================================
-- CASE EXPRESSIONS
-- =====================================

-- CATEGORIZE EVENTS BASED ON TICKET SALES

SELECT event_id,event_name,
total_seats,available_seats,

CASE
    WHEN available_seats<total_seats*0.20
    THEN 'High Demand'

    WHEN available_seats BETWEEN
    total_seats*0.20 AND total_seats*0.50
    THEN 'Moderate Demand'

    ELSE 'Low Demand'

END AS demand_status

FROM Events;


-- ASSIGN PAYMENT STATUS

SELECT payment_id,payment_status,

CASE
    WHEN payment_status='Success'
    THEN 'Successful'

    WHEN payment_status='Failed'
    THEN 'Failed'

    ELSE 'Pending'

END AS final_status

FROM Payments;


-- =====================================
--  EXTRA REPORTS
-- =====================================

-- COMPLETE EVENT DETAILS

SELECT
E.event_name,
E.event_date,
V.venue_name,
O.organizer_name,
E.ticket_price,
E.total_seats,
E.available_seats

FROM Events E

JOIN Venues V
ON E.venue_id=V.venue_id

JOIN Organizers O
ON E.organizer_id=O.organizer_id;


-- PAYMENT STATUS REPORT

SELECT payment_status,
COUNT(*) AS payment_count,
SUM(amount_paid) AS total_amount

FROM Payments
GROUP BY payment_status;


-- =====================================
-- PROJECT COMPLETED
-- =====================================
