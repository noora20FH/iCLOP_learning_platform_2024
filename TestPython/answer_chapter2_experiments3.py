import pandas as pd

def load_data():
  url = "https://raw.githubusercontent.com/noora20FH/skripsi_noora2023/main/data.csv"
  df = pd.read_csv(url)
  return df

def updated_data():
  updatdf = load_data().fillna(load_data()['Calories'].mean())
  return updated_df

