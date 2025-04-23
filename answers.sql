-- Question 1
TRUNCATE TABLE ProductDetail;

INSERT INTO ProductDetail (OrderID, CustomerName, Products)
VALUES
  (101, 'John Doe',   'Laptop'),
  (101, 'John Doe',   'Mouse'),
  (102, 'Jane Smith', 'Tablet'),
  (102, 'Jane Smith', 'Keyboard'),
  (102, 'Jane Smith', 'Mouse'),
  (103, 'Emily Clark','Phone');

-- Question 2
CREATE TABLE IF NOT EXISTS Orders (
  OrderID      INT          PRIMARY KEY,
  CustomerName VARCHAR(100) NOT NULL
);

INSERT INTO Orders (OrderID, CustomerName)
VALUES
  (101, 'John Doe'),
  (102, 'Jane Smith'),
  (103, 'Emily Clark');

CREATE TABLE IF NOT EXISTS Product (
  OrderID  INT          NOT NULL,
  Product  VARCHAR(100) NOT NULL,
  Quantity INT          NOT NULL,
  PRIMARY KEY (OrderID, Product),
  FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

INSERT INTO Product (OrderID, Product, Quantity)
SELECT
  OrderID,
  Product,
  Quantity
FROM OrderDetails;

DROP TABLE OrderDetails;
