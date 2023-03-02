CREATE TABLE products (
  id INT PRIMARY KEY,
  name VARCHAR(255),
  price INT
);

CREATE TABLE categories (
  id INT PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE product_categories (
  product_id INT,
  category_id INT,
  PRIMARY KEY (product_id, category_id),
  FOREIGN KEY (product_id) REFERENCES products(id),
  FOREIGN KEY (category_id) REFERENCES categories(id)
);
