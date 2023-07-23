!pip install mysql-connector-python
import mysql.connector as connector
connection = connector.connect(user = "temp1", password = "Apple123", database = "LittleLemonDB") 

show_tables_query = "SHOW tables;"
cursor = connection.cursor()
cursor.execute(show_tables_query)

results = cursor.fetchall()
print(results)

task3_query = """
SELECT c.FullName, c.ContactNumber, o.TotalCost FROM Orders o
LEFT JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE o.TotalCost > 60
"""
cursor.execute(task3_query)