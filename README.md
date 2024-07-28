# Final Task: Analisis Kinerja Bisnis Kimia Farma tahun 2020 - 2023

Project ini bertujuan untuk menganalisis kinerja bisnis Kimia Farma selama periode 2020-2023 menggunakan dashboard interaktif dan query SQL di BigQuery dan visualisasi data menggunakan Looker Studio.

### **Overview**
---
Kimia Farma, sebagai perusahaan farmasi, perlu memahami tren penjualan dan profitabilitas untuk mengoptimalkan kinerja dan strategi bisnisnya. Dataset yang tersedia mencakup informasi transaksi seperti data transaksi, data inventori, data produk, dan data kantor cabang. Analisis ini akan membantu manajemen dalam memahami bagaimana bagaimana kinerja bisnis dalam total penjualan dan profit, baik secara keseluruhan maupun per provinsi dari tahun 2020 hingga 2023.

### **Tahap Pengerjaan**
---
#### 1. Importing Dataset to BigQuery
Import dataset dilakukan di BigQuery dengan langkah-langkah sebagai berikut:
Membuat project bernama Rakamin-KF-Analytics
Membuat dataset dengan nama kimia_farma
Membuat tabel dengan melakukan upload file .csv yang disediakan, yaitu:
	- kf_final_transactions
	- kf_inventory
	- kf_product
	- kf_kantor_cabang

#### 2. Tabel Analisa
Berikut sampel dari tabel analisa:
![image](https://github.com/user-attachments/assets/01372866-b305-426c-a277-a99334169fd4)

#### 3. BigQuery Syntax
Bisa dilihat di file 'kf_analytics_query.sql' pada repository ini.
Syntax dijalankan dengan tahap sebagai berikut:
- Membuat tabel baru dengan nama ‘kf_analytics’
- Memilih kolom-kolom yang akan dimasukkan ke dalam tabel, dengan beberapa kolom perlu dilakukan tahap lebih lanjut:
	- `tahun` : extract year from date
	- `bulan` : extract month from date
	- `presentase_gross_laba` : berdasarkan kolom harga menggunakan fungsi if
	- `net_sales` : harga setelah diskon
	- `net_profit` : berdasarkan laba dan presentase_gross_laba
- Melakukan join dengan tabel yang lainnya menggunakan left join

#### 4. Dashboard Peformance Analytics
Dashboard dibuat menggunakan Looker Studio
![image](https://github.com/user-attachments/assets/8db0c034-87bc-4476-8bfb-a995b47e960c)
![image](https://github.com/user-attachments/assets/238b9ba7-c75d-4e5b-8bca-cba6b8d6afe2)

---
