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
filename = "answer_chapter3_experiments4.py"  # changed

# Import the answer module
pc = importlib.import_module(filename[:-3], ".")
cmd = subprocess.run([sys.executable, f"{path_answer}{filename}"], capture_output=True)  # changed


@codewars_test.describe("Chapter 3 | Experiments 4")
def fixed_tests():

    @codewars_test.it("1. Test Loading Data")
    def test_load_data():
        print("========================================================================")
        # Assuming expected columns are "Customer ID", "Age" and "Total Spent (USD)"
        expected_columns = ["Customer ID", "Age", "Total Spent (USD)"]
        try:
            codewars_test.assert_equals(list(pc.data_load().columns), expected_columns, "====> The provided dataset URL is incorrect; columns in the dataset differ")  # Error message translated
        except Exception as e:
            codewars_test.fail(f"====> Error loading data; There's a typo in the code: {str(e)}")  # Error message translated

        expected_rows = 50
        try:
            codewars_test.assert_equals(len(pc.data_load()), expected_rows, "====> The provided dataset URL is incorrect; columns in the dataset differ")  # Error message translated
        except Exception as e:
            codewars_test.fail(f"====> Error checking row count; There's a typo in the code: {str(e)}")  # Error message translated
        print("")

    @codewars_test.it("2. Test Show First Five Rows")
    def test_show_first_five_rows():
        # Call the function and capture the output
        print("========================================================================")
        try:
            actual_output = pc.head_rows().shape[0]  # Get the number of rows
            expected_rows = 5

            # Assert that the expected output matches the actual output
            codewars_test.assert_equals(actual_output, expected_rows, "Output from head_rows() is incorrect; It should display 5 rows of data; Your output")  # Validation message translated
        except Exception as e:
            codewars_test.fail(f"====> Error in head_rows(); There's a typo in the function code: {str(e)}")  # Error message translated

        print("")

    @codewars_test.it("3. Test Calculate Descriptive Statistics for Customer Age")
    def test_age_descriptive_stats():
        print("========================================================================")
        # Assert few basic statistics on age
        expected_mean = 34.54
        expected_std = 13.069999921927455
        expected_median = 33.5
        expected_skew = 0.2325824223215271
        try:

            codewars_test.assert_equals(pc.data_load()["Age"].mean(), expected_mean, "Age mean should be positive")  # Validation message translated
            codewars_test.assert_equals(pc.data_load()["Age"].std(), expected_std, "Age standard deviation should be positive")  # Validation message translated
            codewars_test.assert_equals(pc.data_load()["Age"].median(), expected_median, "Age mean should be positive")  # Validation message translated
            codewars_test.assert_equals(pc.data_load()["Age"].skew(), expected_skew, "Age standard deviation should be positive")  # Validation message translated

            quartile = pc.data_load()["Age"].quantile([0.25, 0.5, 0.75])

            codewars_test.assert_equals(type(quartile), pd.Series, "Quartiles should be a pandas Series")  # Validation message translated

        except Exception as e:
            codewars_test.fail(f"====> Error in head_rows(); There's a typo in the function code: {str(e)}")  # Error message translated
        print("")



    @codewars_test.it("4. Test Quartiles' Value (Age)")
    def test_quartile_values():
        print("========================================================================")
        # Assuming quartiles are for "Age" (adjust expected values as needed)
        try:
            expected_quartiles = np.array([22.25, 33.50, 45.00])  # Adjust these based on your data
            tolerance = 5  # Adjust tolerance for approximate value comparison
            calculated_quartiles = pc.data_load()["Age"].quantile([0.25, 0.5, 0.75])

            codewars_test.assert_equals(np.allclose(calculated_quartiles, expected_quartiles, atol=tolerance), True,
                                       "Quartiles should be close to expected values")
        except Exception as e:
            codewars_test.fail(f"====> Error in head_rows(); There's a typo in the function code: {str(e)}")  # Error message translated

        print("")

    @codewars_test.it("5. Test Descriptive Statistics for Total Spent (USD)")
    def test_total_spent_descriptive_stats():
        print("========================================================================")
        # Assert few basic statistics on total spent
        expected_mean = 114.0
        expected_std = 52.45989721993868
        expected_median = 110.0
        expected_skew = 0.19622312582543433

        try:
            codewars_test.assert_equals(pc.data_load()["Total Spent (USD)"].mean(), expected_mean,
                                       "Total Spent mean should be positive")
            codewars_test.assert_equals(pc.data_load()["Total Spent (USD)"].std(), expected_std,
                                       "Total Spent standard deviation should be positive")
            codewars_test.assert_equals(pc.data_load()["Total Spent (USD)"].median(), expected_median,
                                       "Total Spent median should be positive")
            codewars_test.assert_equals(pc.data_load()["Total Spent (USD)"].skew(), expected_skew,
                                       "Total Spent skewness should be positive")

            quartile = pc.data_load()["Total Spent (USD)"].quantile([0.25, 0.5, 0.75])

            codewars_test.assert_equals(type(quartile), pd.Series, "Quartiles should be a pandas Series")
        except Exception as e:
            codewars_test.fail(f"====> Error in head_rows(); There's a typo in the function code: {str(e)}")  # Error message translated

        print("")

    @codewars_test.it("6. Test Quartiles' Value (Total Spent (USD))")
    def test_quartile_values():
        print("========================================================================")
        # Assuming quartiles are for "Age" (adjust expected values as needed)

        expected_quartiles = np.array([71.25, 110.00, 153.75])  # Adjust these based on your data
        tolerance = 5  # Adjust tolerance for approximate value comparison

        try:
            calculated_quartiles = pc.data_load()["Total Spent (USD)"].quantile([0.25, 0.5, 0.75])

            codewars_test.assert_equals(np.allclose(calculated_quartiles, expected_quartiles, atol=tolerance), True,
                                       "Quartiles should be close to expected values")
        except Exception as e:
            codewars_test.fail(f"====> Error in head_rows(); There's a typo in the function code: {str(e)}")  # Error message translated

        print("")

    @codewars_test.it("7. calculates correlation coefficient")
    def test_correlation():
        print("========================================================================")
        # Assert correlation coefficient is a number

        try:
            corr_ = pc.correlation()

            codewars_test.assert_equals(isinstance(corr_, float), True, ">>>> Error in function correlation(); Variable 'correlation' is not defined; Check variable name")  # Error message translated
        except Exception as e:
            codewars_test.fail(f"====> Error in correlation(); There's a typo in the function code: {str(e)}")  # Error message translated
        except NameError as e:
            codewars_test.fail(f"====> Error in correlation(); There's a typo in the function code: {str(e)}")  # Error message translated
        print("")



