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
filename = "answer_chapter3_experiments5.py"  # changed

# Import the answer module
pc = importlib.import_module(filename[:-3], ".")
cmd = subprocess.run([sys.executable, f"{path_answer}{filename}"], capture_output=True)  # changed

@codewars_test.describe("Chapter 3 | Experiments 5")
def fixed_tests():

    @codewars_test.it("1. Test Loading Data")
    def test_load_data():
        print("========================================================================")
        # Assuming expected columns are "Customer ID", "Age" and "Total Spent (USD)"
        expected_columns = ['No', 'Nama Produk', 'Kategori', 'Harga (Rp)', 'Jumlah Terjual']
        try:
            codewars_test.assert_equals(list(pc.load_data().columns), expected_columns, "====> The provided dataset URL is incorrect; columns in the dataset differ")  # Error message translated
        except Exception as e:
            codewars_test.fail(f"====> Error loading data; There's a typo in the code: {str(e)}")  # Error message translated

        expected_rows = 33
        try:
            codewars_test.assert_equals(len(pc.load_data()), expected_rows, "====> The provided dataset URL is incorrect; columns in the dataset differ")  # Error message translated
        except Exception as e:
            codewars_test.fail(f"====> Error checking row count; There's a typo in the code: {str(e)}")  # Error message translated
        print("")

    @codewars_test.it("2. Test Calculates Mean")
    # Assuming your function calculates mean, median, and standard deviation
    def test_descriptive_statistics():
        print("========================================================================")

        # Test mean of "Jumlah Terjual"
        expected_mean = 16.09375  # Replace with expected mean value

        try:
            codewars_test.assert_equals(pc.load_data()["Jumlah Terjual"].mean(), expected_mean, "Total Spent mean should be positive")
        except Exception as e:
            codewars_test.fail(f"====> Error checking row count; There's a typo in the code: {str(e)}")  # Error message translated

        print(" ")

    @codewars_test.it("3. Test Calculates Median")
    def test_descriptive_statistics():
        print("========================================================================")

        # Test median of "Jumlah Terjual"
        expected_median = 15.0  # Replace with expected median value
        data = pc.load_data()["Jumlah Terjual"].median()

        try:
            codewars_test.assert_equals(pc.load_data()["Jumlah Terjual"].median(), expected_median, "Age mean should be positive")
        except Exception as e:
            codewars_test.fail(f"====> Error checking row count; There's a typo in the code: {str(e)}")  # Error message translated

        print(" ")

    @codewars_test.it("4. Test Calculates Mode")
    def test_descriptive_statistics():
        print("========================================================================")

        data = pc.load_data()
        expected_mode = 8
        mode_jumlah_terjual = data["Jumlah Terjual"].mode().iloc[0]

        try:
            codewars_test.assert_equals(mode_jumlah_terjual, expected_mode)
        except Exception as e:
            codewars_test.fail(f"====> Error checking row count; There's a typo in the code: {str(e)}")  # Error message translated

        print(" ")

