trainers [color: blue]{
  id serial pk
  name VARCHAR(100) not null
  email VARCHAR(255) unique not null
  phone VARCHAR(20) not null
  gender enum["male","female","other"] not null
  social_handle VARCHAR(100)
  profile_pic VARCHAR(500)
  experience_years int not null
  bio text
  is_active boolean default true
  created_at timestamp
  updated_at timestamp
}

clients [color: orange]{
  id serial pk
  name VARCHAR(100) not null
  email VARCHAR(255) unique not null
  phone VARCHAR(20) not null
  gender enum["male","female","other"] not null
  fitness_goal text not null
  initial_height_cm decimal(5,2)
  initial_weight_kg decimal(5,2)
  date_of_birth date
  social_handle VARCHAR(100)
  profile_pic VARCHAR(500)
  created_at timestamp
  updated_at timestamp
}

programs [color: purple]{
  id serial pk
  trainer_id int fk not null
  name VARCHAR(150) not null
  description text not null
  price decimal(10,2) not null
  duration_days int not null
  exercise_plan_template text
  diet_plan_template text
  max_clients int
  is_active boolean default true
  created_at timestamp
  updated_at timestamp
}

subscriptions [color: magenta]{
  id serial pk
  client_id int fk not null
  program_id int fk not null
  start_date date not null
  end_date date not null
  status enum["active","expired","cancelled","paused"] not null
  created_at timestamp
  updated_at timestamp
}

sessions [color: red]{
  id serial pk
  trainer_id int fk not null
  client_id int fk not null
  subscription_id int fk
  session_type enum["consultation","coaching","live_class"] not null
  meeting_url VARCHAR(500)
  scheduled_at timestamp not null
  duration_minutes int default 60
  status enum["scheduled","completed","missed","cancelled"] not null
  notes text
  created_at timestamp
  updated_at timestamp
}

check_ins [color: teal]{
  id serial pk
  client_id int fk not null
  subscription_id int fk
  weight_kg decimal(5,2) not null
  body_measurements jsonb
  progress_photos text[]
  client_notes text
  mood_rating int
  energy_level int
  created_at timestamp
}

trainer_notes [color: yellow]{
  id serial pk
  trainer_id int fk not null
  check_in_id int fk not null
  feedback text not null
  created_at timestamp
}

progress_records [icon: chart, color: pink] {
  id serial pk
  client_id int fk not null
  subscription_id int fk not null
  check_in_id int fk
  weight_kg decimal(5,2)
  height_cm decimal(5,2)
  body_fat_percentage decimal(4,2)
  muscle_mass_kg decimal(5,2)
  measurements jsonb
  progress_photos text[]
  milestone_achieved VARCHAR(200)
  recorded_at timestamp not null
  created_at timestamp
}

payments [color: maroon] {
  id serial pk
  client_id int fk not null
  subscription_id int fk not null
  amount decimal(10,2) not null
  payment_method enum["upi","card","net_banking"] not null
  payment_status enum["pending","paid","failed","refunded"] not null
  transaction_id VARCHAR(100) unique
  paid_at timestamp
  created_at timestamp
  updated_at timestamp
}

trainers.id < programs.trainer_id
trainers.id < sessions.trainer_id
trainers.id < trainer_notes.trainer_id

clients.id < subscriptions.client_id
clients.id < sessions.client_id
clients.id < check_ins.client_id
clients.id < progress_records.client_id
clients.id < payments.client_id

programs.id < subscriptions.program_id

subscriptions.id < sessions.subscription_id
subscriptions.id < payments.subscription_id
subscriptions.id < check_ins.subscription_id
subscriptions.id < progress_records.subscription_id

check_ins.id - trainer_notes.check_in_id
check_ins.id - progress_records.check_in_id