```sql
buildings[icon: building, color: blue] {
  id int PK
  building_name varchar(100)
  location varchar(255)
  building_type varchar(50)
  total_floors int
  address text
  city varchar(100)
  state varchar(100)
  created_at timestamp
  updated_at timestamp
}

shafts[icon: elevator, color: slate] {
  id int PK
  building_id int FK
  shaft_number varchar(20)
  zone varchar(50)
  location_description varchar(255)
  created_at timestamp
  updated_at timestamp
}

elevators[icon: roller-coaster, color: green] {
  id int PK
  shaft_id int FK
  elevator_code varchar(50)
  capacity_kg int
  capacity_persons int
  operational_status enum["active", "maintenance", "disabled", "retired"]
  manufacturer varchar(100)
  model varchar(100)
  installation_date date
  last_inspection_date date
  created_at timestamp
  updated_at timestamp
}

floors[icon: layers, color: cyan] {
  id int PK
  building_id int FK
  floor_number int
  floor_code varchar(20)
  floor_name varchar(100)
  floor_type enum["basement", "ground", "regular", "mechanical", "rooftop"]
  created_at timestamp
  updated_at timestamp
}

elevator_floor_assignments[icon: link, color: indigo] {
  id int PK
  elevator_id int FK
  floor_id int FK
  is_active boolean
  assigned_at timestamp
  created_at timestamp
}

floor_requests[icon: bell, color: orange] {
  id int PK
  floor_id int FK
  requested_direction enum["up", "down"]
  request_status enum["pending", "assigned", "completed", "cancelled"]
  requested_at timestamp
  created_at timestamp
}

ride_assignments[icon: target, color: purple] {
  id int PK
  floor_request_id int FK
  elevator_id int FK
  assigned_at timestamp
  assignment_algorithm varchar(50)
  estimated_arrival_time timestamp
  created_at timestamp
}

trip_logs[icon: route, color: teal] {
  id int PK
  ride_assignment_id int FK
  elevator_id int FK
  origin_floor_id int FK
  destination_floor_id int FK
  pickup_time timestamp
  dropoff_time timestamp
  travel_duration_seconds int
  wait_time_seconds int
  number_of_stops int
  passenger_count int
  created_at timestamp
}

elevator_realtime_state[icon: activity, color: red] {
  id int PK
  elevator_id int FK
  current_floor_id int FK
  direction enum["up", "down", "idle"]
  door_status enum["open", "closed", "opening", "closing"]
  load_weight_kg int
  speed_mps decimal(5,2)
  last_updated_at timestamp
  created_at timestamp
}

elevator_daily_metrics[icon: bar-chart, color: yellow] {
  id int PK
  elevator_id int FK
  metric_date date
  total_trips int
  total_distance_floors int
  total_passengers int
  total_runtime_minutes int
  average_wait_time_seconds decimal(10,2)
  average_trip_duration_seconds decimal(10,2)
  peak_hour_trips int
  downtime_minutes int
  created_at timestamp
  updated_at timestamp
}

maintenances[icon: tool, color: amber] {
  id int PK
  elevator_id int FK
  maintenance_type enum["routine", "repair", "inspection", "emergency"]
  priority enum["low", "medium", "high", "critical"]
  status enum["scheduled", "in_progress", "on_hold", "completed", "cancelled"]
  scheduled_at timestamp
  started_at timestamp
  technician_name varchar(100)
  technician_contact varchar(20)
  estimated_hours decimal(5,2)
  issue_description text
  created_at timestamp
  updated_at timestamp
}

maintenance_history[icon: history, color: violet] {
  id int PK
  maintenance_id int FK
  completed_at timestamp
  actual_hours_spent decimal(5,2)
  parts_replaced json
  parts_cost decimal(10,2)
  labor_cost decimal(10,2)
  total_cost decimal(10,2)
  technician_notes text
  resolution_status enum["resolved", "partial", "escalated"]
  next_maintenance_due date
  created_at timestamp
}

buildings.id < shafts.building_id
shafts.id < elevators.shaft_id
buildings.id < floors.building_id

elevators.id < elevator_floor_assignments.elevator_id
floors.id < elevator_floor_assignments.floor_id

floors.id < floor_requests.floor_id
floor_requests.id < ride_assignments.floor_request_id
elevators.id < ride_assignments.elevator_id

ride_assignments.id < trip_logs.ride_assignment_id
elevators.id < trip_logs.elevator_id
floors.id < trip_logs.origin_floor_id
floors.id < trip_logs.destination_floor_id

elevators.id < elevator_realtime_state.elevator_id
floors.id < elevator_realtime_state.current_floor_id

elevators.id < elevator_daily_metrics.elevator_id

elevators.id < maintenances.elevator_id
maintenances.id < maintenance_history.maintenance_id
```
