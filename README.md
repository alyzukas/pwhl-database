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
pwhl-database/
│
├── data/
│   ├── dummy_data.xlsx/          # Original Excel files (players, games, penalties, etc.)
│   ├── cleaned_data.csv/         # Cleaned and transformed CSVs used for insertion
│   └── pwhl_hockey.db            # SQLite database file
│
├── sql/
│   ├── create_tables.sql         # CREATE TABLE statements + foreign keys
│   ├── insert_data.sql           # INSERT statements for all tables
│   ├── initial_queries.sql       # Initial validation queries
|   ├── subqueries.sql            # JOINs, subqueries
|   ├── multi_table_queries.sql   # Multi-table SQL queries used to analyse output in pandas
│
├── diagrams/
│   └── erd.png                   # Entity Relationship Diagram (ERD)
│
├── code/
│   └── data_cleaning.ipynb       # Jupyter Notebook used for data cleaning and transformation
│   └── (week 7, etc).ipynb       # Jupyter Notebook used for data cleaning and transformation
│
├── reports/
│   └── [ADD]part3_queries.pdf    # Written explanation of JOINs & subqueries (for submission)
│
├── README.md                     # Project overview, schema explanation, usage
└── .gitignore                    # Ignore DB files if required
```
---

## Data Sources

Data for this project was compiled from publicly available PWHL game summaries, play-by-play logs, and roster information.  
The dataset includes manually curated and cleaned records for seasons, teams, players, games, shots, goals, assists, penalties, and player tenure.

External reference structure and inspiration:
- Isabelle Lefebvre – PWHL Data Reference Repository

---

## Database Schema Overview

The database is designed using a normalized relational schema to model professional women’s hockey data.

Core entities include:
- **season** – competition seasons and playoffs
- **team** – PWHL teams
- **player** – player biographical information
- **game** – individual games with home/away teams and venue
- **shot** – shot-level events
- **goal** – goal outcomes linked to shots
- **assist** – primary and secondary assists per goal
- **penalties** – infractions during games
- **tenure** – player-team-season relationships

Foreign key constraints enforce referential integrity between tables.

---

## Tools & Technologies

- SQLite (relational database)
- SQL (DDL, DML, JOINs, subqueries)
- DB Browser for SQLite
- CSV / Excel (data sources)
- Git & GitHub
- Markdown documentation
  
---

## Assumptions & Limitations

- Not all PWHL games or players are included; the dataset is a representative sample
- Time values are normalized using a placeholder date for intra-game timing
- Some advanced statistics (e.g., power-play context) are simplified
- The schema prioritizes clarity and relational integrity over performance optimization

---

## Authors

- **Alyssa Zukas** — [alyzukas@seattu.edu](mailto:alyzukas@seattu.edu)
- **Brisa**
- **EJ**
- **Njenga**

---

## License

This project is licensed under the **MIT License** – see the [LICENSE](LICENSE) file for details.

---

## Acknowledgements

- Seattle University – *CPSP 5071: Data Management for Data Scientists (Winter 2026)*  
- GitHub Repository: IsabelleLefebvre97 [PWHL-Data-Reference](https://github.com/IsabelleLefebvre97/PWHL-Data-Reference)
- Python open-source community for enabling reproducible scientific analysis  
