# PWHL Database
---

## Project Overview

This project designs and implements a relational database to model hockey data from the Professional Women’s Hockey League (PWHL).
The database captures key entities such as players, teams, games, seasons, locations, goals, assists, shots, penalties, and player tenure, allowing for structured analysis of both roster information and in-game events.

Using SQLite, we translate an entity–relationship diagram into a normalized relational schema, populate the database with realistic sample data, and write SQL queries using JOINs and subqueries to answer real-world hockey analytics questions related to player performance, team composition, and game outcomes.

- **Objective**: Build a normalized relational database for PWHL hockey data and demonstrate the full data workflow—from relational querying with JOINs and subqueries to analysis-ready datasets using Python and pandas.
  
- **Domain**: Sports Analytics / Data Management / Relational Databases
  
- **Key Techniques:**
  -  Schema design, primary and foreign keys, multi-table JOINs, nested subqueries, data integrity constraints, pandas-based data cleaning and transformation.
  -  As the project progresses, query outputs are transitioned into pandas DataFrames to support data cleaning, transformation, and downstream analytics.



---

## Project Structure

```
pwhl-database/
│
├── data/
│   └── pwhl_hockey.db            # SQLite database file
│   └── dummy_data.xlsx          # Original Excel files (players, games, penalties, etc.)
│   └── cleaned_data.csv         # Cleaned and transformed data used for insertion
│   └── final_data.csv           # Final data from ETL pipeline
│
├── sql/
│   └── create_tables.sql         # CREATE TABLE statements + foreign keys
│   └── insert_data.sql           # INSERT statements for all tables
│   └── initial_queries.sql       # Initial validation queries
|   └── subqueries.sql            # JOINs, subqueries
|   └── Week 6                    # Contains the SQL and schema updates used for data cleaning and transformation
|   └───── query1_shots.sql         # Primary shot-level JOIN query (used to generate main analysis dataset)
|   └───── query2_shots.sql         # Additional AGG query to supplement analysis (not used in main analysis)
|   └───── schema_updated.sql       # Updated relational schema reflecting refinements made during Week 6.
|   └───── sample_data_updated.sql  # Updated sample data insert statements aligned with the revised schema
|   └───── multi_table_queries.sql
│
├── diagrams/
│   └── erd.png                   # Entity Relationship Diagram (ERD)
│
├── code/
│   └── data_cleaning.ipynb       # Jupyter Notebook used for data cleaning and transformation
│   └── etl_pipeline.ipynb        # Jupyter Notebook used ETL design and implementation
│
├── reports/
│   └── [ADD]part3_queries.pdf    # Written explanation of JOINs & subqueries (for submission)
│   └── week6_readme.txt          # Written explanation of data cleaning & transformation techniques (for submission)
│   └── week7_readme.txt          # Written explanation of ETL pipeline design and implementation techniques (for submission)
│
├── README.md                     # Project overview, schema explanation, usage
└── .gitignore                    # Ignore DB files if required
```
---

## Project Milestones & Progress

This repository tracks the incremental development of a relational database and analytics workflow for PWHL hockey data. The project is structured around weekly milestones that mirror a real-world data pipeline, progressing from schema design to SQL querying, data cleaning, ETL, and optimization.

### Completed Milestones

- **Week 2 – Team Formation & Project Selection**
  - Selected the PWHL hockey domain
  - Designed an ER diagram identifying core entities and relationships

- **Week 3 – Initial SQL Queries**
  - Created normalized tables using SQLite
  - Inserted realistic sample data
  - Wrote basic SQL queries to validate schema and relationships

- **Week 4 – JOINs & Subqueries**
  - Implemented multi-table JOIN queries across players, teams, games, and events
  - Used INNER JOIN and LEFT JOIN to preserve relational integrity
  - Applied subqueries to answer domain-driven analytics questions

- **Week 5 – Aggregation & Grouping**
  - Used GROUP BY with aggregation functions (COUNT, SUM, AVG)
  - Generated summary-level insights such as player scoring totals and team performance
 
- **Week 6 – Data Cleaning & Transformation**
  - In this milestone, the project transitions from SQL querying to data analysis using Python and pandas.
    - Multi-table SQL JOIN queries are written and saved in `multi_table_queries.sql`
    - One JOIN-based query is selected as the primary analysis dataset
    - The SQLite database is connected to a Jupyter Notebook using `sqlite3`
    - Query results are loaded directly into pandas using `pd.read_sql()`
    - The resulting DataFrame is inspected using:
      - `df.head()`
      - `df.info()`
      - `df.describe()`
      
  - Within pandas, the dataset is cleaned and transformed to improve usability and analytical clarity:
    - Missing values are identified and handled using appropriate strategies
    - Column names are standardized and data types corrected
    - New derived features are created (e.g., full player name, aggregated performance metrics)
    - The cleaned dataset is optionally exported as `cleaned_data.csv`

  - This step produces an analysis-ready dataset that will be reused in future milestones.

- **Week 7 – ETL Pipeline**
  - Build a functional ETL pipeline to ingest data from CSV/JSON/API sources into SQLite

- **Week 8 – Indexing & Query Optimization**
  - Improve query performance using indexing
  - Compare optimized vs non-optimized query execution

- **Week 9 – Final Submission & Presentation**
  - Finalize database, analytics workflow, and documentation
  - Record a concise presentation demonstrating the project


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
