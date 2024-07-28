-- membuat tabel baru dengan nama 'kf_analytics'
create or replace table rakamin-kf-analytics-430714.kimia_farma.kf_analytics as

-- memilih kolom-kolom yang akan digunakan dalam tabel
select
  t.transaction_id,
  t.date,
  extract(year from t.date) as year,    -- membuat kolom tahun
  extract(month from t.date) as month,  -- membuat kolom bulan
  t.branch_id,
  kc.branch_name,
  kc.kota,
  kc.provinsi,
  kc.rating as rating_cabang,
  t.customer_name,
  t.product_id,
  p.product_name,
  t.price as actual_price,
  t.discount_percentage,
  if(t.price <= 50000, 10,
    if(t.price > 50000 and t.price <= 100000, 15,
      if(t.price > 100000 and t.price <= 300000, 20,
        if(t.price > 300000 and t.price <= 500000, 25, 30)))) as persentase_gross_laba, -- kolom presentase laba berdasarkan harga menggunakan fungsi if
  round(t.price * (1 - t.discount_percentage)) as nett_sales,                           -- kolom harga setelah diskon
  round(
    (if(t.price <= 50000, 10,
      if(t.price > 50000 and t.price <= 100000, 15,
        if(t.price > 100000 and t.price <= 300000, 20,
          if(t.price > 300000 and t.price <= 500000, 25, 30)))) / 100.0
    * round(t.price * (1 - t.discount_percentage))
  )) as nett_profit,                                                                    -- kolom laba berdasarkan harga dan presentase laba
  t.rating as rating_transaksi
from
  rakamin-kf-analytics-430714.kimia_farma.kf_final_transactions t     -- dari tabel 'kf_final_transactions'
join
  rakamin-kf-analytics-430714.kimia_farma.kf_product p                -- join dengan tabel 'kf_product' menggunakan product_id
on 
  t.product_id = p.product_id
join
  rakamin-kf-analytics-430714.kimia_farma.kf_inventory i              -- join dengan tabel 'kf_inventory' menggunakan product_id dan branch_id
on
  t.product_id = i.product_id and t.branch_id = i.branch_id
join
  rakamin-kf-analytics-430714.kimia_farma.kf_kantor_cabang kc         -- join dengan tabel 'kf_kantor_cabang' menggunakan branch_id
on 
  t.branch_id = kc.branch_id;
