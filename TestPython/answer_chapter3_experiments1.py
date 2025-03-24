import numpy as np

# Asumsikan array NumPy 3 dimensi bernama 'data_penjualan'
data_penjualan = np.array([
    # Kategori 1 (Elektronik)
    [[10, 20, 30],  # Bulan 1
     [40, 50, 60],  # Bulan 2
     [70, 80, 90]], # Bulan 3

    # Kategori 2 (Pakaian)
    [[100, 110, 120], # Bulan 1
     [130, 140, 150], # Bulan 2
     [160, 170, 180]], # Bulan 3

    # Kategori 3 (Mainan)
    [[190, 200, 210], # Bulan 1
     [220, 230, 240], # Bulan 2
     [250, 260, 270]]  # Bulan 3
])

# Potong kotak ke-1, baris ke-2, dan kolom ke-1 hingga ke-2
data_spesifik = data_penjualan[0, 1, 1:3]

print(data_spesifik)
