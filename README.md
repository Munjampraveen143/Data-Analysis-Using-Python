# 🎬 Movie Dataset — Data Cleaning & EDA

A complete data preprocessing and exploratory data analysis (EDA) pipeline applied to a movies dataset. This project covers everything from raw data inspection to outlier treatment and multivariate analysis.

---

## 📁 Project Structure

```
├── Project.ipynb          # Main Jupyter notebook
├── movies_modified.csv    # Raw input dataset
└── movies_cleaned.csv     # Cleaned output dataset (generated after running the notebook)
```

---

## 📌 Workflow Overview

### 1. Import Libraries & Setup
- `pandas`, `numpy` for data manipulation
- `matplotlib`, `seaborn` for visualization
- `sklearn.preprocessing.LabelEncoder` for encoding

### 2. Data Loading & Initial Inspection
- Load `movies_modified.csv`
- Inspect shape, columns, dtypes, and descriptive statistics

### 3. Handling Duplicates
- Detect duplicate rows using `df.duplicated()`
- Drop all duplicates and verify the result

### 4. Missing Value Imputation
- Visualize missing values with a heatmap
- Impute **numeric** columns with the **median**
- Impute **categorical** columns with the **mode**

### 5. Outlier Treatment (IQR Capping)
- Detect outliers in `budget` and `gross` using boxplots
- Cap outliers using the **Interquartile Range (IQR)** method:
  - Lower bound: `Q1 - 1.5 × IQR`
  - Upper bound: `Q3 + 1.5 × IQR`

### 6. Univariate Analysis
- Distribution histograms: `budget`, `gross`, `score`
- Count plots: `rating`, `genre`
- Top 10 production companies by movie count

### 7. Bivariate & Multivariate Analysis
- Scatter plot: `budget` vs `gross`
- Correlation heatmap (numeric features)
- Pairplot: `budget`, `gross`, `score`, `runtime`
- Full correlation matrix after label-encoding categoricals
- Trend: Movies released per year
- Aggregations: Average gross by genre, average score by rating
- Top 10 movies by gross earnings

### 8. Export
- Cleaned dataset saved as `movies_cleaned.csv`

---

## 🧰 Requirements

Install dependencies with:

```bash
pip install pandas numpy matplotlib seaborn scikit-learn
```

---

## 🚀 Getting Started

```bash
git clone <your-repo-url>
cd <repo-folder>
jupyter notebook Project.ipynb
```

Make sure `movies_modified.csv` is in the same directory as the notebook before running.

---

## 📊 Key Columns

| Column    | Description                    |
|-----------|--------------------------------|
| `name`    | Movie title                    |
| `genre`   | Genre of the movie             |
| `rating`  | Age rating (G, PG, R, etc.)    |
| `score`   | IMDb or critic score           |
| `budget`  | Production budget              |
| `gross`   | Box office gross earnings      |
| `year`    | Release year                   |
| `runtime` | Movie duration (minutes)       |
| `director`| Director's name                |
| `company` | Production company             |

---

## 📝 Notes

- Outlier capping is applied only to `budget` and `gross`; extend `cap_outliers()` to other numeric columns as needed.
- Label encoding in section 7 is used solely for correlation analysis — the exported CSV retains original categorical values.
