#!/bin/bash
/home/student/code/etl/scripts/1_dw_build_tables.py
echo "----------Populate the Date Dimension----------"
/home/student/code/etl/scripts/2_dw_populate_date.py
echo "----------Populate the Risk Dimension----------"
/home/student/code/etl/scripts/3_dw_populate_risk.py
echo "----------Populate the Severity Dimension----------"
/home/student/code/etl/scripts/4_dw_populate_severity.py
echo "----------Stage the Point Data----------"
/home/student/code/etl/scripts/9_dw_stage_point.py
echo "----------Populate the Point Dimension----------"
/home/student/code/etl/scripts/c_dw_populate_dim_point.py

















