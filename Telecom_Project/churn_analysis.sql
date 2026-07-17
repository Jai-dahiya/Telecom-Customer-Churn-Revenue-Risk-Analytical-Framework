WITH CustomerBase AS (
    SELECT 
        d.CustomerID,
        d.Gender,
        d.SeniorCitizen,
        d.TenureMonths,
        s.InternetService,
        s.ContractType,
        s.TechSupport,
        b.PaymentMethod,
        b.MonthlyCharges,
        b.TotalCharges,
        d.ChurnStatus
    FROM 
        Demographics d
    LEFT JOIN 
        Services s ON d.CustomerID = s.CustomerID
    LEFT JOIN 
        Billing b ON d.CustomerID = b.CustomerID
),
RiskSegmentedCustomers AS (
    SELECT 
        CustomerID,
        Gender,
        SeniorCitizen,
        TenureMonths,
        InternetService,
        ContractType,
        TechSupport,
        PaymentMethod,
        MonthlyCharges,
        TotalCharges,
        ChurnStatus,
        CASE 
            WHEN ChurnStatus = 'Yes' THEN 1 
            ELSE 0 
        END AS ChurnBinary,
        CASE 
            WHEN ContractType = 'Month-to-month' AND TechSupport = 'No' THEN 'Critical Risk'
            WHEN ContractType = 'Month-to-month' AND TechSupport = 'Yes' THEN 'High Risk'
            WHEN ContractType = 'One year' THEN 'Medium Risk'
            ELSE 'Low Risk'
        END AS RiskCategory,
        CASE 
            WHEN ChurnStatus = 'No' AND ContractType = 'Month-to-month' THEN (MonthlyCharges * 12)
            ELSE 0 
        END AS ProjectedRevenueAtRisk
    FROM 
        CustomerBase
)
SELECT 
    RiskCategory,
    InternetService,
    COUNT(CustomerID) AS TotalCustomers,
    SUM(ChurnBinary) AS ChurnedCustomers,
    ROUND((SUM(ChurnBinary) * 100.0) / COUNT(CustomerID), 2) AS ChurnRatePercent,
    ROUND(SUM(ProjectedRevenueAtRisk), 2) AS TotalRevenueAtRisk
FROM 
    RiskSegmentedCustomers
GROUP BY 
    RiskCategory,
    InternetService
ORDER BY 
    TotalRevenueAtRisk DESC, 
    ChurnRatePercent DESC;
