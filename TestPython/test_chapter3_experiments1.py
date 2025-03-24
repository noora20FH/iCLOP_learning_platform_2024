import random
import sys
from pathlib import Path
import numpy as np
import subprocess
import importlib
import codewars_test

path_answer = "/content/" #changed
filename = "answer_chapter3_experiments1.py" #changed
pc = importlib.import_module(filename[:-3], ".") #changed

cmd = subprocess.run([sys.executable, f"{path_answer}{filename}"], capture_output=True)#changed

# Test Suite: BAB 2
@codewars_test.describe('Chapter 3 | Experiments 1')
def percobaan1():

    # Test Array Dimension
    @codewars_test.it('1. Test Array Dimension-')
    def test_array_dimension():
        print("========================================================================")
        try:
            # Check if array is a NumPy array
            if not isinstance(pc.data_penjualan, np.ndarray):
                raise AssertionError("Test Array Dimension")

            # Check array dimension (should be 3) and sizes (3, 3, 3)
            expected_shape = (3, 3, 3)
            codewars_test.assert_equals( pc.data_penjualan.shape, expected_shape,'Error : Array size does not match the requirement of 3x3x3')
        except Exception as e:
            codewars_test.fail(f"====>  Error in updated_data(); A column name is misspelled; function: {str(e)}")
        except KeyError as e:
            codewars_test.fail(f"====> Error: Column '{e.args[0]}' not found in DataFrame. Ensure you have the column '{e.args[0]}' in your data.")    
        except NameError as e:
            codewars_test.fail(f"====> Error: Column '{e.args[0]}' not found in DataFrame. Ensure you have the column '{e.args[0]}' in your data.")    
            
    # Test Array Slicing
    @codewars_test.it('2. Test Pemotongan Array-')
    def test_array_slicing():
        print("========================================================================")
        expected_array_slicing = np.array([50, 60])
        try:
            actual_array_slicing = pc.data_spesifik
            # Check element-wise equality using np.array_equal
            codewars_test.assert_equals(True, np.array_equal(expected_array_slicing, actual_array_slicing), 'Error : The result of array slicing does not match the expected output. ')
        except Exception as e:
            codewars_test.fail(f"====> A variable name is misspelled; function: {str(e)}")
        except KeyError as e:
            codewars_test.fail(f"====> Error: Column '{e.args[0]}' not found in DataFrame. Ensure you have the column '{e.args[0]}' in your data.")    
    
        print("""NOTE:
        Potong pada array kotak index-0, 
        ambil baris index-1, 
        kolom index-1 hingga index-2""")

    # Test Output Type of Sliced Array
    @codewars_test.it('3. Test Tipe Hasil Pemotongan Array-')
    def test_output_type():
        print("========================================================================")
        expected_type = np.ndarray  # Expected type

        try:
            # Assuming pc.array_potongan is the sliced array from answer.py
            codewars_test.assert_equals(expected_type, type(pc.data_spesifik), 'Error : The type of the sliced array should be a NumPy ndarray')
        except Exception as e:
            codewars_test.fail(f"====> A variable name is misspelled; function: {str(e)}")
        except KeyError as e:
            codewars_test.fail(f"====> Error: Column '{e.args[0]}' not found in DataFrame. Ensure you have the column '{e.args[0]}' in your data.")    
    

    # @codewars_test.it('4. Test Print Hasil Pemotongan Array-')
    # def test_output_type():
    #     print("========================================================================")
    #     expected = "[50 60]"
    #     output_lines = cmd.stdout.decode().splitlines()
    #     if output_lines:
    #         actual_value = output_lines[0]
    #     else:
    #         actual_value = " "

    #     codewars_test.assert_equals(actual_value, expected, 'Error :Tidak Menampilkan nilai data_spesifik menggunakan print()')    


if __name__ == '__main__':
    codewars_test  # Run the tests
