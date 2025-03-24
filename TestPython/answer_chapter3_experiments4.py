import pandas as pd

# Create a dictionary with customer data (replace with your actual data)

url = "https://raw.githubusercontent.com/noora20FH/skripsi_noora2023/main/purchases.csv"

# Create a pandas DataFrame from the dictionary

def data_load():
  df = pd.read_csv(url)
  return df

#show first five rows
def head_rows():
  return data_load().sample(5)
# Descriptive Statistics


# Print additional statistics for each variable (age and total spent)
print("Customer Age:")
print(f"  Mean: {data_load()['Age'].mean()}")
print(f"  Median: {data_load()['Age'].median()}")
print(f"  Standard Deviation: {data_load()['Age'].std()}")
print(f"  Skewness: {data_load()['Age'].skew()}")
print(f"  Quartiles: {data_load()['Age'].quantile([0.25, 0.5, 0.75])}")

print("\nTotal Spent:")
print(f"  Mean: {data_load()['Total Spent (USD)'].mean()}")
print(f"  Median: {data_load()['Total Spent (USD)'].median()}")
print(f"  Standard Deviation: {data_load()['Total Spent (USD)'].std()}")
print(f"  Skewness: {data_load()['Total Spent (USD)'].skew()}")
print(f"  Quartiles: {data_load()['Total Spent (USD)'].quantile([0.25, 0.5, 0.75])}")


# Calculate the correlation coefficient between customer age and total spent
def correlation():
  correlation = data_load()["Age"].corr(data_load()["Total Spent (USD)"])
  return correlation
print(f"Correlation Coefficient: {correlation()}")
