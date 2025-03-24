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
filename = "answer_bab3_percobaan2.py"  # changed

# Import the answer module
pc = importlib.import_module(filename[:-3], ".")
cmd = subprocess.run([sys.executable, f"{path_answer}{filename}"], capture_output=True)  # changed

@codewars_test.describe("BAB 3 | Percobaan 2")
def fixed_tests():

    @codewars_test.it("1. Test Memuat Data")
    def test_load_data():
        print("========================================================================")
        # Assuming expected columns are "Customer ID", "Age" and "Total Spent (USD)"
        expected_columns = ["Invoice ID","Branch", "City", "Customer type", "Gender", "Product line", "Unit price", "Quantity", "Tax 5%", "Total", "Date", "Time", "Payment", "cogs", "gross margin percentage", "gross income", "Rating"]
        try:
            codewars_test.assert_equals(list(pc.data_load().columns), expected_columns, "====> URL dataset yang digunakan tidak sesuai; kolom pada dataset berbeda")
        except Exception as e:
            codewars_test.fail(f"====> Error loading data; Terdapat Typo pada kode: {str(e)}")

        expected_rows = 1000
        try:
            codewars_test.assert_equals(len(pc.data_load()), expected_rows, "====> Periksa kembali URL yang digunakan; jumlah data pada dataset berbeda")
        except Exception as e:
            codewars_test.fail(f"====> Error checking row count; Terdapat Typo pada Kode: {str(e)}")
    
    @codewars_test.it("2. Test Fungsi head_rows()")
    def test_show_first_five_rows():
        print("========================================================================")
        # Call the function and capture the output
        try:
            actual_output = pc.head_rows().shape[0] # Get the number of rows

            expected_rows = 5

            # Assert that the expected output matches the actual output
            codewars_test.assert_equals(actual_output, expected_rows, "Should Showing First Five Rows" )
        except Exception as e:
            codewars_test.fail(f"====> Error pada head_rows(); Terdapat Typo pada kode function: {str(e)}")
    
        except KeyError as e:
                    codewars_test.fail(f"====> Error: Kolom '{e.args[0]}' tidak ditemukan dalam DataFrame. Pastikan Anda memiliki kolom '{e.args[0]}' dalam data Anda.")


    @codewars_test.it("3. Test Membuat Kolom Revenue ")
    def test_add_revenue_column():
        print("========================================================================")
        
        try:
            df = pc.updated_data()

            codewars_test.assert_equals("Total Revenue" in df.columns, True,
                                       "====> Error: Kolom 'Total Revenue' tidak ditemukan; Definisikan nama kolom dengan benar")
        except Exception as e:
            codewars_test.fail(f"====> Error pada updated_data(); Terdapat Kolom dengan penulisan nama yang salah, yaitu; function: {str(e)}")
        except KeyError as e:
            codewars_test.fail(f"====> Error: Kolom '{e.args[0]}' tidak ditemukan dalam DataFrame. Pastikan Anda memiliki kolom '{e.args[0]}' dalam data Anda.")    
    
    @codewars_test.it("4. Test Nilai Variabel total_pendapatan")
    def test_total_revenue():
        print("========================================================================")
        # Assert few basic statistics on total spent
        expected_total_revenue = 307587.38

        try:
            df = pc.updated_data()

            if 'Unit price' in df.columns and 'Quantity' in df.columns:
                actual = pc.total_pendapatan()
                codewars_test.assert_equals(actual, expected_total_revenue, "====> Error: Total Revenue should be have the correct value")
            else:
                codewars_test.fail("====> Error: Kolom 'Unit price' atau 'Quantity' tidak ditemukan dalam DataFrame. Pastikan Anda memiliki kolom 'Unit price' dan 'Quantity' dalam data Anda.")
        except Exception as e:
            codewars_test.fail(f"====> Error: fungsi total_pendapatan. Cek nama dan atribut fungsi. {str(e)}")

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


