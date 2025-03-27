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
filename = "answer_chapter1_experiments2.py"  # changed


# Import the answer module
pc = importlib.import_module(filename[:-3], ".")
cmd = subprocess.run([sys.executable, f"{path_answer}{filename}"], capture_output=True)  # changed

@codewars_test.describe("Chapter 1 | Experiments 2")
def fixed_tests():

    @codewars_test.it("1. Load Data Test ")
    def test_load_data():
        print("========================================================================")
        try:
            expected_columns = ['Order ID', 'Customer ID', 'Product ID', 'Product Name', 'Price',
                                'Order Date', 'Quantity']
            data = pc.data_load()
            codewars_test.assert_equals(list(data.columns), expected_columns, "====> The URL of the dataset used is not appropriate; the columns in the dataset are different")
            expected_rows = 100
            codewars_test.assert_equals(len(data), expected_rows, "====> Please check the URL used again; the number of data points in the dataset is different")
        except AttributeError as e:
            if "module 'pandas' has no attribute 'read_csv'" in str(e):
                codewars_test.fail("====> Error: The data_load function does not use the correct read_csv function. Make sure you use the read_csv function to load the data.")
            else:
                codewars_test.fail(f"====> Error: The data_load function was not found. Make sure you have the data_load function in your module. {str(e)}")
        except pd.errors.EmptyDataError as e:
            codewars_test.fail("====> Error: The data is empty. Make sure you have valid data.")
        except pd.errors.ParserError as e:
            codewars_test.fail("====> Error: Data parsing error. Make sure you have the correct data format.")
        except Exception as e:
            codewars_test.fail(f"====> Error: An unexpected error occurred in data_load(). {str(e)}")

    @codewars_test.it("2. sample_rows() Function Test")
    def test_sample_rows():
        print("========================================================================")
        try:
            sample = pc.sample_rows()
            expected_len = 1
            codewars_test.assert_equals(len(sample), expected_len, "====> Error: Not using the .sample() function; resulting in more than 1 data; the data you have in the sample.")
            assert isinstance(sample, pd.DataFrame), "Sample must have a DataFrame data type."
        except AttributeError as e:
            codewars_test.fail(f"====> Error: The sample_rows function was not found. Make sure you have the sample_rows function in your module. {str(e)}")
        except Exception as e:
            codewars_test.fail(f"====> Error: An unexpected error occurred in sample_rows(). {str(e)}")

    # @codewars_test.it("3. Test Print Nilai Fungsi sample_rows()")
    # def test_total_revenue():
    #     print("========================================================================")
    #     output_lines = cmd.stdout.decode().splitlines()
    #     codewars_test.assert_equals(bool(output_lines), True, '====> Error :Tidak Menampilkan nilai fungsi sample_rows() menggunakan print()')
