##
#  This dockerfile is used for local development and testing
##
FROM apache/airflow:2.10.5

USER root

RUN sudo apt-get update \
    && apt-get install -y --no-install-recommends 

USER airflow

COPY --chown=airflow . .

# install dbt into a virtual environment
RUN python -m venv dbt_venv && source dbt_venv/bin/activate && \
    pip install --no-cache-dir dbt-core dbt-postgres && deactivate

RUN pip install astronomer-cosmos