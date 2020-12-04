import cx_Oracle
import pandas as pd

cx_Oracle.init_oracle_client(lib_dir = "/mnt/c/Users/12408/Documents/CSC423/Homeworks/python_tutorial/python_tutorial/instantclient_19_9/")

connection = cx_Oracle.connect(
    "user", "pass", "lawtech.law.miami.edu/CSC_423")
cursor = connection.cursor()


#questions
print("enter the query number for which query you'd like to run:\n ")
print("1.) List all the staff members.\n")
print("2.) List the hire agreement that is associated with client 'c001'.\n")
print("3.) Find the hire agreement that ends on 10-02-2020.\n")
print("4.) Find all hire agreements with vehicles that have an end mileage greater than 100.\n ")
print("5.) Find all the staff that work at the outlet on 1st street.\n")

query = int(input())


#queries
if query == 1:
    cursor.execute("""
        SELECT *
        FROM CarStaff
        """)
    columns = [c[0] for c in cursor.description]
    data = cursor.fetchall()
    df = pd.DataFrame(data, columns = columns)
    print(df)


if query == 2:
    cursor.execute("""
        SELECT *
        FROM HireAgreements
        WHERE clientNum = 'c001'
        """)
    columns = [c[0] for c in cursor.description]
    data = cursor.fetchall()
    df = pd.DataFrame(data, columns = columns)
    print(df)


elif query == 3:
    cursor.execute("""
        SELECT *
        FROM HireAgreements h
        INNER JOIN Dates d on h.startDate = d.startDate
        WHERE d.endDate = '10-02-2020'
        """)
    columns = [c[0] for c in cursor.description]
    data = cursor.fetchall()
    df = pd.DataFrame(data, columns = columns)
    print(df)

elif query == 4:
    cursor.execute("""
        SELECT *
        FROM HireAgreements h
        INNER JOIN Mileage m on m.startMileage = h.startMileage
        WHERE m.endMileage > '100'
        """)
    columns = [c[0] for c in cursor.description]
    data = cursor.fetchall()
    df = pd.DataFrame(data, columns = columns)
    print(df)

elif query == 5:
    cursor.execute("""
        SELECT *
        FROM CarStaff c
        JOIN Outlet o ON o.outletNum = c.outletNum
        WHERE o.address = '1st street'
        """)
    columns = [c[0] for c in cursor.description]
    data = cursor.fetchall()
    df = pd.DataFrame(data, columns = columns)
    print(df)
