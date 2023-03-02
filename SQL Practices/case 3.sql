
CREATE TABLE Countries (
  country_id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL
);

CREATE TABLE Players (
  player_id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  country_id INT NOT NULL,
  expertise VARCHAR(50) NOT NULL,
  FOREIGN KEY (country_id) REFERENCES Countries(country_id)
);
