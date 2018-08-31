/************ Add: Sequences ***************/

/* Autogenerated Sequences */

CREATE SEQUENCE buyer_buyer_id_seq INCREMENT BY 1;
COMMENT ON SEQUENCE buyer_buyer_id_seq IS 'DbWrench Autogenerated Sequence.';

CREATE SEQUENCE category_category_id_seq INCREMENT BY 1;
COMMENT ON SEQUENCE category_category_id_seq IS 'DbWrench Autogenerated Sequence.';

CREATE SEQUENCE order_order_id_seq INCREMENT BY 1;
COMMENT ON SEQUENCE order_order_id_seq IS 'DbWrench Autogenerated Sequence.';

CREATE SEQUENCE ordered_product_ordered_product_id_seq INCREMENT BY 1;
COMMENT ON SEQUENCE ordered_product_ordered_product_id_seq IS 'DbWrench Autogenerated Sequence.';

CREATE SEQUENCE product_product_id_seq INCREMENT BY 1;
COMMENT ON SEQUENCE product_product_id_seq IS 'DbWrench Autogenerated Sequence.';

CREATE SEQUENCE shipping_method_shipping_method_id_seq INCREMENT BY 1;
COMMENT ON SEQUENCE shipping_method_shipping_method_id_seq IS 'DbWrench Autogenerated Sequence.';




/************ Update: Tables ***************/

/******************** Add Table: "buyer" ************************/

/* Build Table Structure */
CREATE TABLE "buyer"
(
	buyer_id OID DEFAULT nextval('buyer_buyer_id_seq'::regclass) NOT NULL,
	o_order_id OID NOT NULL,
	email VARCHAR(100) NOT NULL,
	subscribed BOOL NOT NULL,
	firstname VARCHAR(30) NOT NULL,
	lastname VARCHAR(30) NOT NULL,
	address VARCHAR(255) NOT NULL,
	city VARCHAR(50) NOT NULL,
	county VARCHAR(50) NOT NULL,
	country VARCHAR(50) NOT NULL,
	postal_code VARCHAR(10) NOT NULL,
	phone_number VARCHAR(50) NULL
);

/* Add Primary Key */
ALTER TABLE "buyer" ADD CONSTRAINT pkbuyer
	PRIMARY KEY (buyer_id);


/******************** Add Table: "category" ************************/

/* Build Table Structure */
CREATE TABLE "category"
(
	category_id OID DEFAULT nextval('category_category_id_seq'::regclass) NOT NULL,
	name VARCHAR(100) NOT NULL,
	sex VARCHAR(1) NOT NULL
);

/* Add Primary Key */
ALTER TABLE "category" ADD CONSTRAINT pkcategory
	PRIMARY KEY (category_id);


/******************** Add Table: "content" ************************/

/* Build Table Structure */
CREATE TABLE content
(
  content_id VARCHAR(200) NOT NULL,
	p_product_id OID NOT NULL,
	name VARCHAR(100) NOT NULL
);

/* Add Primary Key */
ALTER TABLE content ADD CONSTRAINT pkcontent
	PRIMARY KEY (content_id);


/******************** Add Table: "order" ************************/

/* Build Table Structure */
CREATE TABLE "order"
(
	order_id OID DEFAULT nextval('order_order_id_seq'::regclass) NOT NULL,
	sm_shipping_method_id OID NOT NULL,
	placed_at TIMESTAMP NOT NULL,
	billing_firstname VARCHAR(30) NOT NULL,
	billing_lastname VARCHAR(30) NOT NULL,
	billing_address VARCHAR(255) NOT NULL,
	billing_city VARCHAR(50) NOT NULL,
	billing_country VARCHAR(50) NOT NULL,
	billing_county VARCHAR(50) NOT NULL,
	billing_postal_code VARCHAR(10) NOT NULL,
	billing_phone_number VARCHAR(50) NULL,
	order_token VARCHAR(255) NOT NULL
);

/* Add Primary Key */
ALTER TABLE "order" ADD CONSTRAINT pkorder
	PRIMARY KEY (order_id);


/******************** Add Table: "ordered_product" ************************/

/* Build Table Structure */
CREATE TABLE "ordered_product"
(
	ordered_product_id OID DEFAULT nextval('ordered_product_ordered_product_id_seq'::regclass) NOT NULL,
	p_product_id OID NOT NULL,
	o_order_id OID NOT NULL,
	product_size VARCHAR(3) NOT NULL,
	ordered_count INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE "ordered_product" ADD CONSTRAINT pkordered_product
	PRIMARY KEY (ordered_product_id);


/******************** Add Table: "product" ************************/

/* Build Table Structure */
CREATE TABLE "product"
(
	product_id OID DEFAULT nextval('product_product_id_seq'::regclass) NOT NULL,
	c_category_id OID NOT NULL,
	name VARCHAR(100) NOT NULL,
	price DOUBLE PRECISION NOT NULL,
	discount DOUBLE PRECISION NULL,
	availability_on_command BOOL NOT NULL,
	description VARCHAR(255)[] NOT NULL,
	care VARCHAR(255)[] NOT NULL
);

/* Add Primary Key */
ALTER TABLE "product" ADD CONSTRAINT pkproduct
	PRIMARY KEY (product_id);


/******************** Add Table: "shipping_method" ************************/

/* Build Table Structure */
CREATE TABLE "shipping_method"
(
	shipping_method_id OID DEFAULT nextval('shipping_method_shipping_method_id_seq'::regclass) NOT NULL,
	name VARCHAR(100) NOT NULL
);

/* Add Primary Key */
ALTER TABLE "shipping_method" ADD CONSTRAINT pkshipping_method
	PRIMARY KEY (shipping_method_id);


/******************** Add Table: "stock" ************************/

/* Build Table Structure */
CREATE TABLE "stock"
(
	p_product_id OID NOT NULL,
	product_size VARCHAR(3) NOT NULL,
	available_count INTEGER NOT NULL
);





/************ Add Foreign Keys ***************/

/* Add Foreign Key: fk_content_product */
ALTER TABLE content ADD CONSTRAINT fk_content_product
	FOREIGN KEY (p_product_id) REFERENCES "product" (product_id)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_order_shipping_method */
ALTER TABLE "order" ADD CONSTRAINT fk_order_shipping_method
	FOREIGN KEY (sm_shipping_method_id) REFERENCES "shipping_method" (shipping_method_id)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ordered_product_order */
ALTER TABLE "ordered_product" ADD CONSTRAINT fk_ordered_product_order
	FOREIGN KEY (o_order_id) REFERENCES "order" (order_id)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

	/* Add Foreign Key: fk_buyer_order */
ALTER TABLE "buyer" ADD CONSTRAINT fk_buyer_order
	FOREIGN KEY (o_order_id) REFERENCES "order" (order_id)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ordered_product_product */
ALTER TABLE "ordered_product" ADD CONSTRAINT fk_ordered_product_product
	FOREIGN KEY (p_product_id) REFERENCES "product" (product_id)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_product_category */
ALTER TABLE "product" ADD CONSTRAINT fk_product_category
	FOREIGN KEY (c_category_id) REFERENCES "category" (category_id)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_stock_product */
ALTER TABLE "stock" ADD CONSTRAINT fk_stock_product
	FOREIGN KEY (p_product_id) REFERENCES "product" (product_id)
	ON UPDATE NO ACTION ON DELETE NO ACTION;