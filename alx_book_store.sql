import mysql.connector

# Replace with your connection details
mydb = mysql.connector.connect(
    host="localhost",
    user="Charity18",
    password="xT9@bQ!4z&Wp7%Lm",
)

mycursor = mydb.cursor()

mycursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")

mycursor.execute("USE alx_book_store")

mycursor.execute("""
CREATE TABLE IF NOT EXISTS Authors(
    id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL
)
""")

print("Authors table created successfully!")

mycursor.execute("""
CREATE TABLE IF NOT EXISTS Books(
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT,
    FOREIGN KEY (author_id) REFERENCES authors(id) ON DELETE CASCADE,
    price DOUBLE NOT NULL,
    publication_date DATE NOT NULL
)
""")

print("Books table created successfully!")

mycursor.execute("""
CREATE TABLE IF NOT EXISTS Customers(
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) NOT NULL UNIQUE,
    address TEXT NOT NULL
)
""")

print("Customers table created successfully!")

mycursor.execute("""
CREATE TABLE IF NOT EXISTS Orders(
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    order_date DATE NOT NULL
)
""")

print("Orders table created successfully!")

mycursor.execute("""
CREATE TABLE IF NOT EXISTS Order_Details(
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    book_id INT,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    quantity DOUBLE NOT NULL
)
""")

print("Order_Details table created successfully!")

mycursor.close()
mydb.close()

print("Database connection closed!")
