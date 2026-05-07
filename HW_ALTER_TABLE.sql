CREATE TABLE sales (
  id        INTEGER PRIMARY KEY,
  rep_name  TEXT    NOT NULL,
  region    TEXT    NOT NULL,
  product   TEXT    NOT NULL,
  amount    REAL,
  sale_date TEXT    NOT NULL
);

INSERT INTO sales (id, rep_name, region, product, amount, sale_date) VALUES
  (1,  'Dana', 'North', 'Laptop', 1200.00, '2026-01-10'),
  (2,  'Omar', 'South', 'Phone',   650.00,  '2026-01-12'),
  (3,  'Dana', 'North', 'Tablet', NULL,     '2026-01-15'),
  (4,  'Noa',  'East',  'Laptop', 1350.00, '2026-01-18'),
  (5,  'Omar', 'South', 'Laptop', 1100.00, '2026-01-20'),
  (6,  'Dana', 'North', 'Phone',   720.00,  '2026-01-22'),
  (7,  'Noa',  'East',  'Phone',   690.00,  '2026-01-25'),
  (8,  'Liam', 'West',  'Tablet', 480.00,  '2026-01-28'),
  (9,  'Liam', 'West',  'Laptop', 1050.00, '2026-02-01'),
  (10, 'Omar', 'South', 'Tablet', NULL,     '2026-02-03');

-- Add a TEXT column called tier to the sales table, then fill it: 'high' where amount > 1000, 'low' otherwise

ALTER TABLE sales
ADD COLUMN tier TEXT;

UPDATE sales
SET tier = 'Low'
WHERE amount < 1000;
    -- or without this line, depends on requierments

UPDATE sales
SET tier = 'High'
WHERE amount > 1000;

-- Add a REAL column called tax with DEFAULT 0, then update it to amount * 0.07 where amount IS NOT NULL

ALTER TABLE sales
ADD COLUMN tax DEFAULT 0;

UPDATE TABLE sales
SET tax = amount * 0.07
WHERE amount IS NOT NULL;

-- Rename the sales table to sales_backup, then rename it back to sales

ALTER TABLE sales
RENAME TO sales_backup;

ALTER TABLE sales_backup
RENAME TO sales;

-- Rename the column product to item

ALTER TABLE sales
RENAME COLUMN product TO item;

-- Drop the tier column you created in step 1, then run PRAGMA table_info(sales) to verify it is gone

ALTER TABLE sales
DROP COLUMN tier;

PRAGMA table_info(sales);
