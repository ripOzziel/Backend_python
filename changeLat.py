import pandas as pd

df = pd.read_csv("DIRECCION.csv")

df["latitud"] = df["latitud"].astype(str).str.replace(",", ".").astype(float)
df["longitud"] = df["longitud"].astype(str).str.replace(",", ".").astype(float)

df.to_csv("DIRECCION_CORREGIDO.csv", index=False)
