FROM apache/airflow:2.9.1

# Install DBT and DBT-Snowflake
RUN pip install dbt dbt-snowflake

# Install Apache Snowflake provider
RUN pip install apache-airflow-providers-snowflake
