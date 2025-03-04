from sqlalchemy import create_engine
import pandas as pd

#Necesitamos cargar un archivo .env con las variables de la base de datos
from dotenv import load_dotenv
import os

#cargando variables de entorno
load_dotenv(override=True) #override=True hace que priorice las variables .env sobre las del sistema
USER = os.getenv('USER')
PASSWORD = os.getenv('PASSWORD')
HOST = os.getenv('HOST')
DB_NAME = os.getenv('DB_NAME')

engine = create_engine(f"mysql+mysqlconnector://{USER}:{PASSWORD}@{HOST}/{DB_NAME}")

print(PASSWORD)


"""
El primer parametro (tabla) corresponde al nombre de la tabla donde se insertaran los datos
csv es el nombre del archivo que se cargara a la tabla
"""
def importar_csv_a_sql(tabla, csv):
    df = pd.read_csv(csv)  # Cargar CSV en un DataFrame
    df.to_sql(tabla, con=engine, if_exists="append", index=False)

    #Este se usa solo en el csv donde se ubique la longuitud y latitud
    if csv == 'DIRECCION_CORREGIDO.csv':
        df = df[(df["latitud"].between(-90, 90)) & (df["longitud"].between(-180, 180))]
    print(f"Datos insertados en {tabla}")


# Importar cada tabla
#importar_csv_a_sql("ASENTAMIENTO", "ASENTAMIENTO.csv")
#importar_csv_a_sql("DIRECCION", "DIRECCION_CORREGIDO.csv")
#importar_csv_a_sql("ESTABLECIMIENTO_CONTACTO", "ESTABLECIMIENTO_CONTACTO.csv")
#importar_csv_a_sql("ESTABLECIMIENTO", "ESTABLECIMIENTO_MOD.csv")
