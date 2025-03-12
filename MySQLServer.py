import mysql.connector
from mysql.connector import Error

try:
# Replace with your connection details
    mydb = mysql.connector.connect(
        host="localhost",
        user="Charity18",
        password="xT9@bQ!4z&Wp7%Lm"
)
    if mydb.is_connected():
        print("Connection successful!")

    mycursor = mydb.cursor()

    mycursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
    print("Database 'alx_book_store' created successfully!")

except mysql.connector.Error as e:
    print(f"Error: {e}")

finally:

    if 'mydb' in locals() and mydb.is_connected():
        mycursor.close()
        mydb.close()
        print("Database connection closed!")


