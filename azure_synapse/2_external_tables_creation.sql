-- Create a master key for encryption, using a password for security.
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'password';

-- Create a database-scoped credential with a managed identity for authentication.
CREATE DATABASE SCOPED CREDENTIAL cred_db WITH IDENTITY = 'Managed Identity';

-- Create an external data source named 'source_silver', which points to a specific location in Azure Data Lake Storage (Silver tier).
CREATE EXTERNAL DATA SOURCE source_silver 
WITH (
    LOCATION = 'https://kvsdesa.dfs.core.windows.net/silver', -- URL to the external data storage location
    CREDENTIAL = cred_db 
);

-- Create another external data source named 'source_gold', pointing to the 'gold' directory in Azure Data Lake Storage.
CREATE EXTERNAL DATA SOURCE source_gold
WITH (
    LOCATION = 'https://kvsdesa.dfs.core.windows.net/gold', -- URL to the external data storage location
    CREDENTIAL = cred_db
);

-- Create an external file format for reading Parquet files with Snappy compression.
CREATE EXTERNAL FILE FORMAT parquet_format 
WITH (
    FORMAT_TYPE = PARQUET, -- Specify the file format (Parquet)
    DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec' -- Use Snappy compression for Parquet files
);

-- Create an external table 'calendar_ext' in the 'gold' schema, referencing the Parquet files in the 'gold' data source.
-- The table will be populated with the data from 'gold.calendar'.

CREATE EXTERNAL TABLE gold.calendar_ext
WITH (
    LOCATION = 'calendar_ext',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = parquet_format
)
AS
SELECT * FROM gold.calendar;

CREATE EXTERNAL TABLE gold.customers_ext
WITH (
    LOCATION = 'customers_ext',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = parquet_format
)
AS
SELECT * FROM gold.customers;

CREATE EXTERNAL TABLE gold.products_ext
WITH (
    LOCATION = 'products_ext',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = parquet_format
)
AS
SELECT * FROM gold.products;

CREATE EXTERNAL TABLE gold.Product_Categories_ext
WITH (
    LOCATION = 'Product_Categories_ext',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = parquet_format
)
AS
SELECT * FROM gold.product_catg;

CREATE EXTERNAL TABLE gold.returns_ext
WITH (
    LOCATION = 'returns_ext',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = parquet_format
)
AS
SELECT * FROM gold.returns;

CREATE EXTERNAL TABLE gold.sales_ext
WITH (
    LOCATION = 'sales_ext',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = parquet_format
)
AS
SELECT * FROM gold.sales;

CREATE EXTERNAL TABLE gold.product_subcat_ext
WITH (
    LOCATION = 'subcat_ext',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = parquet_format
)
AS
SELECT * FROM gold.product_subcat;

CREATE EXTERNAL TABLE gold.territories_ext
WITH (
    LOCATION = 'territories_ext',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = parquet_format
)
AS
SELECT * FROM gold.territories;
