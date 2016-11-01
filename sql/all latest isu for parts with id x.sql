-- SELECT *
-- FROM inventorized_stock_unit isu
--     LEFT JOIN stock_unit su ON su.id = isu.stock_unit_id
-- WHERE isu.created_on = (SELECT MAX(created_on) FROM inventorized_stock_unit isu WHERE isu.stock_unit_id = su.id);

select * from part p
join (
SELECT *
FROM inventorized_stock_unit isu
    LEFT JOIN stock_unit su ON su.id = isu.stock_unit_id
WHERE isu.created_on = (SELECT MAX(created_on) FROM inventorized_stock_unit isu WHERE isu.stock_unit_id = su.id)
) sq on sq.part_id = p.id;

-- select * from part p where p.id = 1;