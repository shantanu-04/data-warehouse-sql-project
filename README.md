DATA-WAREHOUSE-SQL-PROJECT



PROJECT OVERVIEW
This project demonstrates the construction of a robust data warehouse using the Medallion architecture, a three-tiered approach to data engineering. The goal is to transform raw data from CSV files into a structured and reliable format that can be easily queried for business insights, reporting, and further analysis, including machine learning applications.



The process is broken down into three distinct layers:


1. BRONZE LAYER

The initial layer serves as a raw data repository. Data is extracted directly from the source CSV files and loaded into tables without any transformations. This layer acts as a reliable backup of the source data, using a TRUNCATE and INSERT load method for simplicity and efficiency.


3. SILVER LAYER
   
In this layer, the data from the Bronze layer undergoes a series of crucial transformations. This includes:

- Data Cleaning: Handling missing values and correcting inconsistencies.

- Standardization & Normalization: Ensuring data is in a uniform format.
  
- Derived Columns: Creating new, valuable features from existing data.
  
- Data Enrichment: Integrating additional information to add context.
  
This layer provides a single source of truth for cleaned and enriched data, preparing it for business-specific applications.


3. GOLD LAYER
   
The final layer of the data warehouse is optimized for business intelligence and analytics. Data from the Silver layer is further processed through aggregations and the application of business logic. The data model for this layer is a Star Schema, consisting of a central Fact Table surrounded by multiple Dimension Tables. This schema is designed to enable fast and intuitive querying, making it ideal for generating reports, running ad-hoc queries, and serving as a foundational dataset for machine learning models.

The output of this data warehouse is a curated, business-ready dataset that empowers organizations to make informed decisions.
