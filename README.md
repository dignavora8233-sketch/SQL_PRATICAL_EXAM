# 🎟️ Smart Event Management System

<p align="center">
  <b>MySQL Database Management Project</b><br>
  Manage events, venues, organizers, attendees, ticket bookings, and payments.
</p>

---

## 📌 1. Project Introduction

The **Smart Event Management System** is a relational database project developed using MySQL. It stores and manages information about events, venues, organizers, attendees, ticket bookings, and payments.

The project demonstrates how related information can be organized using primary keys and foreign keys. SQL queries are used to add, retrieve, update, delete, search, filter, sort, group, and analyse records.

| Project Detail | Information |
|---|---|
| Project Name | Smart Event Management System |
| Database Name | `smart_event_db` |
| Database Language | SQL |
| DBMS | MySQL 8.0+ |
| Project Type | Relational Database Management |
| Main Tables | 6 |

## 🎯 2. Project Objectives

- Create a structured relational database for event management.
- Store venue details, including venue capacity.
- Maintain organizer and attendee information.
- Manage event dates, ticket prices, total seats, and available seats.
- Record ticket bookings and booking statuses.
- Store payment amounts, statuses, and payment dates.
- Establish primary key and foreign key relationships.
- Prevent the same attendee from booking the same event multiple times.
- Perform CRUD operations on all required tables.
- Generate useful reports using SQL clauses, operators, joins, subqueries, functions, and window functions.

## 🗂️ 3. Database Schema

The database contains six tables.

### 3.1 Events

| Column | Data Type | Description |
|---|---|---|
| `event_id` | INT | Primary Key |
| `event_name` | VARCHAR(50) | Event name |
| `event_date` | DATE | Event date |
| `venue_id` | INT | Foreign Key referencing `Venues.venue_id` |
| `organizer_id` | INT | Foreign Key referencing `Organizers.organizer_id` |
| `ticket_price` | DECIMAL(10,2) | Ticket price |
| `total_seats` | INT | Total seating capacity |
| `available_seats` | INT | Available seats |

### 3.2 Venues

| Column | Data Type | Description |
|---|---|---|
| `venue_id` | INT | Primary Key |
| `venue_name` | VARCHAR(50) | Venue name |
| `location` | VARCHAR(100) | Venue location |
| `capacity` | INT | Venue capacity |

### 3.3 Organizers

| Column | Data Type | Description |
|---|---|---|
| `organizer_id` | INT | Primary Key |
| `organizer_name` | VARCHAR(50) | Organizer name |
| `contact_email` | VARCHAR(100) | Contact email |
| `phone_number` | VARCHAR(10) | Phone number |

### 3.4 Attendees

| Column | Data Type | Description |
|---|---|---|
| `attendee_id` | INT | Primary Key |
| `name` | VARCHAR(50) | Attendee name |
| `email` | VARCHAR(50) | Email address |
| `phone_number` | VARCHAR(10) | Phone number |

### 3.5 Tickets

| Column | Data Type | Description |
|---|---|---|
| `ticket_id` | INT | Primary Key |
| `event_id` | INT | Foreign Key referencing `Events.event_id` |
| `attendee_id` | INT | Foreign Key referencing `Attendees.attendee_id` |
| `booking_date` | DATE | Booking date |
| `status` | VARCHAR(20) | Confirmed, Cancelled, or Pending |

The table uses `UNIQUE (attendee_id, event_id)` to prevent the same attendee from booking the same event more than once.

### 3.6 Payments

| Column | Data Type | Description |
|---|---|---|
| `payment_id` | INT | Primary Key |
| `ticket_id` | INT | Foreign Key referencing `Tickets.ticket_id` |
| `amount_paid` | DECIMAL(10,2) | Amount paid |
| `payment_status` | VARCHAR(20) | Success, Failed, or Pending |
| `payment_date` | DATETIME | Payment date and time |

## 🔗 4. Table Relationships

- `Venues` → `Events`: one venue can be used for multiple events.
- `Organizers` → `Events`: one organizer can manage multiple events.
- `Events` → `Tickets`: an event can have multiple ticket bookings.
- `Attendees` → `Tickets`: an attendee can book tickets for multiple events.
- `Tickets` → `Payments`: payment records reference ticket records.

```text
Venues ───────────┐
                  ├── Events ───── Tickets ───── Payments
Organizers ───────┘                    │
                                      │
                                  Attendees
```

## 🛠️ 5. SQL Concepts Implemented

| No. | SQL Topic | Project Tasks |
|---:|---|---|
| 1 | CRUD Operations | Add, read, update, delete, and search records |
| 2 | WHERE, HAVING, LIMIT | Upcoming city events, top 5 revenue events, recent bookings |
| 3 | AND, OR, NOT | December events, booking/payment conditions, not fully booked events |
| 4 | ORDER BY, GROUP BY | Sort events, count attendees, revenue per event |
| 5 | Aggregate Functions | SUM, AVG, MAX, MIN, COUNT |
| 6 | Primary and Foreign Keys | Relationships and duplicate-booking prevention |
| 7 | JOIN Operations | INNER, LEFT, RIGHT, and FULL OUTER JOIN-style result using UNION |
| 8 | Subqueries | Revenue comparison, multiple-event attendees, organizers with more than 3 events |
| 9 | Date and Time Functions | MONTH, DATEDIFF, DATE_FORMAT |
| 10 | String Functions | UPPER, TRIM, COALESCE |
| 11 | Window Functions | RANK, cumulative sales, running attendee total |
| 12 | CASE Expressions | Event demand and payment status categories |

## 📊 6. Main Functionalities

### CRUD Operations
The SQL script demonstrates INSERT, SELECT, UPDATE, DELETE, and search operations for venues, organizers, attendees, events, tickets, and payments. Temporary records are used for the demonstrations so the main sample records remain available.

### Filtering and Sorting
- Find upcoming events in a selected city.
- Retrieve the top five highest revenue-generating events.
- Find attendees who booked tickets in the last seven days.
- Find December events with more than 50% available seats.
- Identify events that are not fully booked.
- Sort events by event date in ascending order.

### Aggregate Reports
- Calculate total successful revenue.
- Find the event with the highest number of confirmed attendees.
- Calculate average ticket price.
- Find maximum and minimum ticket prices.
- Count total events.
- Calculate revenue generated per event.

### Joins and Subqueries
- Display event details with venue information.
- Find attendees whose ticket payment is not successful.
- Find events without ticket bookings.
- Demonstrate a FULL OUTER JOIN-style result in MySQL using `UNION`.
- Find attendees who booked multiple events.
- Find organizers who manage more than three events.
- Compare event revenue with the average ticket price.

### Date, String, and Window Functions
- Extract the month from an event date.
- Calculate days remaining for upcoming events.
- Format payment dates as `YYYY-MM-DD HH:MM:SS`.
- Convert organizer names to uppercase.
- Remove leading and trailing spaces from attendee names.
- Replace NULL email values with `Not Provided`.
- Rank events by successful revenue.
- Calculate cumulative ticket sales.
- Calculate running confirmed attendee totals.

### CASE Expressions

**Event demand categories (as specified in the project instructions):**
- High Demand: available seats are less than 20% of total seats.
- Moderate Demand: available seats are between 20% and 50% of total seats.
- Low Demand: otherwise.

**Payment status categories:**
- `Success` → `Successful`
- `Failed` → `Failed`
- Other values → `Pending`

## ▶️ 7. How to Run the Project

1. Install MySQL Server.
2. Open MySQL Workbench or another MySQL-compatible editor.
3. Open `smart_event_management.sql`.
4. Execute the script from the beginning.
5. The script creates the `smart_event_db` database.
6. It creates all six tables and inserts sample data.
7. Run the queries section by section and inspect the results.

### Useful Verification Commands

```sql
SHOW DATABASES;
USE smart_event_db;
SHOW TABLES;

DESC Events;
DESC Venues;
DESC Organizers;
DESC Attendees;
DESC Tickets;
DESC Payments;
```

## 📁 8. Project Folder Structure

```text
Smart-Event-Management-System/
│
├── README.md
└── smart_event_management.sql
```

## 🧪 9. Sample Data Included

The SQL script contains:
- 5 venues in Surat, Ahmedabad, Vadodara, Rajkot, and Navsari.
- 4 organizers.
- 8 attendees.
- 8 events.
- 12 ticket bookings.
- 12 payment records.

The sample data demonstrates multiple-event bookings, an organizer managing multiple events, successful and pending payments, failed payments, and revenue reports.

## ⚠️ 10. Important Notes

- This project uses MySQL 8.0+ because it includes window functions.
- Run the script from top to bottom.
- The script drops and recreates its project tables at the beginning. Do not run it in a database containing data you need to keep.
- Parent records must exist before related child records can be inserted.
- Delete child records before parent records when foreign key relationships exist.
- `available_seats` is stored as a column in the supplied schema. The sample values are demonstration data; a production application should update this value whenever a booking is confirmed or cancelled.
- Payment statuses use `Success`, `Failed`, and `Pending`, matching the supplied project schema.
- MySQL does not directly support `FULL OUTER JOIN`; the project demonstrates a full-outer-join-style result using `LEFT JOIN`, `RIGHT JOIN`, and `UNION`.
- The seven-day booking query depends on the current date when executed.

## 🌱 11. Future Improvements

- Automatically update available seats after confirmed bookings and cancellations.
- Prevent bookings when an event has no available seats.
- Add validation for email addresses and phone numbers.
- Add user authentication and role-based access.
- Add booking cancellation and refund management.
- Integrate a secure payment gateway in a future application.
- Build a dashboard to visualize revenue, bookings, and event demand.
- Connect the database with a Python or web application.

## 📚 12. What I Learned

Through this project, I practised:
- Database creation and table design.
- Primary keys, foreign keys, and unique constraints.
- CRUD operations.
- SQL filtering, sorting, and grouping.
- Aggregate functions and subqueries.
- INNER, LEFT, RIGHT, and FULL OUTER JOIN-style queries.
- Date and time functions.
- String manipulation functions.
- Window functions and CASE expressions.
- Designing queries for practical event-management requirements.

## 👩‍💻 13. About the Author

**Digna Vora**  
B.Sc. IT Student | Vidhyadeep University

**Areas of Interest**
- SQL and Database Management
- Python Programming
- Data Analytics
- Artificial Intelligence
- Machine Learning
- Data Science

I am learning new technologies and building practical projects to strengthen my programming, database, and problem-solving skills.

## 📬 14. Connect

- **GitHub:** Add your GitHub profile URL.
- **LinkedIn:** Add your LinkedIn profile URL.
- **Email:** Add your email address.

---

## ⭐ Conclusion

The **Smart Event Management System** demonstrates how MySQL can be used to design a relational database for event management. It connects event, venue, organizer, attendee, ticket, and payment information and applies SQL concepts to retrieve and analyse records.

This project helped me gain practical experience with database design and the SQL topics listed in the project instructions.

<p align="center">
  <b>Thank you for visiting my project! 💙</b><br>
  <i>Keep Learning • Keep Practising • Keep Building</i>
</p>
