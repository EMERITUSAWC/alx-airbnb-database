#!/usr/bin/python3
import mysql.connector
import csv
import uuid

# Database connection details (ADJUST IF NEEDED!)
# If your MySQL root user has a password, change 'password=""' to 'password="your_password"'
DB_CONFIG = {
    'host': 'localhost',
    'user': 'root',
    'password': '' # <--- IMPORTANT: Add your MySQL root password here if you have one!
}
DATABASE_NAME = "ALX_prodev"
TABLE_NAME = "user_data"

def connect_db():
    """Connects to the MySQL database server."""
    try:
        connection = mysql.connector.connect(**DB_CONFIG)
        if connection.is_connected():
            print("Successfully connected to MySQL server.")
            return connection
    except mysql.connector.Error as err:
        print(f"Error connecting to MySQL: {err}")
        return None

def create_database(connection):
    """Creates the database ALX_prodev if it does not exist."""
    cursor = connection.cursor()
    try:
        cursor.execute(f"CREATE DATABASE IF NOT EXISTS {DATABASE_NAME}")
        print(f"Database {DATABASE_NAME} ensured to exist.")
    except mysql.connector.Error as err:
        print(f"Failed creating database: {err}")
    finally:
        cursor.close()

def connect_to_prodev():
    """Connects to the ALX_prodev database in MySQL."""
    prodev_config = DB_CONFIG.copy()
    prodev_config['database'] = DATABASE_NAME
    try:
        connection = mysql.connector.connect(**prodev_config)
        if connection.is_connected():
            print(f"Successfully connected to {DATABASE_NAME} database.")
            return connection
    except mysql.connector.Error as err:
        print(f"Error connecting to {DATABASE_NAME}: {err}")
        return None

def create_table(connection):
    """Creates a table user_data if it does not exists with the required fields."""
    cursor = connection.cursor()
    create_table_query = f"""
    CREATE TABLE IF NOT EXISTS {TABLE_NAME} (
        user_id VARCHAR(36) PRIMARY KEY,
        name VARCHAR(255) NOT NULL,
        email VARCHAR(255) NOT NULL UNIQUE,
        age DECIMAL(5, 2) NOT NULL
    )
    """
    try:
        cursor.execute(create_table_query)
        print(f"Table {TABLE_NAME} created successfully or already exists.")
    except mysql.connector.Error as err:
        print(f"Failed creating table: {err}")
    finally:
        cursor.close()

def insert_data(connection, csv_file_path):
    """Inserts data from a CSV file into the database if it does not exist."""
    cursor = connection.cursor()
    insert_query = f"""
    INSERT INTO {TABLE_NAME} (user_id, name, email, age)
    VALUES (%s, %s, %s, %s) ON DUPLICATE KEY UPDATE
    name=VALUES(name), email=VALUES(email), age=VALUES(age)
    """ # Using ON DUPLICATE KEY UPDATE to handle existing data if rerunning

    try:
        with open(csv_file_path, 'r', newline='') as file:
            reader = csv.DictReader(file)
            for row in reader:
                # Generate UUID if not provided in CSV or if it's empty
                user_id = row.get('user_id')
                if not user_id:
                    user_id = str(uuid.uuid4())

                data = (
                    user_id,
                    row['name'],
                    row['email'],
                    float(row['age'])
                )
                try:
                    cursor.execute(insert_query, data)
                except mysql.connector.Error as err:
                    # Print error but continue for other rows
                    print(f"Error inserting row {row.get('name', 'N/A')}: {err}")
        connection.commit()
        print("Data insertion process completed. Remember to check for specific row errors.")
    except FileNotFoundError:
        print(f"Error: CSV file not found at {csv_file_path}")
    except Exception as e:
        print(f"An unexpected error occurred during data insertion: {e}")
    finally:
        cursor.close()

if __name__ == '__main__':
    # Example usage for testing seed.py directly
    # You'll use 0-main.py as specified in the project
    pass # The main script 0-main.py will handle execution