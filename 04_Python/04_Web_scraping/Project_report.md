# 📚 Book Price Web Scraping and Monitoring

This project contains a Python script, implemented as a Jupyter Notebook, designed to perform web scraping on a single product page and continuously monitor its price and availability over time. It is a practical example of how to use Python libraries for data extraction and time-series logging.

## ✨ Features

*   **Targeted Web Scraping**: Extracts specific product details from a single book page on the `books.toscrape.com` sandbox website.
*   **Data Points Extracted**:
    *   Book Title
    *   Price (excluding currency symbol)
    *   Product Type
    *   Availability (stock status)
    *   Star Rating
*   **Time-Series Logging**: Logs the extracted data into a CSV file every 5 seconds, along with a timestamp, allowing for price change monitoring.
*   **Data Analysis**: Uses the `pandas` library to read and display the collected data in a structured DataFrame.

## 🛠️ Prerequisites

To run this notebook, you need the following installed:

*   Python 3.x
*   `requests`
*   `beautifulsoup4` (bs4)
*   `pandas`
*   `datetime` (standard library)
*   `csv` (standard library)

## 🚀 Installation and Setup

1.  **Clone the repository:**
    ```bash
    git clone [YOUR_REPOSITORY_URL]
    cd [YOUR_REPOSITORY_NAME]
    ```

2.  **Install the required libraries:**
    ```bash
    pip install requests beautifulsoup4 pandas
    ```

3.  **Open the notebook:**
    Launch Jupyter Notebook or JupyterLab and open `Book_price_web_scraping.ipynb`.

## 💻 Usage

The notebook is structured into sequential cells:

1.  **Imports**: Imports `BeautifulSoup`, `pandas`, and `requests`.
2.  **Request & Parsing**: Sends an HTTP GET request to the target URL and parses the HTML content using `BeautifulSoup`.
3.  **Data Extraction**: Subsequent cells extract the Title, Price, Availability, Rating, and Product Type using specific HTML tags and CSS classes.
4.  **Logging Function**: Defines the `check_price` function responsible for updating the timestamp, writing the data to the CSV, and pausing for 5 seconds.
5.  **Continuous Monitoring**: A `with open(...)` block initializes the CSV file and starts an **infinite `while(True)` loop** that calls `check_price` every 5 seconds.

> **⚠️ Important Note on Usage:** The monitoring loop is infinite and must be manually stopped by interrupting the kernel in the Jupyter environment.

## 💾 Output

The script generates a CSV file named `Book_scraping.csv` (the path is hardcoded in the original script to a local Windows path, e.g., `C:\\Users\\zoubi\\Desktop\\...\\Book_scraping.csv`).

The final `pandas` cell reads this CSV and displays the collected data, which will look like this:

| Index | title | price | product\_type | availability | rating | time |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| 0 | A Light in the Attic | 51.77 | Books | In stock (22 available) | Three | 14:34:55 |
| 1 | A Light in the Attic | 51.77 | Books | In stock (22 available) | Three | 14:35:00 |
| 2 | A Light in the Attic | 51.77 | Books | In stock (22 available) | Three | 14:35:05 |
| ... | ... | ... | ... | ... | ... | ... |

## ⚖️ Disclaimer

This script targets `http://books.toscrape.com`, which is a **sandbox website specifically created for web scraping practice**.

**DO NOT** use this script or similar techniques on live, production websites without first checking their `robots.txt` file and their Terms of Service. Excessive scraping can overload servers and may lead to your IP address being blocked. Always scrape responsibly and ethically.

## 🔗 Target URL

The script is configured to scrape the following page:
[A Light in the Attic | Books to Scrape](https://books.toscrape.com/catalogue/a-light-in-the-attic_1000/index.html)

