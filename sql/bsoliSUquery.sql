select su, bsoli from inventorized_stock_unit isu
join stock_unit su on isu.stock_unit_id = su.id
join packaged_stock_unit psu on psu.stock_unit_id = isu.stock_unit_id
join package p on psu.package_id = p.id
join shipment s on s.id = p.shipment_id
join branch_sales_order_package bsop on bsop.package_id = p.id
join branch_sales_order bso on bso.id = bsop.bso_id
join branch_sales_order_lines bsoli on bsoli.bso_id = bso.id
where isu.created_on > s.arrived_on and bsop.id = 1
group by su.id, bsoli.id
