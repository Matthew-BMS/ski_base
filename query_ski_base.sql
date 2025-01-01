CREATE TABLE users(
	id BIGSERIAL PRIMARY KEY,
	name VARCHAR(150) NOT NULL,
	surname VARCHAR(150) NOT NULL,
	role SMALLINT
);

CREATE TABLE user_data(
    id BIGSERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    login VARCHAR(120) NOT NULL UNIQUE,
    password VARCHAR(120) NOT NULL,
    phone_number VARCHAR(12),
    email VARCHAR(250),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE items(
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
	type VARCHAR(150) NOT NULL,
	cost INTEGER NOT NULL,
	status VARCHAR(250) NOT NULL,
	purchase_date DATE,
	date_of_debit DATE
);

CREATE TABLE rents(
    id BIGSERIAL PRIMARY KEY,
	user_id BIGSERIAL NOT NULL,
	item_id BIGSERIAL NOT NULL,
    phone_number VARCHAR(12) NOT NULL,
	mail VARCHAR(250),
	rent_start timestamp NOT NULL,
	rent_end timestamp NOT NULL,
	rent_status VARCHAR(150) NOT NULL,
	FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
	FOREIGN KEY (item_id) REFERENCES items(id) ON DELETE CASCADE
);
