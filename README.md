### Aim of the document:

The document explains the steps taken to support meetup.com with the following:

1. Build a simple data warehouse.
2. Use analytics to inform the business.

### Data architecture:

Here, a three-layered approach is employed to process the given data. First, the data is extracted and transformed from its array format and imported directly into BigQuery using its import functionality. This raw data is then transformed into a raw data vault. From the raw data vault, a data mart is created using a dimensional model, which provides essential data for specific querying needs. The data mart serves as a valuable resource for generating a value proposition for the client through scheduling analytics using the data vault.

### Data vault:
 
Data Vault is a data modeling methodology used in data warehousing to design and build scalable, flexible, and maintainable data integration solutions. It was introduced by Dan Linstedt in the 1990s as a response to the challenges of traditional data warehouse designs and to address issues related to changing business requirements and data integration complexities.

The key concepts of Data Vault include:

Hub: A Hub represents a business key or a unique identifier for a specific business entity (e.g., customer, product, location). It acts as a central anchor for related data.

Link: A Link captures the relationships between Hubs. It connects two or more Hubs, forming a bridge between business entities.

Satellite: A Satellite contains descriptive attributes and time-varying data related to a Hub. It provides a historical record of changes over time, allowing for historical analysis.
The benefits of using Data Vault in data warehousing include:

Scalability: Data Vault is designed to scale and handle large volumes of data. It accommodates changes and additions to data sources without requiring major re-engineering.

Flexibility: Data Vault's flexible design allows for easy adaptation to changing business requirements and data sources. New data can be incorporated with minimal disruption to the existing structure.

Consistency: The Hub, Link, and Satellite structure promotes consistency and a standardized approach to modeling data across the organization.

Data Integration: Data Vault simplifies data integration by providing a framework to model data from diverse sources.

### Data mart:

A Data Mart using dimensional modeling is a specialized subset of a data warehouse that is designed for specific business functions or departments within an organization. Data marts are typically created to provide easy access to relevant data for end-users, enabling them to analyze and gain insights into specific business areas without the complexity of the entire data warehouse.

Dimensional modeling is a data modeling technique that simplifies and optimizes data structures for fast and efficient querying and reporting.

Fact Tables: Fact tables store quantitative data, also known as measures. These measures represent business metrics or performance indicators, such as sales revenue, quantity sold, or profit. Fact tables typically have foreign keys that link to dimension tables.

Dimension Tables: Dimension tables contain descriptive attributes that provide context to the measures in the fact tables. Dimensions represent the different perspectives by which data can be analyzed, such as product, customer, time, location, etc. Dimension tables act as the primary entry points for users to slice and dice data.

### Tech stack:

Data warehousing: BigQuery
Google BigQuery is a fully managed, serverless data warehouse and analytics platform provided by Google Cloud.

Modeling: dbt cloud
dbt, short for "data build tool," is an open-source data transformation and modeling tool designed for modern data engineering workflows. In addition, dbt allows a transparent dependency Management. In other words, dbt allows users to define dependencies between data models, ensuring that transformations are executed in the correct order to maintain data integrity.

Version control: GitHub
GitHub is a web-based platform and service for version control using Git.
