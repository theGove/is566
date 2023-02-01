#!/bin/bash
# must supply year as command line argument
echo $1 > /home/student/code/etl/year.txt
echo "----------Stage the Inspection Data----------"
/home/student/code/etl/build_dw/complete/5_dw_stage_inspection.py
echo "----------Stage the Violation Data----------"
/home/student/code/etl/build_dw/complete/6_dw_stage_violation.py
echo "----------Stage the Establishment Data----------"
/home/student/code/etl/build_dw/complete/7_dw_stage_establishment.py
echo "----------Stage the Employee Data----------"
/home/student/code/etl/build_dw/complete/8_dw_stage_employee.py
echo "----------Stage the Point Data----------"
/home/student/code/etl/build_dw/complete/9_dw_stage_point.py
echo "----------Populate the Establishment Dimension----------"
/home/student/code/etl/build_dw/complete/a_dw_populate_dim_establishment.py
echo "----------Populate the Employee Dimension----------"
/home/student/code/etl/build_dw/complete/b_dw_populate_dim_employee.py

















