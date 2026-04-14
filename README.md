#  Database

A PostgreSQL relational database cataloguing celestial bodies across the universe — including galaxies, stars, planets, moons, and more. Built as part of the **freeCodeCamp Relational Database Certification**.

---

##  Project Overview

This project demonstrates core relational database concepts by modelling a universe of celestial objects. It was completed to satisfy the requirements of the freeCodeCamp *Celestial Bodies Database* project.

## 🗄️ Database Structure

The schema includes at least **5 tables** with proper primary keys, foreign keys, and constraints:

| Table | Description |
|---|---|
| `galaxy` | Top-level classification of galaxies |
| `star` | Stars belonging to each galaxy |
| `planet` | Planets orbiting each star |
| `moon` | Moons orbiting each planet |
| `constellation` | Supplementary celestial data |

## Key Requirements Met

- Each table has a primary key with serial auto-increment
- Foreign key relationships link all tables hierarchically
- Column types include `INT`, `VARCHAR`, `BOOLEAN`, `NUMERIC`, and `TEXT`
- At least one `UNIQUE` and one `NOT NULL` constraint applied
- Minimum row counts: 6 galaxies, 6 stars, 12 planets, 20 moons

## 🛠️ Technologies Used

- PostgreSQL
- Bash terminal (freeCodeCamp virtual environment)
- `pg_dump` for database export

##  How to Restore the Database

```bash
psql --username=freecodecamp --dbname=postgres < universe.sql
```
or use link above to preview code
---

Part of the [freeCodeCamp Relational Database Certification](https://www.freecodecamp.org/learn/relational-database/)
