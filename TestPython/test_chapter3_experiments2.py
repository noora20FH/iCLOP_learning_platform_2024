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
filename = "answer_chapter3_experiments2.py"  # changed

# Import the answer module
pc = importlib.import_module(filename[:-3], ".")
cmd = subprocess.run([sys.executable, f"{path_answer}{filename}"], capture_output=True)  # changed

@codewars_test.describe("Chapter 3 | Experiments 2")
def fixed_tests():

    @codewars_test.it("1. Test Loading Data")
    def test_load_data():
        print("========================================================================")
        # Assuming expected columns are "Customer ID", "Age" and "Total Spent (USD)"
        expected_columns = ["Invoice ID", "Branch", "City", "Customer type", "Gender", "Product line", "Unit price", "Quantity", "Tax 5%", "Total", "Date", "Time", "Payment", "cogs", "gross margin percentage", "gross income", "Rating"]
        try:
            codewars_test.assert_equals(list(pc.data_load().columns), expected_columns, "====> The provided dataset URL is incorrect; columns in the dataset differ")  # Error message translated
        except Exception as e:
            codewars_test.fail(f"====> Error loading data; There's a typo in the code: {str(e)}")  # Error message translated

        expected_rows = 1000
        try:
            codewars_test.assert_equals(len(pc.data_load()), expected_rows, "====> Double-check the provided URL; number of data points in the dataset differs")  # Error message translated
        except Exception as e:
            codewars_test.fail(f"====> Error checking row count; There's a typo in the code: {str(e)}")  # Error message translated

    @codewars_test.it("2. Test Function head_rows()")
    def test_show_first_five_rows():
        print("========================================================================")
        # Call the function and capture the output
        try:
            actual_output = pc.head_rows().shape[0]  # Get the number of rows

            expected_rows = 5

            # Assert that the expected output matches the actual output
            codewars_test.assert_equals(actual_output, expected_rows, "Should Show First Five Rows")  # Validation message
        except Exception as e:
            codewars_test.fail(f"====> Error in head_rows(); There's a typo in the function code: {str(e)}")  # Error message translated
        except KeyError as e:
            codewars_test.fail(f"====> Error: Column '{e.args[0]}' not found in the DataFrame. Ensure you have the column '{e.args[0]}' in your data.")  # Error message translated

    @codewars_test.it("3. Test Creating 'Revenue' Column")
    def test_add_revenue_column():
        print("========================================================================")

        try:
            df = pc.updated_data()

            codewars_test.assert_equals("Total Revenue" in df.columns, True,
                                         "====> Error: Column 'Total Revenue' not found; Define the column name correctly")  # Error message translated
        except Exception as e:
            codewars_test.fail(f"====> Error in updated_data(); A column name is misspelled. Function: {str(e)}")  # Error message translated
        except KeyError as e:
            codewars_test.fail(f"====> Error: Column '{e.args[0]}' not found in the DataFrame. Ensure you have the column '{e.args[0]}' in your data.")  # Error message translated

    @codewars_test.it("4. Test 'total_pendapatan' Variable Value")
    def test_total_revenue():
        print("========================================================================")
        # Assert few basic statistics on total spent
        expected_total_revenue = 307587.38

        try:
            df = pc.updated_data()

            if 'Unit price' in df.columns and 'Quantity' in df.columns:
                actual = pc.total_pendapatan()
                codewars_test.assert_equals(actual, expected_total_revenue, "====> Error: Total Revenue should have the correct value")  # Error message translated
            else:
                codewars_test.fail("====> Error: Columns 'Unit price' or 'Quantity' not found in the DataFrame. Ensure you have the columns 'Unit price' and 'Quantity' in your data.")  # Error message translated
        except Exception as e:
            codewars
    # @codewars_test.it("5. Test Print Fungsi Jumlah Pendapatan")
    # def test_total_revenue():
    #     print("========================================================================")
    #     expected= "307587.38"
    #     output_lines = cmd.stdout.decode().splitlines()
    #     if output_lines:
    #         actual_value = output_lines[0]
    #     else:
    #         actual_value = " "

    #     codewars_test.assert_equals(actual_value, expected, '====> Error :Tidak Menampilkan nilai fungsi jumalah_pendapatan() menggunakan print()')    


