```sql
customers [icon: user, color: orange]{
  id serial pk
  name VARCHAR(100) not null
  email VARCHAR(255) unique
  phone VARCHAR(20) not null
  address text not null
  city VARCHAR(100)
  state VARCHAR(100)
  pincode VARCHAR(10)
  created_at timestamp
  updated_at timestamp
}

categories [icon: tag, color: blue]{
  id serial pk
  name VARCHAR(100) not null
  product_type enum["thrift", "handmade"] not null
  parent_category_id int fk
  description text
  created_at timestamp
}

products [icon: box, color: purple]{
  id serial pk
  name VARCHAR(200) not null
  description text not null
  price decimal(10,2) not null
  category_id int fk
  
  size VARCHAR(20)
  color VARCHAR(50)
  material VARCHAR(100)
  condition enum["excellent", "good", "fair", "salvage"]
  
  product_type enum["thrift", "handmade"] not null
  is_unique_piece boolean default false
  stock_quantity int default 0
  is_available boolean default true
  
  images text[]
  created_at timestamp
  updated_at timestamp
}

orders [icon: shopping-cart, color: green]{
  id serial pk
  customer_id int fk not null
  total_amount decimal(10,2) not null
  order_status enum["pending", "confirmed", "processing", "completed", "cancelled"] not null
  billing_date timestamp
  expected_delivery_date date
  created_at timestamp
  updated_at timestamp
}

order_items [icon: list, color: teal]{
  id serial pk
  order_id int fk not null
  product_id int fk not null
  quantity int not null
  unit_price decimal(10,2) not null
  subtotal decimal(10,2) not null
  created_at timestamp
}

payments [icon: credit-card, color: yellow]{
  id serial pk
  order_id int fk not null
  amount decimal(10,2) not null
  payment_method enum["upi", "card", "net_banking", "cod"] not null
  payment_status enum["pending", "paid", "failed", "refunded"] not null
  transaction_id VARCHAR(100) unique
  paid_at timestamp
  created_at timestamp
  updated_at timestamp
}

shipments [icon: truck, color: pink]{
  id serial pk
  order_id int fk not null
  tracking_number VARCHAR(100) unique
  carrier VARCHAR(50)
  shipped_date timestamp
  delivered_date timestamp
  current_status enum["processing", "in_transit", "delivered", "returned"] not null
  created_at timestamp
  updated_at timestamp
}

categories.id < products.category_id
categories.id < categories.parent_category_id

customers.id < orders.customer_id

orders.id < order_items.order_id
orders.id < payments.order_id
orders.id < shipments.order_id

products.id < order_items.product_id
```