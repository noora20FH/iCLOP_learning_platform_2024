import random
import sys
from pathlib import Path
import numpy as np
import subprocess
import importlib
import codewars_test
import pandas as pd
import matplotlib.pyplot as plt

# Update paths and filename
path_answer = "/content/"  # changed
filename = "answer_bab4_percobaan1.py"  # changed

# Import the answer module
pc = importlib.import_module(filename[:-3], ".")
cmd = subprocess.run([sys.executable, f"{path_answer}{filename}"], capture_output=True)  # changed

@codewars_test.describe("BAB 4 | Percobaan 1")
def fixed_tests():
    data = {
        'Age Group': ['0-18', '19-30', '31-45', '46-60', '61+'],
        'Population': [25000, 30000, 20000, 15000, 10000]
        }
    df = pd.DataFrame(data) 


    @codewars_test.it("1. Test Memuat Data")
    def test_load_data():
        print("========================================================================")
        # Assuming expected columns are "Customer ID", "Age" and "Total Spent (USD)"
        expected_columns = ['Age Group', 'Population']
        try:
              codewars_test.assert_equals(list(pc.load_data().columns), expected_columns, "====> URL dataset yang digunakan tidak sesuai; kolom pada dataset berbeda")
        except Exception as e:
              codewars_test.fail(f"====> Error loading data; Terdapat Typo pada kode: {str(e)}")
  
        expected_rows = 5
        try:        
                codewars_test.assert_equals(len(pc.load_data()), expected_rows, "Dataframe should have expected rows")
        except Exception as e:
            codewars_test.fail(f"====> Error checking row count; Terdapat Typo pada Kode: {str(e)}")
        print("")

    @codewars_test.it("Get Population Column")
    def test_get_population_column(): 
        print("========================================================================")
        expected_total = list(df['Population'])
        codewars_test.assert_equals(list(pc.load_data()['Population']), expected_total, "Dataframe should have expected total")
        print("")

    @codewars_test.it("Get Age Group Column")
    def test_get_age_group_column(): 
        print("========================================================================")
        expected_total = list(df['Age Group'])
        codewars_test.assert_equals(list(pc.load_data()['Age Group']), expected_total, "Dataframe should have expected total")
        print("")

    @codewars_test.it("Check Pie Chart")
    def test_pie_chart():  
        print("========================================================================")
        # Since we can't directly test the pie chart, we'll test the create_pie_chart function
        try:
            pc.create_pie_chart()
        except Exception as e:
            codewars_test.fail(f"====> Error creating pie chart; Terdapat Typo pada Kode: {str(e)}")
        print("")