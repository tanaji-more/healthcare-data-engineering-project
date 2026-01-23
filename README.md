<h1>🏥 Healthcare Data Engineering Project</h1>

<h3>Project Overview</h3>

This project demonstrates an end-to-end Healthcare Data Engineering pipeline built using modern data stack tools. It ingests raw healthcare data into Snowflake, transforms it using dbt following analytics engineering best practices, ensures data quality through automated testing, and orchestrates the complete workflow using Apache Airflow running inside Docker.

<h2>Data Modeling Strategy</h2>

RAW	Source --> data,
STAGING  -->	Cleaned & standardized data,
INTERMEDIATE  -->	Business logic layer,
MARTS	--> Fact & Dimension tables,

<h2>Orchestration with Apache Airflow</h2>

<i>Pipeline flow:</i>

Run dbt staging models, 
Run dbt intermediate models, 
Run dbt marts models, 
Run dbt tests,

<h2>Dockerized Setup</h2>

<i>Services:</i>

airflow-init, 
airflow-webserver, 
airflow-scheduler,  
![ChatGPT Image Jan 23, 2026, 08_31_46 AM](https://github.com/user-attachments/assets/df5319f3-c20f-4c7e-8800-266e7e7dbf91)
