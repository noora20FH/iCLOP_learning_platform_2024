import pandas as pd

url="https://raw.githubusercontent.com/noora20FH/skripsi_noora2023/main/purchases.csv"

def data_load():
  df =pd.read_csv(url)
  return df

print(data_load())