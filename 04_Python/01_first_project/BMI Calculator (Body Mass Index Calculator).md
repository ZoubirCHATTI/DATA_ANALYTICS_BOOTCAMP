# 🏋️‍♂️ BMI Calculator (Body Mass Index Calculator)

This project is a simple yet didactic Jupyter Notebook that demonstrates how to create a Body Mass Index (BMI) calculator in Python. It presents **three different approaches** to solve the same problem, illustrating the evolution from a simple script to a more modular and reusable code structure.

## 🌟 Features

The program allows you to:
1.  Calculate a person's BMI using their weight (in pounds) and height (in inches).
2.  Classify the BMI into standard categories (Underweight, Normal, Overweight, Obese, etc.).
3.  Demonstrate the importance of code modularity through three distinct methods.

## 🛠️ Technologies Used

*   **Language:** Python
*   **Environment:** Jupyter Notebook (or any environment capable of running `.ipynb` notebooks)

## 🚀 Installation and Setup

This project does not require the installation of any external libraries. Only a standard Python environment is needed.

### Prerequisites

Ensure you have Python installed on your machine.

### Execution

1.  **Download** the `BMICalculator.ipynb` file.
2.  **Open** the notebook in your Jupyter environment (JupyterLab, VS Code, Google Colab, etc.).
3.  **Execute** the code cells sequentially to see the three methods in action.

## 💡 The Three Methods

The notebook is structured to present three ways to implement the BMI calculator:

| Method | Description | Advantages |
| :--- | :--- | :--- |
| **Method 1: Linear Script** | The complete code (user input, calculation, classification) is written directly. | Simplicity, ideal for a quick script. |
| **Method 2: Global Function** | A single function encapsulates the entire process, including user input. | Cleaner code, easy to call. |
| **Method 3: Modular Function** | The function takes weight, height, and name as **parameters** and performs the calculation. | The most professional approach. Allows the function to be reused with data from other sources (files, databases) without requiring manual input. |

## 📊 BMI Categories

The program uses the standard BMI classification for adults:

| BMI (kg/m² or US equivalent) | Weight Category |
| :--- | :--- |
| Less than 18.5 | Underweight |
| 18.5 to 24.9 | Normal |
| 25.0 to 29.9 | Overweight |
| 30.0 to 34.9 | Obese |
| 35.0 to 39.9 | Severely Obese |
| 40.0 and above | Morbidly Obese |

## 📝 Author

*   [Your Name/Handle]
*   [Link to your GitHub or LinkedIn]

## 📄 License

This project is licensed under [MIT/Apache/etc.] - see the `LICENSE.md` file for more details. (To be added if you have a license file)
