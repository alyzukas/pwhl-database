# PWHL Database
---

## Project Overview

This project designs and implements a relational database to model hockey data from the Professional Women’s Hockey League (PWHL).
The database captures key entities such as players, teams, games, seasons, locations, goals, assists, shots, penalties, and player tenure, allowing for structured analysis of both roster information and in-game events.

Using SQLite, we translate an entity–relationship diagram into a normalized relational schema, populate the database with realistic sample data, and write SQL queries using JOINs and subqueries to answer real-world hockey analytics questions related to player performance, team composition, and game outcomes.

- **Objective**: Build a normalized relational database for PWHL hockey data and demonstrate relational querying using JOINs and subqueries.
- **Domain**: Sports Analytics / Data Management / Relational Databases
- **Key Techniques**: Schema design, primary and foreign keys, multi-table JOINs, nested subqueries, data integrity constraints

---

## Project Structure

```
pwhl-hockey-database/
│
├── data/
│   ├── raw/                  # Original CSV / Excel files (players, games, penalties, etc.)
│   ├── processed/            # Cleaned or transformed CSVs used for insertion
│   └── hockey.db             # SQLite database file
│
├── sql/
│   ├── create_tables.sql     # CREATE TABLE statements + foreign keys
│   ├── insert_data.sql       # INSERT statements for all tables
│   ├── test_queries.sql      # JOINs, subqueries, validation queries
│   └── drop_tables.sql       # Optional reset script (DROP TABLE statements)
│
├── diagrams/
│   └── erd.png               # Entity Relationship Diagram (ERD)
│
├── reports/
│   └── part3_queries.pdf     # Written explanation of JOINs & subqueries (for submission)
│
├── README.md                 # Project overview, schema explanation, usage
└── .gitignore                # Ignore DB files if required
```
