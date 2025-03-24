import pandas as pd

url="https://raw.githubusercontent.com/noora20FH/skripsi_noora2023/main/online_store_data.csv"

def data_load():
  df =pd.read_csv(url)
  return df

def sample_rows():
  sample = data_load().head(1)
  return sample

print(sample_rows())