# 🎟️ SMART EVENT MANAGEMENT SYSTEM

<p align="center">
  <b>A MySQL Database Management Project</b><br>
  Organize events, manage venues, track ticket bookings, and monitor payments.
</p>

---

## 📌 1. Project Introduction

The **Smart Event Management System** is a database project developed using **MySQL**. It is designed to store and manage important information related to events, venues, organizers, attendees, ticket bookings, and payments.

Organizing an event involves managing different types of information. For example, an event needs a venue, an organizer, a date, a ticket price, and a seating capacity. Attendees may book tickets, and payment details need to be maintained.

This project brings these records together in a relational database. Primary keys and foreign keys connect related tables, while SQL queries help retrieve, update, delete, sort, group, and analyse information.

### Project Details

| Item | Details |
|---|---|
| Project Name | Smart Event Management System |
| Database Name | `smart_event_db` |
| Database Language | SQL |
| DBMS | MySQL |
| Project Type | Relational Database Management System |
| Main Purpose | Event, venue, attendee, ticket, and payment management |
| Number of Main Tables | 6 |

---

## 🎯 2. Project Objectives

The main objectives of this project are:

1. To create a structured database for an event management system.
2. To store venue information, including venue names and locations.
3. To maintain organizer details and contact information.
4. To store attendee information.
5. To manage event details such as event name, date, ticket price, and total seats.
6. To record ticket bookings and their current status.
7. To maintain payment amounts, payment dates, and payment statuses.
8. To establish relationships between tables using primary keys and foreign keys.
9. To apply SQL constraints to maintain data integrity.
10. To retrieve useful information using SQL queries.
11. To calculate attendee counts, revenue, and average ticket prices.
12. To practise advanced SQL concepts such as joins, subqueries, CTEs, and window functions.

---

## 🗂️ 3. Database Tables

The project contains six main tables:

| No. | Table Name | Description |
|---:|---|---|
| 1 | `Venues` | Stores information about event locations. |
| 2 | `Organizers` | Stores information about people who organize events. |
| 3 | `Attendees` | Stores information about people who attend events. |
| 4 | `Events` | Stores event details and links each event to a venue and organizer. |
| 5 | `Tickets` | Stores ticket booking information and booking status. |
| 6 | `Payments` | Stores payment information related to tickets. |

### 3.1 Venues Table

The `Venues` table stores the location details where events are organized.

| Column | Data Type | Description |
|---|---|---|
| `venue_id` | INT | Unique ID for each venue; Primary Key |
| `venue_name` | VARCHAR(50) | Name of the venue |
| `location` | VARCHAR(100) | City or location of the venue |

**Sample venues included in the SQL script:**

- City Hall — Surat
- Royal Palace — Ahmedabad
- Town Hall — Vadodara
- Green Garden — Rajkot
- Sky Hall — Navsari

### 3.2 Organizers Table

The `Organizers` table stores the contact details of event organizers.

| Column | Data Type | Description |
|---|---|---|
| `organizer_id` | INT | Unique organizer ID; Primary Key |
| `organizer_name` | VARCHAR(50) | Name of the organizer |
| `contact_email` | VARCHAR(100) | Email address |
| `phone_number` | VARCHAR(10) | Phone number |

### 3.3 Attendees Table

The `Attendees` table stores the personal contact details of attendees.

| Column | Data Type | Description |
|---|---|---|
| `attendee_id` | INT | Unique attendee ID; Primary Key |
| `name` | VARCHAR(50) | Attendee name |
| `email` | VARCHAR(50) | Attendee email address |
| `phone_number` | VARCHAR(10) | Attendee phone number |

### 3.4 Events Table

The `Events` table stores the main details of each event.

| Column | Data Type | Description |
|---|---|---|
| `event_id` | INT | Unique event ID; Primary Key |
| `event_name` | VARCHAR(50) | Name of the event |
| `event_date` | DATE | Date on which the event takes place |
| `venue_id` | INT | References `Venues(venue_id)` |
| `organizer_id` | INT | References `Organizers(organizer_id)` |
| `ticket_price` | DECIMAL(10,2) | Price of one ticket |
| `total_seats` | INT | Total seating capacity |

The `venue_id` and `organizer_id` columns are foreign keys. They connect each event to an existing venue and organizer.

### 3.5 Tickets Table

The `Tickets` table stores ticket booking details.

| Column | Data Type | Description |
|---|---|---|
| `ticket_id` | INT | Unique ticket ID; Primary Key |
| `event_id` | INT | References `Events(event_id)` |
| `attendee_id` | INT | References `Attendees(attendee_id)` |
| `booking_date` | DATE | Date of ticket booking |
| `status` | VARCHAR(20) | Booking status |

The table also contains:

```sql
UNIQUE (attendee_id, event_id)
```

This unique constraint prevents the same attendee from having more than one ticket record for the same event.

### 3.6 Payments Table

The `Payments` table stores payment details for tickets.

| Column | Data Type | Description |
|---|---|---|
| `payment_id` | INT | Unique payment ID; Primary Key |
| `ticket_id` | INT | References `Tickets(ticket_id)` |
| `amount_paid` | DECIMAL(10,2) | Amount recorded for the payment |
| `payment_status` | VARCHAR(30) | Payment status |
| `payment_date` | DATE | Date of payment |

---

## 🔗 4. Database Relationships

The tables are connected using primary key and foreign key relationships.

### Relationship Details

1. **Venues → Events:** `Events.venue_id` references `Venues.venue_id`.
2. **Organizers → Events:** `Events.organizer_id` references `Organizers.organizer_id`.
3. **Events → Tickets:** `Tickets.event_id` references `Events.event_id`.
4. **Attendees → Tickets:** `Tickets.attendee_id` references `Attendees.attendee_id`.
5. **Tickets → Payments:** `Payments.ticket_id` references `Tickets.ticket_id`.

### Relationship Overview

```text
Venues
   |
   | venue_id
   |
 Events
   |
   | event_id
   |
 Tickets -------- Attendees
   |
   | ticket_id
   |
 Payments

Organizers
   |
   | organizer_id
   |
 Events
```

### Why Are Relationships Important?

- They connect related information stored in separate tables.
- They help maintain referential integrity.
- They reduce unnecessary repetition of data.
- They make it possible to retrieve combined information using joins.

---

## 🧱 5. SQL Constraints Used

| Constraint | Purpose | Project Usage |
|---|---|---|
| `PRIMARY KEY` | Uniquely identifies each row. | IDs in all six tables |
| `FOREIGN KEY` | Connects records in related tables. | Event, ticket, and payment references |
| `UNIQUE` | Prevents duplicate values or combinations. | Attendee and event combination in `Tickets` |

### Example: Primary Key

```sql
CREATE TABLE Venues (
    venue_id INT PRIMARY KEY,
    venue_name VARCHAR(50),
    location VARCHAR(100)
);
```

### Example: Foreign Key

```sql
FOREIGN KEY (venue_id)
REFERENCES Venues(venue_id)
```

### Example: Unique Constraint

```sql
UNIQUE (attendee_id, event_id)
```

---

## 📝 6. Sample Data

The SQL script inserts sample records into all six tables.

### Sample Event Records

| Event ID | Event Name | Event Date | Ticket Price | Total Seats |
|---:|---|---|---:|---:|
| 1 | Music Concert | 2026-12-10 | 500.00 | 200 |
| 2 | Tech Seminar | 2026-12-15 | 300.00 | 100 |
| 3 | Dance Show | 2026-12-20 | 400.00 | 150 |
| 4 | Food Festival | 2026-12-25 | 200.00 | 300 |
| 5 | Art Exhibition | 2026-12-30 | 250.00 | 120 |

### Booking Status Values

- `Confirmed`
- `Pending`
- `Cancelled`

### Payment Status Values

- `Paid`
- `Pending`
- `Failed`

The SQL script includes five initial sample records for each main table.

---

## ⚙️ 7. SQL Operations Performed

### 7.1 Database Creation

The project creates the database if it does not already exist.

```sql
CREATE DATABASE IF NOT EXISTS smart_event_db;
USE smart_event_db;
```

### 7.2 Table Creation

The six tables are created using `CREATE TABLE`. Their columns, data types, primary keys, foreign keys, and unique constraints are defined in the script.

### 7.3 INSERT Operation

`INSERT` adds new records to a table.

```sql
INSERT INTO Venues
VALUES (6, 'Grand Hall', 'Mumbai');
```

### 7.4 SELECT Operation

`SELECT` retrieves records from a table.

```sql
SELECT * FROM Venues;
```

### 7.5 UPDATE Operation

`UPDATE` modifies existing records.

```sql
UPDATE Venues
SET location = 'Pune'
WHERE venue_id = 6;
```

### 7.6 DELETE Operation

`DELETE` removes records that match a condition.

```sql
DELETE FROM Venues
WHERE venue_id = 6;
```

**Important:** The project deletes the additional test records in child-to-parent order. For example, payment records are deleted before their related ticket records, and ticket records are deleted before their related event records.

---

## 🔍 8. Filtering and Subqueries

The project uses `WHERE`, `IN`, subqueries, and `LIMIT` to retrieve selected records.

### Queries Included

| Query | Purpose |
|---|---|
| Future events in Surat | Finds upcoming events at venues located in Surat. |
| Recent ticket bookings | Finds attendees who booked tickets in the last seven days. |
| December events | Finds December events with more than 50 seats. |
| Pending payments | Finds attendees whose related payment status is pending. |
| Available event capacity | Finds events with more seats than confirmed ticket bookings. |

### Example: Future Events in Surat

```sql
SELECT *
FROM Events
WHERE event_date >= CURDATE()
AND venue_id IN (
    SELECT venue_id
    FROM Venues
    WHERE location = 'Surat'
)
LIMIT 3;
```

**Explanation:**

- `WHERE event_date >= CURDATE()` selects events scheduled for today or later.
- The subquery finds venue IDs located in Surat.
- `IN` checks whether an event's venue ID is in that result.
- `LIMIT 3` displays up to three records.

### Example: December Events with More Than 50 Seats

```sql
SELECT *
FROM Events
WHERE MONTH(event_date) = 12
AND total_seats > 50;
```

This query uses the `MONTH()` date function and filters events by seating capacity.

---

## 📊 9. ORDER BY and Aggregate Functions

The project uses sorting and aggregate functions to analyse event and payment records.

### ORDER BY

Sorts events by their event date.

```sql
SELECT *
FROM Events
ORDER BY event_date ASC;
```

### COUNT()

Counts the number of attendee bookings for each event.

```sql
SELECT
    event_id,
    COUNT(attendee_id) AS total_attendees
FROM Tickets
GROUP BY event_id;
```

### SUM()

Calculates the total paid revenue.

```sql
SELECT SUM(amount_paid) AS total_revenue
FROM Payments
WHERE payment_status = 'Paid';
```

### AVG()

Calculates the average ticket price.

```sql
SELECT AVG(ticket_price) AS average_ticket_price
FROM Events;
```

### Other Analysis Included

- Total attendees per event.
- Total paid revenue per event.
- Total paid revenue across the project.
- Event with the highest number of confirmed attendees.
- Average ticket price.

---

## 🔗 10. JOIN Operations

Joins combine related information from multiple tables.

### 10.1 INNER JOIN

Displays events along with their venue details.

```sql
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
```

### 10.2 LEFT JOIN

Displays attendees and their ticket/payment information, including attendees whose payment is missing or not marked as paid.

```sql
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
```

### 10.3 RIGHT JOIN

Finds events that do not have any ticket bookings.

```sql
SELECT
    E.event_id,
    E.event_name,
    T.ticket_id
FROM Tickets T
RIGHT JOIN Events E
ON T.event_id = E.event_id
WHERE T.ticket_id IS NULL;
```

### 10.4 FULL OUTER JOIN-Style Result Using UNION

MySQL does not provide a direct `FULL OUTER JOIN` keyword. The project demonstrates a full-outer-join-style result by combining a `LEFT JOIN` and a `RIGHT JOIN` using `UNION`.

```sql
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
```

---

## 📚 11. GROUP BY and HAVING

`GROUP BY` groups rows with matching values. `HAVING` filters the grouped results.

### Queries Included

1. Find events whose paid revenue is greater than the average ticket price.
2. Find attendees who booked more than one event.
3. Find organizers who have organized more than three events.

### Example: Attendees Who Booked More Than One Event

```sql
SELECT
    attendee_id,
    COUNT(DISTINCT event_id) AS total_events
FROM Tickets
GROUP BY attendee_id
HAVING COUNT(DISTINCT event_id) > 1;
```

**Explanation:**

- `GROUP BY attendee_id` creates a group for each attendee.
- `COUNT(DISTINCT event_id)` counts different events booked by an attendee.
- `HAVING` keeps only attendees with more than one event.

---

## 📅 12. Date Functions

Date functions help retrieve and format date-related information.

| Function | Purpose |
|---|---|
| `CURDATE()` | Returns the current date. |
| `MONTH()` | Returns the month number from a date. |
| `DATEDIFF()` | Calculates the difference between two dates in days. |
| `DATE_FORMAT()` | Formats a date according to a specified pattern. |

### Example: Remaining Days for Upcoming Events

```sql
SELECT
    event_name,
    event_date,
    DATEDIFF(event_date, CURDATE()) AS remaining_days
FROM Events
WHERE event_date >= CURDATE();
```

### Example: Format Payment Date

```sql
SELECT
    payment_id,
    DATE_FORMAT(payment_date, '%Y-%m-%d') AS formatted_date
FROM Payments;
```

---

## 🔤 13. String Functions

The project uses string functions to format and handle text values.

| Function | Purpose |
|---|---|
| `UPPER()` | Converts text to uppercase. |
| `TRIM()` | Removes leading and trailing spaces. |
| `COALESCE()` | Returns the first non-NULL expression. |

### Example: Organizer Names in Uppercase

```sql
SELECT UPPER(organizer_name) AS organizer_name
FROM Organizers;
```

### Example: Handle Missing Email Values

```sql
SELECT
    attendee_id,
    COALESCE(email, 'Not Provided') AS email
FROM Attendees;
```

---

## 🪟 14. Window Functions

Window functions perform calculations across related rows without combining those rows into a single grouped result.

### 14.1 RANK()

Ranks events according to their paid revenue.

```sql
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
```

### 14.2 Cumulative Sales

Calculates a running total of paid amounts.

```sql
SELECT
    payment_id,
    amount_paid,
    SUM(amount_paid) OVER (
        ORDER BY payment_id
    ) AS cumulative_sales
FROM Payments
WHERE payment_status = 'Paid';
```

### 14.3 Running Total of Tickets

Counts ticket bookings progressively for each event according to booking date.

```sql
SELECT
    event_id,
    attendee_id,
    booking_date,
    COUNT(*) OVER (
        PARTITION BY event_id
        ORDER BY booking_date
    ) AS running_total
FROM Tickets;
```

---

## 🧠 15. CTE and CASE Statement

### 15.1 Common Table Expression (CTE)

The project uses a CTE with the `WITH` keyword to calculate event capacity information before producing a demand classification.

```sql
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
SELECT *
FROM EventCapacity;
```

### 15.2 Event Demand Status Using CASE

The full project query classifies event demand into:

- `High Demand`
- `Moderate Demand`
- `Low Demand`

The classification is based on the number of available seats compared with total seats.

### 15.3 Payment Status Using CASE

```sql
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
```

This query creates a readable payment result based on the stored payment status.

---

## ▶️ 16. How to Run the Project

Follow these steps to execute the project:

1. Install MySQL Server and open MySQL Workbench or another compatible MySQL editor.
2. Open the SQL project file.
3. Review the database creation statement.
4. Execute the script from the beginning.
5. The database `smart_event_db` will be created if it does not already exist.
6. The script selects the database using `USE smart_event_db`.
7. Execute the table creation statements.
8. Insert the sample records.
9. Run the `SELECT` queries to view the inserted data.
10. Run the `UPDATE` and `DELETE` demonstration statements.
11. Execute the filtering, aggregate, join, date, string, window function, CTE, and CASE queries.
12. Review the output of each query in your SQL editor.

### Useful Verification Commands

```sql
SHOW DATABASES;

USE smart_event_db;

SHOW TABLES;

DESC Venues;

DESC Organizers;

DESC Attendees;

DESC Events;

DESC Tickets;

DESC Payments;
```

---

## 📁 17. Suggested Project Folder Structure

You can organize your GitHub repository like this:

```text
Smart-Event-Management-System/
│
├── README.md
│
└── smart_event_management.sql
```

The SQL filename above is a suggested name. Use the actual name of your SQL file when uploading it to GitHub.

---

## ⚠️ 18. Important Notes

- Execute the SQL script in the correct order because foreign keys depend on records in related tables.
- The `Events` table must reference existing venue and organizer IDs.
- The `Tickets` table must reference existing event and attendee IDs.
- The `Payments` table must reference an existing ticket ID.
- Delete child records before deleting parent records when foreign key relationships exist.
- The additional test records are deleted in the script after the INSERT and UPDATE demonstrations.
- The sample event dates are entered in the SQL script and are not automatically updated.
- The `CURDATE()` queries depend on the date on which the SQL script is executed.
- The script is a learning and demonstration project. It does not include a graphical user interface or a live payment gateway.

---

## 🌱 19. Future Enhancements

The project can be improved with additional features in the future:

1. **User Authentication:** Add login details for administrators and organizers.
2. **Role Management:** Provide different permissions for administrators, organizers, and attendees.
3. **Ticket Availability:** Track available seats and prevent bookings beyond event capacity.
4. **Payment Integration:** Connect a secure payment gateway in a future application.
5. **Booking Cancellation:** Add a structured cancellation and refund process.
6. **Email Notifications:** Send booking confirmations and event reminders.
7. **Search and Filters:** Allow users to search events by name, date, venue, and location.
8. **Reports and Dashboard:** Display ticket counts, payment summaries, and event revenue in charts.
9. **Data Validation:** Add suitable checks for email addresses, phone numbers, prices, and capacity.
10. **Application Integration:** Connect the database to a Python application or web interface.

---

## 📖 20. What I Learned

While developing this project, I practised important database concepts and improved my understanding of how relational databases work.

### Technical Learning

- Creating databases and tables in MySQL.
- Selecting suitable SQL data types.
- Applying primary key and foreign key constraints.
- Using unique constraints to avoid duplicate combinations.
- Inserting, retrieving, updating, and deleting records.
- Filtering data using `WHERE`, `IN`, and subqueries.
- Sorting records using `ORDER BY`.
- Performing calculations using aggregate functions.
- Combining tables using different types of joins.
- Grouping records using `GROUP BY` and filtering groups using `HAVING`.
- Working with date and string functions.
- Using window functions for ranking and running totals.
- Creating CTEs using the `WITH` clause.
- Applying conditional logic using `CASE`.

### Practical Learning

This project helped me understand how separate tables work together in a database. I also practised writing queries to answer real-world-style questions about event bookings, available seats, attendees, and payments.

---

## 👩‍💻 21. About the Author

**Digna Vora**  
B.Sc. IT Student  
Vidhyadeep University

### Areas of Interest

- SQL and Database Management
- Python Programming
- Data Analytics
- Artificial Intelligence
- Machine Learning
- Data Science

I am continuously learning new technologies and building practical projects to improve my programming and problem-solving skills.

---

## 📬 22. Contact

If you would like to connect, discuss this project, or share suggestions, feel free to reach out through my GitHub or LinkedIn profile.

- **GitHub:** Add your GitHub profile link here.
- **LinkedIn:** Add your LinkedIn profile link here.
- **Email:** Add your email address here.

---

## ⭐ 23. Conclusion

The **Smart Event Management System** demonstrates how MySQL can be used to design and manage a relational database for event-related information. By connecting venues, organizers, events, attendees, tickets, and payments, the project provides a structured way to store and retrieve data.

It also demonstrates a wide range of SQL concepts, from basic database operations to advanced queries using joins, subqueries, aggregate functions, CTEs, window functions, and CASE statements.

This project is an important step in my SQL learning journey and has helped me gain practical experience in database design and data analysis.

---
