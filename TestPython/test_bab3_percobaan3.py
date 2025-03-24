
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
filename = "answer_bab3_percobaan3.py"  # changed


# Import the answer module
pc = importlib.import_module(filename[:-3], ".")
cmd = subprocess.run([sys.executable, f"{path_answer}{filename}"], capture_output=True)  # changed

@codewars_test.describe("BAB 3 | Percobaan 3")
def fixed_tests():

    @codewars_test.it("1. Test Memuat Data")
    def test_load_data():
        print("========================================================================")
        # Assuming expected columns are "Customer ID", "Age" and "Total Spent (USD)"
        expected_columns = ['Movie_Title', 'Release_Year', 'Genre', 'Director', 'Critic_Score',
       'User_Rating', 'Studio', 'Running_Time', 'Budget', 'Box_Office',
       'Unnamed: 10']
        try:
          codewars_test.assert_equals(list(pc.data_load().columns), expected_columns, "====> URL dataset yang digunakan tidak sesuai; kolom pada dataset berbeda")
        except  Exception as e:
          codewars_test.fail(f"====> Error loading data; Terdapat Typo pada kode: {str(e)}")
  
        expected_rows = 18
        try:
          codewars_test.assert_equals(len(pc.data_load()), expected_rows, "====> URL dataset yang digunakan tidak sesuai; kolom pada dataset berbeda")
        except Exception as e:
            codewars_test.fail(f"====> Error checking row count; Terdapat Typo pada Kode: {str(e)}")
        print("")

    @codewars_test.it("2. Test Critic_Score Conversion")
    def test_critic_scores():
        print("========================================================================")

        try:

          codewars_test.assert_equals(isinstance(pc.critic_scores(), np.ndarray), True,">>>> ERROR pada fungsi critic_scores(); Cek nama variabel")
   
        except  Exception as e:
          codewars_test.fail(f"====> Error Terdapat Typo pada fungsi critic_scores() pada kode: {str(e)}")
        except  KeyError as e:
          codewars_test.fail(f"====> Error loading data; Terdapat Typo pada kode: {str(e)}")
    
    @codewars_test.it("2. Test Create Variable top_10_movies")
    def test_top_10_movies():
        print("========================================================================")

        try:

            codewars_test.assert_equals(isinstance(pc.top_10_movies(), pd.DataFrame), True, "top_10_movies should be a pandas DataFrame")
        except Exception as e:
            codewars_test.fail(f"====> Error Terdapat Typo pada blok fungsi sorted_indices() kode: {str(e)}")
    print("")

    # @codewars_test.it("3. Test Print Top 10 Movies")
    # def test_critic_scores():
    #     print("========================================================================")
    #     output_lines = cmd.stdout.decode().splitlines()
    #     codewars_test.assert_equals(bool(output_lines), True, '====> Error :Tidak Menampilkan 10 Movies menggunakan print()')
