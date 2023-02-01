select 'stage_violation' as table_name, count(*) as row_count from stage_violation union
select 'stage_inspection' as table_name, count(*) as row_count from stage_inspection union
select 'stage_employee' as table_name, count(*) as row_count from stage_employee union
select 'stage_establishment' as table_name, count(*) as row_count from stage_establishment union
select 'stage_inspection_point' as table_name, count(*) as row_count from stage_inspection_point