users[icon: user, color: yellow]{
  id int PK
  full_name VARCHAR(100)
  created_at timestamp
}

vehicle_types[icon: car, color: blue]{
  id int PK
  name VARCHAR
  size enum["small", "medium", "large"]
}

vehicles[icon: truck, color: green]{
  id int PK
  user_id int FK null
  vehicle_number VARCHAR unique not null
  vehicle_type_id int FK
  created_at timestamp
}

parking_zones[icon: building, color: purple]{
  id int PK
  name VARCHAR
}

parking_levels[icon: layers, color: teal]{
  id int PK
  zone_id int FK
  level_number int
}

spot_categories[icon: tag, color: orange]{
  id int PK
  name VARCHAR
}

spots[icon: parking, color: red]{
  id int PK
  level_id int FK
  size enum["small", "medium", "large"]
  category_id int FK
}

parking_sessions[icon: ticket, color: magenta]{
  id int PK
  vehicle_id int FK
  spot_id int FK
  entry_time timestamp
  exit_time timestamp
  status enum["active", "completed"]
}

tickets[icon: receipt, color: yellow]{
  id int PK
  session_id int FK
  ticket_number VARCHAR unique
  issued_at timestamp
}

reservations[icon: clock, color: blue]{
  id int PK
  vehicle_id int FK
  spot_id int FK
  reserved_from timestamp
  reserved_to timestamp
  status enum["active", "cancelled", "completed"]
  created_at timestamp
}

payments[icon: payment, color: green]{
  id int PK
  session_id int FK
  amount decimal(10,2)
  payment_method enum["upi", "card", "net_banking", "cash"]
  payment_status enum["paid", "pending", "refunded"]
  transaction_id VARCHAR unique
  paid_at timestamp
  created_at timestamp
}

users.id < vehicles.user_id

vehicle_types.id < vehicles.vehicle_type_id

parking_zones.id < parking_levels.zone_id
parking_levels.id < spots.level_id

spot_categories.id < spots.category_id

vehicles.id < parking_sessions.vehicle_id
spots.id < parking_sessions.spot_id

parking_sessions.id - tickets.session_id

parking_sessions.id < payments.session_id

vehicles.id < reservations.vehicle_id
spots.id < reservations.spot_id