

import numpy as np
import pandas as pd

# Sample data (replace with your actual data)

url = "https://raw.githubusercontent.com/noora20FH/skripsi_noora2023/main/nyc_perumahan.csv"  # Replace with your actual URL

# Read the CSV directly from the URL
data_toko = pd.read_csv(url)
def load_data():

  df = pd.read_csv(url)
  return df

def clean_columns():
  unnecessary_columns = ['BLOCK', 'LOT','EASE-MENT','TAX CLASS AT PRESENT','TAX CLASS AT TIME OF SALE']
  df = load_data().drop(unnecessary_columns, axis=1)
  return df

def clean_columns_name():
  clean_names = {
      "BOROUGH":"BOROUGH", 
      "NEIGHBORHOOD":"NEIGHBORHOOD",
      "ADDRESS":"ADDRESS",
      "BUILDING CLASS CATEGORY": "BUILDING_CLASS_CATEGORY",
      "BUILDING CLASS AT PRESENT":"BUILDING_CLASS_AT_PRESENT",
      "APARTMENT NUMBER": "APARTMENT_NUMBER",
      "ZIP CODE": "ZIP_CODE",
      "RESIDENTIAL UNITS": "RESIDENTIAL_UNITS",
      "COMMERCIAL UNITS": "COMMERCIAL_UNITS",
      "TOTAL UNITS": "TOTAL_UNITS",
      "LAND SQUARE FEET": "LAND_SQUARE_FEET",
      "GROSS SQUARE FEET": "GROSS_SQUARE_FEET",
      "Box Office (Millions USD)": "Box_Office",
      "YEAR BUILT": "YEAR_BUILT",
      "BUILDING CLASS AT TIME OF SALE": "BUILDING_CLASS_AT_TIME_OF_SALE",
      "SALE PRICE": "SALE_PRICE",
      "SALE DATE": "SALE_DATE"
  }
  data = clean_columns().rename(columns=clean_names)
  return data
print(clean_columns_name().columns)
