CREATE TABLE sales_data (
    sale_id INT PRIMARY KEY,
    customer_id INT,
    equipment_sold INT,
    revenue DECIMAL(10, 2)
);

CREATE TABLE bookings_data (
    booking_id INT PRIMARY KEY,
    customer_id INT,
    location VARCHAR(50),
    year INT
);

CREATE TABLE inventory_data (
    item_id INT PRIMARY KEY,
    item_name VARCHAR(100),
    date_added DATE
);

LOAD DATA INFILE 'path/to/sales_data.csv'
INTO TABLE sales_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';

LOAD DATA INFILE 'path/to/bookings_data.csv'
INTO TABLE bookings_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';

LOAD DATA INFILE 'path/to/inventory_data.csv'
INTO TABLE inventory_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';

# Assuming 'sales_data.csv' is the file containing sales information
sales_data = pd.read_csv('/mnt/data/sales_data.csv')

# Total number of equipment sales
total_sales = sales_data['equipment_sold'].sum()

# Total revenue generated from equipment sales
total_revenue = sales_data['revenue'].sum()

# Percentage of customers who purchase equipment
total_customers = sales_data['customer_id'].nunique()
customers_with_purchases = sales_data[sales_data['equipment_sold'] > 0]['customer_id'].nunique()
percentage_customers_with_purchases = (customers_with_purchases / total_customers) * 100

equipment_sales_report = pd.DataFrame({
    'Total Equipment Sales': [total_sales],
    'Total Revenue from Equipment Sales': [total_revenue],
    'Percentage of Customers Purchasing Equipment': [percentage_customers_with_purchases]
})

