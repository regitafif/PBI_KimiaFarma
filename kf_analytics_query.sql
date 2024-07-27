-- Membuat tabel baru dengan nama kf_analytics
CREATE TABLE `rakamin-kf-analytics-430714.kimia_farma.kf_analytics` AS
SELECT --Memilih kolom-kolom untuk tabel kf_analytics
  t.transaction_id,
  t.date,
  t.branch_id,
  kc.branch_name,
  kc.kota,
  kc.provinsi,
  kc.rating AS rating_cabang,
  t.customer_name,
  t.product_id,
  p.product_name,
  t.price AS actual_price,
  t.discount_percentage,
  CASE                            -- Menentukan gross laba
    WHEN t.price <= 50000 THEN 10
    WHEN t.price > 50000 AND t.price <= 100000 THEN 15
    WHEN t.price > 100000 AND t.price <= 300000 THEN 20
    WHEN t.price > 300000 AND t.price <= 500000 THEN 25
    ELSE 30
  END AS persentase_gross_laba,
  t.price * (1 - t.discount_percentage / 100) AS nett_sales,  -- Menghitung jumlah sales setelah diskon
  (t.price * (1 - t.discount_percentage / 100)) * (           -- Menghitung profit setelah diskon
    CASE
      WHEN t.price <= 50000 THEN 0.10
      WHEN t.price > 50000 AND t.price <= 100000 THEN 0.15
      WHEN t.price > 100000 AND t.price <= 300000 THEN 0.20
      WHEN t.price > 300000 AND t.price <= 500000 THEN 0.25
      ELSE 0.30
    END
  ) AS nett_profit,
  t.rating AS rating_transaksi

-- Melakukan Join tabel dengan mengunakan alias untuk setiap tabel
FROM 
  `rakamin-kf-analytics-430714.kimia_farma.kf_final_transactions` t
JOIN 
  `rakamin-kf-analytics-430714.kimia_farma.kf_product` p
ON 
  t.product_id = p.product_id
JOIN 
  `rakamin-kf-analytics-430714.kimia_farma.kf_inventory` i
ON 
  t.product_id = i.product_id AND t.branch_id = i.branch_id
JOIN 
  `rakamin-kf-analytics-430714.kimia_farma.kf_kantor_cabang` kc
ON 
  t.branch_id = kc.branch_id;
