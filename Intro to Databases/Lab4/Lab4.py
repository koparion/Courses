import mysql.connector
# import psycopg2

try:
    dbconn = mysql.connector.connect(
    host="localhost",
    user="newu",
    password="41PDMa1$1",
    database="lab4"
    )
    cursor = dbconn.cursor();
    print("connected to DB\n")
    def select():
            # sqlQuery = "SELECT * FROM Games WHERE gname = %s", (gname,) 
            print("Selecting one game:\n");
            gname = 'Gears of War';
            cursor.execute("SELECT * FROM Games WHERE gname = %s", (gname,));
            result = cursor.fetchall()
            for row in result:
                    print("row")
                    for field in row:
                        print("field : %s " % field)
            if result is None:
                return False
    select()
    def selectALL():
            sqlQuery = "SELECT * FROM Games" 
            print("\nSelecting All:\n");
            cursor.execute(sqlQuery);
            result = cursor.fetchall()
            for row in result:
                    print("row")
                    for field in row:
                        print("field : %s " % field)
            if result is None:
                return False
    selectALL()

    def addGame():
        try:
            print("inserting game")
            val = ('Gears of War2');
            sqlquery = """INSERT INTO Games (gname) VALUES (%s)"""
            cursor.execute(sqlquery, (val,))
            dbconn.commit();
            print("data inserted")
        except:
            print("failed to insert game1")
            exit(1)
    addGame()
   
    def addGame2():
        try:
            sqlquery = "INSERT INTO Games (gname) VALUES (%s)";
            val = 'Gears of War3';
            cursor.execute(sqlquery, (val,))
            dbconn.commit();
            print("data inserted")
        except:
            print("failed to insert game2")
            exit(1)
    addGame2()

    def deleteGame():
        try:
            # sqlquery = "DELETE FROM Games WHERE gname=%s";
            val = "Gears of War";
            cursor.execute("DELETE FROM Games WHERE gname=%s", (val,));
            dbconn.commit();
            print("game deleted")
        except:
            print("failed to delete game")
            exit(1)
    deleteGame()

except:
            print("Error: Can not connect to database.");
            exit(1);

dbconn.close();
