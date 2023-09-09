# E-commerce Analytics Dashboard using Apache Nifi + SQL + python + Tableau

## Overview

This project focuses on creating an analytics dashboard for an e-commerce company that sells unique all-occasion gifts. The project leverages data from an online retail dataset to perform data extraction, analysis, and visualization. The goal is to gain insights into various aspects of the business, such as sales, customers, products, and orders.

## Table of Contents

- [Dataset](#dataset)
- [Project Structure](#project-structure)
- [Project Outline](#project-outline)
- [Setup](#setup)
- [Data Extraction](#data-extraction)
- [Data Cleaning](#data-cleaning)
- [Data Analysis](#data-analysis)
- [Data Visualization](#data-visualization)
- [Dashboard Creation](#dashboard-creation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Dataset

- **Name**: Online Retail Data Set
- **Source**: [UCI Machine Learning Repository](https://archive.ics.uci.edu/dataset/352/online+retail)
- **Description**: Contains approximately 541,909 records of transactions made by customers of an online retail company. Each record includes information about the customer, product, quantity, price, and other transaction-related details.

## Project Structure

The project is organized into the following sections:

- Data Extraction
- Data Cleaning
- Data Analysis
- Data Visualization
- Dashboard Creation

## Project Outline

1. **Data Extraction**:
   - Automated data flow with Apache NiFi to load data into the database.

2. **Data Cleaning**:
   - Cleaned and preprocessed data in Python.
   - Addressed missing values and outliers.

3. **Data Analysis**:
   - Used SQL queries to perform data analysis.
   - Calculated sales trends, customer segments, and repeat purchase rates.

4. **Data Visualization**:
   - Utilized Tableau for creating interactive visualizations.
   - Developed charts and graphs to represent key insights.

5. **Dashboard Creation**:
   - Assembled interactive dashboards in Tableau for data exploration.

## Setup

To run this project, you'll need:

- Apache NiFi for data extraction.
- A relational database (e.g., MySQL) to store and access the data.
- Python for data cleaning and preprocessing.
- DBeaver or VSCode for SQL queries.
- Tableau for data visualization and dashboard creation.

## Usage

1. Clone this repository.

2. Follow the steps outlined in the [Project Outline](#project-outline) section to set up your environment and execute the project.

## Contributing

Contributions are welcome! Feel free to open issues or submit pull requests to enhance the project.

## License

This project is licensed under the [MIT License](LICENSE).

