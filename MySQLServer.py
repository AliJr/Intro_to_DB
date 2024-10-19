import mysql.connector
from mysql.connector import Error

def create_database():
    try:
        # Connect to MySQL server
        connection = mysql.connector.connect(
            host='localhost',  # Change to your MySQL server host
            user='root',       # Change to your MySQL user
            password='your_password'  # Change to your MySQL password
        )
        
        if connection.is_connected():
            cursor = connection.cursor()

            # Create the database if it doesn't exist (using IF NOT EXISTS)
            create_db_query = "CREATE DATABASE IF NOT EXISTS alx_book_store"
            cursor.execute(create_db_query)

            print("Database 'alx_book_store' created successfully!")

    except Error as e:
        print(f"Error while connecting to MySQL: {e}")

    finally:
        # Close the cursor and connection
        if connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection is closed.")

if __name__ == "__main__":
    create_database()