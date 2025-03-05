from cosmos import DbtDag, ProjectConfig, ProfileConfig, ExecutionConfig

from pathlib import Path
import os
from datetime import datetime

dbt_project_path = Path("/opt/airflow/dags/dbt/cosmosproject")

profile_config = ProfileConfig(
    profile_name="test_profile",
    target_name="dev",
    profiles_yml_filepath=Path("/opt/airflow/dags/dbt/cosmosproject/profiles/profiles.yml"),
)

my_cosmos_dag = DbtDag(
    project_config=ProjectConfig(
        dbt_project_path,
    ),
    profile_config=profile_config,
    execution_config=ExecutionConfig(
        dbt_executable_path=f"{os.environ['AIRFLOW_HOME']}/dbt_venv/bin/dbt",
    ),
    # normal dag parameters
    schedule_interval=None,
    start_date=datetime(2025, 1, 1),
    catchup=False,
    dag_id="my_cosmos_dag",
    default_args={"retries": 2},
)