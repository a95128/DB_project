import csv
import mysql.connector
from mysql.connector import errorcode

# Connect to the database
cnx = mysql.connector.connect(
    host='localhost',
    user='root',
    password='Ana11012002.',
    database='Livraria'
)
cursor = cnx.cursor()

#migrar para clientes

# Read data from CSV and insert into the table
with open('../datasets/clientes.csv', 'r') as csvfile:
    csvreader = csv.reader(csvfile, delimiter=';')
    next(csvreader)  # Skip header row
    
    for row in csvreader:
        ID = int(row[0])
        Nome = row[1]
        Email = row[2]
        NIF = row[3]
        Username = row[4]
        PalavraPasse = row[5]
        Numerodetelemovel = row[6]
        Localidade = row[7]
        CodigoPostal = row[8]
        NdaPorta = row[9]
        Rua = row[10]
        
        insert_query = "INSERT INTO `Livraria`.`Cliente` (ID, Nome, Email, NIF, Username, `Palavra-Passe`, `Numero de telemovel`, Localidade, `Codigo Postal`, `N da Porta`, Rua) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
        values = (ID, Nome, Email, NIF, Username, PalavraPasse, Numerodetelemovel, Localidade, CodigoPostal, NdaPorta, Rua)
        cursor.execute(insert_query, values)
    
    cnx.commit()
    cursor.close()
    cnx.close()

    print("SUCESSO!")