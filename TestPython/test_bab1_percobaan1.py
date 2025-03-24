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
filename = "answer_bab1_percobaan1.py"  # changed


# Import the answer module
pc = importlib.import_module(filename[:-3], ".")
cmd = subprocess.run([sys.executable, f"{path_answer}{filename}"], capture_output=True)  # changed

@codewars_test.describe("Chapter 1 | Experiments 1")
def fixed_tests():
    print("========================================================================")
    @codewars_test.it("1. Load Data Test")
    def test_load_data():
        # Assuming expected columns are "Customer ID", "Age" and "Total Spent (USD)"
        expected_columns = ['Customer ID', 'Age', 'Total Spent (USD)']
        codewars_test.assert_equals(list(pc.data_load().columns), expected_columns, "====> The URL of the dataset used is not appropriate; the columns in the dataset are different")
              
        expected_rows = 50
        codewars_test.assert_equals(len(pc.data_load()), expected_rows, "====> Please check the URL used again; the number of data points in the dataset is different")
        

    # @codewars_test.it("2. Test Print Nilai Fungsi data_load()")
    # def test_total_revenue():
    #     print("========================================================================")
    #     output_lines = cmd.stdout.decode().splitlines()
    #     codewars_test.assert_equals(bool(output_lines), True, '====> Error :Tidak Menampilkan nilai fungsi data_load() menggunakan print()')
