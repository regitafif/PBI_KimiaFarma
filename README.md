# Final Task: Analisis Kinerja Bisnis Kimia Farma tahun 2020 - 2023

Project ini bertujuan untuk menganalisis kinerja bisnis Kimia Farma selama periode 2020-2023 menggunakan dashboard interaktif dan query SQL di BigQuery dan visualisasi data menggunakan Looker Studio.

### **Overview**
---
Kimia Farma, sebagai perusahaan farmasi, perlu memahami tren penjualan dan profitabilitas untuk mengoptimalkan kinerja dan strategi bisnisnya. Dataset yang tersedia mencakup informasi transaksi seperti data transaksi, data inventori, data produk, dan data kantor cabang. Analisis ini akan membantu manajemen dalam memahami bagaimana bagaimana kinerja bisnis dalam total penjualan dan profit, baik secara keseluruhan maupun per provinsi dari tahun 2020 hingga 2023.
[(video explanation)](https://drive.google.com/file/d/1ho_J4jBA0q5evC6SfiJfmWCI-0gfKURb/view?usp=drive_link)


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
[(lihat tabel kf_analytics.csv)](https://drive.google.com/file/d/1zCWACetWnEyYl8zYfoUJU7AlIYXuAhJs/view?usp=drive_link)

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
![image](https://github.com/user-attachments/assets/f043f79b-09e1-4f87-8470-54632dea8ceb)
![image](https://github.com/user-attachments/assets/502bee45-1f24-4c9d-8903-d06528d0b4ce)
---
