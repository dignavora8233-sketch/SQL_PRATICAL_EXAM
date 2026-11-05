
-- ==========================================
-- PROJECT: SMART EVENT MANAGEMENT SYSTEM
-- ==========================================

-- 1. CREATE DATABASE

CREATE DATABASE IF NOT EXISTS smart_event_db;

USE smart_event_db;


-- ==========================================
-- 2. CREATE TABLES
-- ==========================================

-- VENUES TABLE

CREATE TABLE Venues(
    venue_id INT PRIMARY KEY,
    venue_name VARCHAR(50),
    location VARCHAR(100)
);


-- ORGANIZERS TABLE

CREATE TABLE Organizers(
    organizer_id INT PRIMARY KEY,
    organizer_name VARCHAR(50),
    contact_email VARCHAR(100),
    phone_number VARCHAR(10)
);


-- ATTENDEES TABLE

CREATE TABLE Attendees(
    attendee_id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(50),
    phone_number VARCHAR(10)
);


-- EVENTS TABLE

CREATE TABLE Events(
    event_id INT PRIMARY KEY,
    event_name VARCHAR(50),
    event_date DATE,
    venue_id INT,
    organizer_id INT,
    ticket_price DECIMAL(10,2),
    total_seats INT,

    FOREIGN KEY (venue_id)
    REFERENCES Venues(venue_id),

    FOREIGN KEY (organizer_id)
    REFERENCES Organizers(organizer_id)
);


-- TICKETS TABLE

CREATE TABLE Tickets(
    ticket_id INT PRIMARY KEY,
    event_id INT,
    attendee_id INT,
    booking_date DATE,
    status VARCHAR(20),

    FOREIGN KEY (event_id)
    REFERENCES Events(event_id),

    FOREIGN KEY (attendee_id)
    REFERENCES Attendees(attendee_id),

    UNIQUE (attendee_id, event_id)
);


-- PAYMENTS TABLE

CREATE TABLE Payments(
    payment_id INT PRIMARY KEY,
    ticket_id INT,
    amount_paid DECIMAL(10,2),
    payment_status VARCHAR(30),
    payment_date DATE,

    FOREIGN KEY (ticket_id)
    REFERENCES Tickets(ticket_id)
);


-- ==========================================
-- 3. INSERT SAMPLE RECORDS
-- ==========================================

-- VENUES

INSERT INTO Venues VALUES
(1, 'City Hall', 'Surat'),
(2, 'Royal Palace', 'Ahmedabad'),
(3, 'Town Hall', 'Vadodara'),
(4, 'Green Garden', 'Rajkot'),
(5, 'Sky Hall', 'Navsari');


-- ORGANIZERS

INSERT INTO Organizers VALUES
(1, 'Rahul', 'rahul@gmail.com', '9876543210'),
(2, 'Priya', 'priya@gmail.com', '9876543211'),
(3, 'Amit', 'amit@gmail.com', '9876543212'),
(4, 'Neha', 'neha@gmail.com', '9876543213'),
(5, 'Karan', 'karan@gmail.com', '9876543214');


-- ATTENDEES

INSERT INTO Attendees VALUES
(1, 'Riya', 'riya@gmail.com', '9876543215'),
(2, 'Jay', 'jay@gmail.com', '9876543216'),
(3, 'Meet', 'meet@gmail.com', '9876543217'),
(4, 'Diya', 'diya@gmail.com', '9876543218'),
(5, 'Raj', 'raj@gmail.com', '9876543219');


-- EVENTS

INSERT INTO Events VALUES
(1, 'Music Concert', '2026-12-10', 1, 1, 500.00, 200),
(2, 'Tech Seminar', '2026-12-15', 2, 2, 300.00, 100),
(3, 'Dance Show', '2026-12-20', 3, 3, 400.00, 150),
(4, 'Food Festival', '2026-12-25', 4, 4, 200.00, 300),
(5, 'Art Exhibition', '2026-12-30', 5, 5, 250.00, 120);


-- TICKETS

INSERT INTO Tickets VALUES
(1, 1, 1, '2026-11-01', 'Confirmed'),
(2, 2, 2, '2026-11-02', 'Pending'),
(3, 3, 3, '2026-11-03', 'Confirmed'),
(4, 4, 4, '2026-11-04', 'Cancelled'),
(5, 5, 5, '2026-11-05', 'Confirmed');


-- PAYMENTS

INSERT INTO Payments VALUES
(1, 1, 500.00, 'Paid', '2026-11-01'),
(2, 2, 300.00, 'Pending', '2026-11-02'),
(3, 3, 400.00, 'Paid', '2026-11-03'),
(4, 4, 200.00, 'Failed', '2026-11-04'),
(5, 5, 250.00, 'Paid', '2026-11-05');


-- ==========================================
-- 4. INSERT, SELECT, UPDATE, DELETE
-- ==========================================

-- VENUES

INSERT INTO Venues VALUES
(6, 'Grand Hall', 'Mumbai');

SELECT * FROM Venues;

UPDATE Venues
SET location = 'Pune'
WHERE venue_id = 6;


-- ORGANIZERS

INSERT INTO Organizers VALUES
(6, 'Mehul', 'mehul@gmail.com', '9876543220');

SELECT * FROM Organizers;

UPDATE Organizers
SET organizer_name = 'Mehul Patel'
WHERE organizer_id = 6;


-- ATTENDEES

INSERT INTO Attendees VALUES
(6, 'Krisha', 'krisha@gmail.com', '9876543221');

SELECT * FROM Attendees;

UPDATE Attendees
SET name = 'Krisha Patel'
WHERE attendee_id = 6;


-- EVENTS

INSERT INTO Events VALUES
(6, 'Coding Workshop', '2027-01-10', 6, 6, 350.00, 100);

SELECT * FROM Events;

UPDATE Events
SET ticket_price = 400.00
WHERE event_id = 6;


-- TICKETS

INSERT INTO Tickets VALUES
(6, 6, 6, '2026-11-06', 'Confirmed');

SELECT * FROM Tickets;

UPDATE Tickets
SET status = 'Pending'
WHERE ticket_id = 6;


-- PAYMENTS

INSERT INTO Payments VALUES
(6, 6, 350.00, 'Paid', '2026-11-06');

SELECT * FROM Payments;

UPDATE Payments
SET payment_status = 'Pending'
WHERE payment_id = 6;


-- DELETE RECORDS
-- CHILD TABLE FIRST, THEN PARENT TABLE

DELETE FROM Payments
WHERE payment_id = 6;

DELETE FROM Tickets
WHERE ticket_id = 6;

DELETE FROM Events
WHERE event_id = 6;

DELETE FROM Attendees
WHERE attendee_id = 6;

DELETE FROM Organizers
WHERE organizer_id = 6;

DELETE FROM Venues
WHERE venue_id = 6;


-- ==========================================
-- 5. WHERE, IN, SUBQUERY, LIMIT
-- ==========================================

-- FUTURE EVENTS IN SURAT

SELECT *
FROM Events
WHERE event_date >= CURDATE()
AND venue_id IN (
    SELECT venue_id
    FROM Venues
    WHERE location = 'Surat'
)
LIMIT 3;


-- ATTENDEES WHO BOOKED TICKETS IN LAST 7 DAYS

SELECT *
FROM Attendees
WHERE attendee_id IN (
    SELECT attendee_id
    FROM Tickets
    WHERE booking_date >= CURDATE() - INTERVAL 7 DAY
)
LIMIT 5;


-- DECEMBER EVENTS WITH MORE THAN 50 SEATS

SELECT *
FROM Events
WHERE MONTH(event_date) = 12
AND total_seats > 50;


-- ATTENDEES HAVING PENDING PAYMENTS

SELECT *
FROM Attendees
WHERE attendee_id IN (
    SELECT T.attendee_id
    FROM Tickets T
    JOIN Payments P
    ON T.ticket_id = P.ticket_id
    WHERE P.payment_status = 'Pending'
);


-- EVENTS HAVING MORE SEATS THAN CONFIRMED TICKETS

SELECT *
FROM Events E
WHERE total_seats > (
    SELECT COUNT(*)
    FROM Tickets T
    WHERE T.event_id = E.event_id
    AND T.status = 'Confirmed'
);


-- ==========================================
-- 6. ORDER BY AND AGGREGATE FUNCTIONS
-- ==========================================

-- SORT EVENTS BY DATE

SELECT *
FROM Events
ORDER BY event_date ASC;


-- TOTAL ATTENDEES PER EVENT

SELECT
    event_id,
    COUNT(attendee_id) AS total_attendees
FROM Tickets
GROUP BY event_id;


-- TOTAL REVENUE PER EVENT

SELECT
    T.event_id,
    SUM(P.amount_paid) AS total_revenue
FROM Payments P
JOIN Tickets T
ON P.ticket_id = T.ticket_id
WHERE P.payment_status = 'Paid'
GROUP BY T.event_id;


-- TOTAL REVENUE

SELECT SUM(amount_paid) AS total_revenue
FROM Payments
WHERE payment_status = 'Paid';


-- EVENT WITH HIGHEST CONFIRMED ATTENDEES

SELECT
    event_id,
    COUNT(attendee_id) AS total_attendees
FROM Tickets
WHERE status = 'Confirmed'
GROUP BY event_id
ORDER BY total_attendees DESC
LIMIT 1;


-- AVERAGE TICKET PRICE

SELECT AVG(ticket_price) AS average_ticket_price
FROM Events;


-- ==========================================
-- 7. JOINS
-- ==========================================

-- INNER JOIN: EVENTS AND VENUES

SELECT
    E.event_id,
    E.event_name,
    E.event_date,
    E.ticket_price,
    V.venue_name,
    V.location
FROM Events E
INNER JOIN Venues V
ON E.venue_id = V.venue_id;


-- LEFT JOIN: ATTENDEES AND PAYMENTS

SELECT
    A.attendee_id,
    A.name,
    A.email,
    T.ticket_id,
    P.payment_status
FROM Attendees A
LEFT JOIN Tickets T
ON A.attendee_id = T.attendee_id
LEFT JOIN Payments P
ON T.ticket_id = P.ticket_id
WHERE P.payment_status IS NULL
OR P.payment_status != 'Paid';


-- RIGHT JOIN: EVENTS WITHOUT TICKETS

SELECT
    E.event_id,
    E.event_name,
    T.ticket_id
FROM Tickets T
RIGHT JOIN Events E
ON T.event_id = E.event_id
WHERE T.ticket_id IS NULL;


-- FULL OUTER JOIN USING UNION

SELECT
    A.attendee_id,
    A.name,
    T.ticket_id
FROM Attendees A
LEFT JOIN Tickets T
ON A.attendee_id = T.attendee_id

UNION

SELECT
    A.attendee_id,
    A.name,
    T.ticket_id
FROM Attendees A
RIGHT JOIN Tickets T
ON A.attendee_id = T.attendee_id;


-- ==========================================
-- 8. GROUP BY AND HAVING
-- ==========================================

-- REVENUE GREATER THAN AVERAGE TICKET PRICE

SELECT
    T.event_id,
    SUM(P.amount_paid) AS total_revenue
FROM Payments P
JOIN Tickets T
ON P.ticket_id = T.ticket_id
WHERE P.payment_status = 'Paid'
GROUP BY T.event_id
HAVING SUM(P.amount_paid) > (
    SELECT AVG(ticket_price)
    FROM Events
);


-- ATTENDEES BOOKED MORE THAN ONE EVENT

SELECT
    attendee_id,
    COUNT(DISTINCT event_id) AS total_events
FROM Tickets
GROUP BY attendee_id
HAVING COUNT(DISTINCT event_id) > 1;


-- ORGANIZERS HAVING MORE THAN 3 EVENTS

SELECT
    O.organizer_id,
    O.organizer_name,
    COUNT(E.event_id) AS total_events
FROM Organizers O
JOIN Events E
ON O.organizer_id = E.organizer_id
GROUP BY O.organizer_id, O.organizer_name
HAVING COUNT(E.event_id) > 3;


-- ==========================================
-- 9. DATE FUNCTIONS
-- ==========================================

-- MONTH FUNCTION

SELECT
    event_name,
    MONTH(event_date) AS event_month
FROM Events;


-- DATEDIFF FUNCTION

SELECT
    event_name,
    event_date,
    DATEDIFF(event_date, CURDATE()) AS remaining_days
FROM Events
WHERE event_date >= CURDATE();


-- DATE_FORMAT FUNCTION

SELECT
    payment_id,
    DATE_FORMAT(payment_date, '%Y-%m-%d') AS formatted_date
FROM Payments;


-- ==========================================
-- 10. STRING FUNCTIONS
-- ==========================================

-- UPPER FUNCTION

SELECT UPPER(organizer_name) AS organizer_name
FROM Organizers;


-- TRIM FUNCTION

SELECT TRIM(name) AS attendee_name
FROM Attendees;


-- COALESCE FUNCTION

SELECT
    attendee_id,
    COALESCE(email, 'Not Provided') AS email
FROM Attendees;


-- ==========================================
-- 11. WINDOW FUNCTIONS
-- ==========================================

-- RANK FUNCTION

SELECT
    T.event_id,
    SUM(P.amount_paid) AS total_revenue,
    RANK() OVER (
        ORDER BY SUM(P.amount_paid) DESC
    ) AS event_rank
FROM Payments P
JOIN Tickets T
ON P.ticket_id = T.ticket_id
WHERE P.payment_status = 'Paid'
GROUP BY T.event_id;


-- CUMULATIVE SALES

SELECT
    payment_id,
    amount_paid,
    SUM(amount_paid) OVER (
        ORDER BY payment_id
    ) AS cumulative_sales
FROM Payments
WHERE payment_status = 'Paid';


-- RUNNING TOTAL OF TICKETS

SELECT
    event_id,
    attendee_id,
    booking_date,
    COUNT(*) OVER (
        PARTITION BY event_id
        ORDER BY booking_date
    ) AS running_total
FROM Tickets;


-- ==========================================
-- 12. CASE STATEMENT
-- ==========================================

-- EVENT DEMAND STATUS

WITH EventCapacity AS (
    SELECT
        E.event_id,
        E.event_name,
        E.total_seats,
        E.total_seats - COUNT(
            CASE
                WHEN T.status = 'Confirmed' THEN 1
            END
        ) AS available_seats
    FROM Events E
    LEFT JOIN Tickets T
    ON E.event_id = T.event_id
    GROUP BY E.event_id, E.event_name, E.total_seats
)

SELECT
    event_id,
    event_name,
    available_seats,
    total_seats,
    CASE
        WHEN available_seats < total_seats * 0.20
            THEN 'High Demand'

        WHEN available_seats <= total_seats * 0.50
            THEN 'Moderate Demand'

        ELSE 'Low Demand'
    END AS demand_status
FROM EventCapacity;


-- PAYMENT STATUS USING CASE

SELECT
    payment_id,
    payment_status,
    CASE
        WHEN payment_status = 'Paid'
            THEN 'Successful'

        WHEN payment_status = 'Failed'
            THEN 'Failed'

        ELSE 'Pending'
    END AS final_status
FROM Payments;


-- ==========================================
-- END OF PROJECT
-- ==========================================
