import pandas as pd

df = pd.read_csv('ESTABLECIMIENTO.csv')

df['fecha_alta']= df['fecha_alta'].astype(str) + '-01'

df.to_csv('ESTABLECIMIENTO_MOD.csv', index= False)