from airflow import DAG
from airflow.operators.bash import BashOperator
from datetime import datetime

default_args = {
    "owner" : "tanaji",
    "start_date" : datetime(2026, 1, 14), 
    "retries" : 1
}

with DAG(
    dag_id= "healthcare_dbt_pipeline",
    default_args= default_args,
    schedule_interval= None,  # Manual trigger for now
    catchup= False,
    tags= ["healthcare", "dbt", "pipeline"],

) as dag:

    run_dbt_staging = BashOperator(
        task_id = "run_dbt_staging",
        bash_command= " cd /opt/dbt_project && dbt run --models staging "
    )

    run_dbt_intermediate = BashOperator(
        task_id = "run_dbt_intermediate",
        bash_command= " cd /opt/dbt_project && dbt run --models intermediate "
    )

    run_dbt_marts = BashOperator(
        task_id = "run_dbt_marts",
        bash_command= " cd /opt/dbt_project && dbt run --models marts "
    )

    run_dbt_tests = BashOperator(
        task_id = "run_dbt_tests",
        bash_command= " cd /opt/dbt_project && dbt test "
    )

    run_dbt_staging >> run_dbt_intermediate >> run_dbt_marts >> run_dbt_tests