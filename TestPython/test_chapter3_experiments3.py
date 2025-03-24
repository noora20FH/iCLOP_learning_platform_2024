
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
filename = "answer_chapter3_experiments3.py"  # changed


# Import the answer module
pc = importlib.import_module(filename[:-3], ".")
cmd = subprocess.run([sys.executable, f"{path_answer}{filename}"], capture_output=True)  # changed

@codewars_test.describe("Chapter 3 | Experiments 3")
def fixed_tests():

    @codewars_test.it("1. Test Loading Data")
    def test_load_data():
        print("========================================================================")
        # Assuming expected columns are "Customer ID", "Age" and "Total Spent (USD)"
        expected_columns = ['Movie_Title', 'Release_Year', 'Genre', 'Director', 'Critic_Score',
                            'User_Rating', 'Studio', 'Running_Time', 'Budget', 'Box_Office',
                            'Unnamed: 10']
        try:
            codewars_test.assert_equals(list(pc.data_load().columns), expected_columns, "====> The provided dataset URL is incorrect; columns in the dataset differ")  # Error message translated
        except Exception as e:
            codewars_test.fail(f"====> Error loading data; There's a typo in the code: {str(e)}")  # Error message translated

        expected_rows = 18
        try:
            codewars_test.assert_equals(len(pc.data_load()), expected_rows, "====> The provided dataset URL is incorrect; columns in the dataset differ")  # Error message translated
        except Exception as e:
            codewars_test.fail(f"====> Error checking row count; There's a typo in the code: {str(e)}")  # Error message translated
        print("")

    @codewars_test.it("2. Test Critic_Score Conversion")
    def test_critic_scores():
        print("========================================================================")

        try:
            codewars_test.assert_equals(isinstance(pc.critic_scores(), np.ndarray), True, ">>> ERROR in function critic_scores(); Check variable name")  # Error message translated
        except Exception as e:
            codewars_test.fail(f"====> Error in function critic_scores(); There's a typo in the code: {str(e)}")  # Error message translated
        except KeyError as e:
            codewars_test.fail(f"====> Error loading data; There's a typo in the code: {str(e)}")  # Error message translated

    @codewars_test.it("3. Test Create Variable top_10_movies")
    def test_top_10_movies():
        print("========================================================================")

        try:
            codewars_test.assert_equals(isinstance(pc.top_10_movies(), pd.DataFrame), True, "top_10_movies should be a pandas DataFrame")  # Validation message translated
        except Exception as e:
            codewars_test.fail(f"====> Error in function sorted_indices(); There's a typo in the code: {str(e)}")  # Error message translated
        print("")

    # @codewars_test.it("3. Test Print Top 10 Movies")
    # def test_critic_scores():
    #     print("========================================================================")
    #     output_lines = cmd.stdout.decode().splitlines()
    #     codewars_test.assert_equals(bool(output_lines), True, '====> Error :Tidak Menampilkan 10 Movies menggunakan print()')
