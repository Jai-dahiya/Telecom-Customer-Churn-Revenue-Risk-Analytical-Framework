import pandas as pd

df = pd.read_csv("Telco-Customer-Churn.csv")

print("--- TELECOM CUSTOMER CHURN & REVENUE RISK ANALYSIS ---\n")

churn_counts = df['Churn'].value_counts()
print("1. OVERALL CHURN COUNT:")
print(churn_counts)
print("-" * 40)

contract_churn = pd.crosstab(df['Contract'], df['Churn'])
print("\n2. CHURN BY CONTRACT TYPE:")
print(contract_churn)
print("-" * 40)

churned_customers = df[df['Churn'] == 'Yes']
revenue_lost = churned_customers['MonthlyCharges'].sum()
print(f"\n3. TOTAL MONTHLY REVENUE LOST: ${revenue_lost:,.2f}")
print("-" * 40)
print("\n4. DATASET INFO:")
df['TotalCharges'] = pd.to_numeric(df['TotalCharges'], errors='coerce')

missing_values = df['TotalCharges'].isnull().sum()
print(f"\n4. DATA CLEANING:")
print(f"Missing values in TotalCharges after conversion: {missing_values}")

df.dropna(subset=['TotalCharges'], inplace=True)
print("Missing values dropped successfully.")
print("\n5. TENURE ANALYSIS:")
tenure_churn = df.groupby('Churn')['tenure'].mean()
print("Average Tenure (in months) by Churn Status:")
print(tenure_churn)
print("-" * 40)
print("\n6. CHURN BY INTERNET SERVICE:")
internet_churn = pd.crosstab(df['InternetService'], df['Churn'])
print(internet_churn)
print("-" * 40)
import matplotlib.pyplot as plt
import seaborn as sns

print("\n7. GENERATING VISUALIZATION...")
plt.figure(figsize=(8, 5))
sns.countplot(data=df, x='InternetService', hue='Churn', palette='Set1')
plt.title('Customer Churn by Internet Service Type')
plt.xlabel('Internet Service Type')
plt.ylabel('Number of Customers')
plt.tight_layout()

plt.savefig('churn_by_internet.png')
print("Success! Saved 'churn_by_internet.png' to your project folder.")
print("-" * 40)