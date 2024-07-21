CREATE TABLE countries (
    id INT PRIMARY KEY,
    name VARCHAR(32),
    created_at TIMESTAMP
);

CREATE TABLE brands (
    id INT PRIMARY KEY,
    country_registration_id INT,
    name VARCHAR(30),
    FOREIGN KEY (country_registration_id) REFERENCES countries(id)
);

CREATE TABLE categories (
    id BIGINT PRIMARY KEY,
    parent_id BIGINT,
    image_url TEXT,
    category_name VARCHAR(80),
    active BOOL,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    created_by UUID,
    updated_by UUID,
    FOREIGN KEY (parent_id) REFERENCES categories(id)
);

CREATE TABLE variant_types (
    id INT PRIMARY KEY,
    name VARCHAR
);

CREATE TABLE product_series (
    id BIGINT PRIMARY KEY,
    variant_type_id INT,
    brand_id INT,
    name VARCHAR(50),
    FOREIGN KEY (variant_type_id) REFERENCES variant_types(id),
    FOREIGN KEY (brand_id) REFERENCES brands(id)
);

CREATE TABLE products (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    brand_id INT,
    category_id BIGINT,
    name VARCHAR,
    price INT,
    SKU VARCHAR(50) UNIQUE,
    ISBN VARCHAR(20) UNIQUE,
    quantity INT,
    published BOOL,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    created_by UUID,
    updated_by UUID,
    FOREIGN KEY (brand_id) REFERENCES brands(id),
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

CREATE TABLE images (
    id BIGSERIAL PRIMARY KEY,
    product_id UUID,
    image_url TEXT,
    sorted_order INT,
    created_at TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES products(id)
);

CREATE TABLE variants (
    id BIGINT PRIMARY KEY,
    series_id BIGINT,
    product_id UUID,
    sorted_order INT,
    FOREIGN KEY (series_id) REFERENCES product_series(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

CREATE TABLE country_manufacture (
    id INT PRIMARY KEY,
    brand_id INT,
    country_id INT,
    FOREIGN KEY (brand_id) REFERENCES brands(id),
    FOREIGN KEY (country_id) REFERENCES countries(id)
);

CREATE TABLE attribute_groups (
    id SERIAL PRIMARY KEY,
    name VARCHAR(40),
    sorted_order INT
);

CREATE TABLE attributes (
    id BIGSERIAL PRIMARY KEY,
    group_id INT,
    name VARCHAR(64),
    sorted_order INT,
    FOREIGN KEY (group_id) REFERENCES attribute_groups(id)
);

CREATE TABLE attribute_value (
    id BIGSERIAL PRIMARY KEY,
    attribute_id BIGINT,
    value VARCHAR(64),
    FOREIGN KEY (attribute_id) REFERENCES attributes(id)
);

CREATE TABLE attributes_product (
    product_id UUID,
    attribute_value_id BIGINT,
    updated_at TIMESTAMP,
    updated_by UUID,
    FOREIGN KEY (product_id) REFERENCES products(id),
    FOREIGN KEY (attribute_value_id) REFERENCES attribute_value(id),
    PRIMARY KEY (product_id, attribute_value_id)
);

CREATE TABLE series_attributes_value (
    series_id BIGINT,
    attribute_value_id BIGINT,
    FOREIGN KEY (series_id) REFERENCES product_series(id),
    FOREIGN KEY (attribute_value_id) REFERENCES attribute_value(id),
    PRIMARY KEY (series_id, attribute_value_id)
);

CREATE TABLE variant_attributes (
    variant_type_id INT,
    attribute_id BIGINT,
    FOREIGN KEY (variant_type_id) REFERENCES variant_types(id),
    FOREIGN KEY (attribute_id) REFERENCES attributes(id),
    PRIMARY KEY (variant_type_id, attribute_id)
);
