import os

from airflow import DAG
from airflow.operators.python_operator import PythonOperator
from airflow.utils.dates import days_ago

default_args = {
    'owner': 'airflow',
    'start_date': days_ago(1),
    'retries': 1,
}

dag = DAG(
    'dbt_snowflake_dag',
    default_args=default_args,
    description='A simple DAG to run dbt models on Snowflake',
    schedule_interval='@daily',
)


# Function to run dbt
def run_dbt(command):
    os.system(command)


# Task to run dbt run
run_dbt_task = PythonOperator(
    task_id='run_dbt',
    python_callable=run_dbt,
    op_args=[
        'dbt run'
    ],
    dag=dag,
)


# Task to run dbt test
test_dbt_task = PythonOperator(
    task_id='test_dbt',
    python_callable=run_dbt,
    op_args=[
        'dbt test'
    ],
    dag=dag,
)

# Dependencies
run_dbt_task >> test_dbt_task
