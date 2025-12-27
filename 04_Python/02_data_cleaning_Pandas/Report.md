# Customer Call List Cleaning Project

## Project Overview

This project is a data cleaning and preparation script designed to process a raw customer list and generate a filtered, standardized list of clients suitable for a sales or outreach call campaign. The core task involves using the Python `pandas` library to handle data inconsistencies, standardize formats (like phone numbers and categorical fields), and apply business logic filters (e.g., excluding "Do Not Contact" entries).

The script is presented as a standalone Python file, originally developed in a Jupyter Notebook environment.

## Data Cleaning Steps

The script performs the following key data manipulation and cleaning steps:

1.  **Data Loading**: Loads the initial customer data from an Excel file into a `pandas` DataFrame.
2.  **Duplicate Removal**: Identifies and removes any duplicate customer records to ensure data integrity.
3.  **Name Standardization**: Cleans up the `Last_Name` column by removing unwanted characters (e.g., slashes, dots, numbers) that may have been introduced during data entry.
4.  **Phone Number Cleaning and Formatting**:
    *   Removes all non-numeric characters from the `Phone_Number` column.
    *   Applies a fixed format (XXX-XXX-XXX) to the numbers.
    *   Handles and cleans up residual placeholder values resulting from the formatting process.
5.  **Address Decomposition**: Splits the single `Address` column into separate, more granular fields: `Street`, `State`, and `Postcode`.
6.  **Categorical Field Standardization**: Standardizes values in the `Paying Customer` and `Do_Not_Contact` columns (e.g., converting 'Y' and 'N' to 'Yes' and 'No').
7.  **Missing Value Handling**: Replaces all remaining missing values (`NaN`) across the DataFrame with empty strings for a cleaner output.
8.  **Final Filtering**: Applies the core business logic to create the final call list:
    *   Excludes all customers marked as "Do Not Contact".
    *   Excludes all customers for whom a valid phone number could not be determined.
9.  **Index Reset**: Resets the DataFrame index for a clean, sequential final list.

## How to Run the Script

### Prerequisites

*   Python 3.x
*   `pandas` library (`pip install pandas`)
*   `openpyxl` library (required by pandas to read `.xlsx` files: `pip install openpyxl`)

### Execution

1.  Ensure your customer data file (`Customer Call List.xlsx` in the original script) is accessible. **Note**: You will need to update the file path in the script to match your local environment.
2.  Run the Python script:

    ```bash
    python customer_call_list_cleaning.py
    ```

The script will output the final, cleaned DataFrame to the console. You can easily modify the last line of the script to save the result to a new CSV or Excel file:

```python
# Save the final list to a new CSV file
df.to_csv('final_call_list.csv', index=False)
```

## Files in this Repository

*   `customer_call_list_cleaning.py`: The main Python script containing all data cleaning logic.
*   `README.md`: This file.
*   `Untitled15.ipynb` (Optional): The original Jupyter Notebook file.
*   `Customer Call List.xlsx` (Not included): Placeholder for the raw data file.

