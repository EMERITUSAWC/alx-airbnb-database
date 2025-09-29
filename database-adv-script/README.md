# Python Generators Project

This repository contains solutions for tasks related to Python generators, focusing on efficient data handling with large datasets and database interactions.

## Task 0: Getting started with Python Generators

This task involves setting up a MySQL database named `ALX_prodev` and populating its `user_data` table from a CSV file (`user_data.csv`).

The `seed.py` script contains functions to:
- Connect to the MySQL server.
- Create the `ALX_prodev` database.
- Connect to the `ALX_prodev` database.
- Create the `user_data` table with specified fields.
- Insert data from `user_data.csv` into the `user_data` table.

## How to Run Task 0

1.  Ensure you have MySQL server running and `mysql-connector-python` installed (`pip install mysql-connector-python`).
2.  Place your `user_data.csv` file in the same directory.
3.  **Important:** Edit `seed.py` to configure your MySQL connection details (e.g., `password`).
4.  Run the `0-main.py` script:
    ```bash
    ./0-main.py
    ```
This will set up the database and display the first 5 rows of `user_data`.