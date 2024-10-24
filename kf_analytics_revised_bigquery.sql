create table rakamin-kf-analytics-430714.kimia_farma.kf_analytics_revised as
select 
	t.transaction_id,
	t.date,
	t.branch_id,
	kc.branch_name,
	kc.kota as city,
	kc.provinsi as province,
	kc.rating as branch_rating,
	t.customer_name,
	t.product_id,
	p.product_name,
	p.price as actual_price,
	t.discount_percentage,
	case
		when p.price <= 50000 then 0.1
		when p.price >50000 and p.price <= 100000 then 0.15
		when p.price >100000 and p.price <= 300000 then 0.2
		when p.price >300000 and p.price <= 500000 then 0.25
		else 0.3
	end as gross_profit_percentage,
	round(p.price * (1 - t.discount_percentage)) as nett_sales,
    (p.price * 
        case 
            when p.price <= 50000 then 0.1
            when p.price > 50000 and p.price <= 100000 then 0.15
            when p.price > 100000 and p.price <= 300000 then 0.2
            when p.price > 300000 and p.price <= 500000 then 0.25
            else 0.3
        end) - (p.price - (round(p.price * (1 - t.discount_percentage)))) as nett_profit,
	t.rating AS transaction_rating
from rakamin-kf-analytics-430714.kimia_farma.kf_final_transactions t
left join rakamin-kf-analytics-430714.kimia_farma.kf_kantor_cabang kc
	on t.branch_id = kc.branch_id
left join rakamin-kf-analytics-430714.kimia_farma.kf_product p
	on t.product_id = p.product_id;