import random
import sys
from pathlib import Path
import numpy as np
import subprocess
import importlib
import codewars_test
import pandas as pd

# Update paths and filename
path_answer = "/content/"  # changed
filename = "answer_chapter2_experiments3.py"  # changed

# Import the answer module
pc = importlib.import_module(filename[:-3], ".")
cmd = subprocess.run([sys.executable, f"{path_answer}{filename}"], capture_output=True)  # changed


@codewars_test.describe("Chapter 2 | Experiments 3")
def fixed_tests():

    @codewars_test.it("1. Loading Data Test")
    def test_load_data():
        print("========================================================================")
        # Assuming expected columns are "Customer ID", "Age" and "Total Spent (USD)"
        expected_columns = ['Duration', 'Pulse', 'Maxpulse', 'Calories']
        try:
            codewars_test.assert_equals(list(pc.load_data().columns), expected_columns, "====> The URL of the dataset used is not appropriate; the columns in the dataset are different.")
        except Exception as e:
            codewars_test.fail(f"====> Error loading data; There is typo in the code: {str(e)}")

        expected_rows = 169
        try:
            codewars_test.assert_equals(len(pc.load_data()), expected_rows, "====> Please check the URL used again; the number of data points in the dataset is different.")
        except Exception as e:
            codewars_test.fail(f"====> Error checking row count; There is typo in the code: {str(e)}")
    
        print("")


    # @codewars_test.it("2. Test Print Total Nilai yang Hilang")
    # def test_total_revenue():
    #       print("========================================================================")
    #       output_lines = cmd.stdout.decode().splitlines()
    #       codewars_test.assert_equals(bool(output_lines), True, '====> Error :Tidak Menampilkan total nilai hilang print()')


    @codewars_test.it("2. Filling The Missing Value Test")
    def test_no_missing_values():
        print("========================================================================")
     
        # Replace 'Duration', 'Pulse', 'Maxpulse', 'Calories' with your desired columns
        expected_columns_no_null = ['Duration', 'Pulse', 'Maxpulse', 'Calories']
        try:
          for col in expected_columns_no_null:
              codewars_test.assert_equals(pc.updated_data()[col].isnull().sum(), 0, f"Column '{col}' should not have missing values")
        except Exception as e:
              codewars_test.fail(f"====> Error in update_data(); Typo in the function code: {str(e)}")
        except NameError as e:
              codewars_test.fail(f"====> Error in update_data(); Typo in the function code: {str(e)}")
        except SyntaxError as e:
              codewars_test.fail(f"====> Error in update_data(); Typo in the function code: {str(e)}")
    
        print("")

