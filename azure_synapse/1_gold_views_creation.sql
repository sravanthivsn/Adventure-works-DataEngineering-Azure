 
CREATE SCHEMA gold;

CREATE VIEW gold.calendar AS SELECT * FROM OPENROWSET(BULK 'https://kvsdesa.dfs.core.windows.net/silver/AdventureWorks_Calendar/', FORMAT = 'PARQUET') AS vw;

CREATE VIEW gold.customers AS SELECT * FROM OPENROWSET(BULK 'https://kvsdesa.dfs.core.windows.net/silver/AdventureWorks_Customers/', FORMAT = 'PARQUET') AS vw;

CREATE VIEW gold.products AS SELECT * FROM OPENROWSET(BULK 'https://kvsdesa.dfs.core.windows.net/silver/AdventureWorks_Products/', FORMAT = 'PARQUET') AS vw;

CREATE VIEW gold.product_catg AS SELECT * FROM OPENROWSET(BULK 'https://kvsdesa.dfs.core.windows.net/silver/AdventureWorks_Product_Categories/', FORMAT = 'PARQUET') AS vw;

CREATE VIEW gold.returns AS SELECT * FROM OPENROWSET(BULK 'https://kvsdesa.dfs.core.windows.net/silver/AdventureWorks_Returns/', FORMAT = 'PARQUET') AS vw;

CREATE VIEW gold.sales AS SELECT * FROM OPENROWSET(BULK 'https://kvsdesa.dfs.core.windows.net/silver/AdventureWorks_Sales/', FORMAT = 'PARQUET') AS vw;

CREATE VIEW gold.product_subcat AS SELECT * FROM OPENROWSET(BULK 'https://kvsdesa.dfs.core.windows.net/silver/Product_Subcategories/', FORMAT = 'PARQUET') AS vw;

CREATE VIEW gold.territories AS SELECT * FROM OPENROWSET(BULK 'https://kvsdesa.dfs.core.windows.net/silver/AdventureWorks_Territories/', FORMAT = 'PARQUET') AS vw;


