import pandas as pd

url = "https://raw.githubusercontent.com/noora20FH/skripsi_noora2023/master/data_toko.csv"  # Replace with your actual URL

# Read the CSV directly from the URL
def data_load():
  data_toko = pd.read_csv(url)
  return data_toko

# Tampilkan 5 baris pertama DataFrame
def head_rows():
  return data_load().head()

# Hitung pendapatan total dari penjualan semua produk
def updated_data():
  df = data_load().copy()
  # Assuming columns "Unit price" and "Quantity" exist
  df["Total Revenue"] = df["Unit price"] * df["Quantity"]
  return df

# Calculate total pendapatan (revenue)
def total_pendapatan():
  return updated_data()['Total Revenue'].sum()

# Print the total pendapatan
print("Total Pendapatan:", total_pendapatan())