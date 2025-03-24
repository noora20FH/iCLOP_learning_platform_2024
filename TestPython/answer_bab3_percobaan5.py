import pandas as pd

url = "https://raw.githubusercontent.com/noora20FH/skripsi_noora2023/main/penjualan_elektronik.csv"
# Memuat data
def load_data():
 
  data = pd.read_csv(url)
  return data

# Menghitung Measures of Central Tendency
def mean_penjualan():
  mean_penjualan = load_data()['Jumlah Terjual'].mean()
  return mean_penjualan

def median_penjualan():
  median_penjualan = load_data()['Jumlah Terjual'].median()
  return median_penjualan

def mode_penjualan():
  mode_penjualan = load_data()['Jumlah Terjual'].mode().iloc[0]  # Assuming mode returns a Series
  return mode_penjualan

print(f"Rata-rata penjualan: {mean_penjualan()}")
print(f"Median penjualan: {median_penjualan()}")
print(f"Mode penjualan: {mode_penjualan()}")