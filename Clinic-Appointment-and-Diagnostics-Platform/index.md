```mermaid
users[icon: user, color: yellow]{
  id serial PK
  full_name VARCHAR(100) not null
  email VARCHAR(255)
  phone VARCHAR(20) not null
  dob date not null
  gender enum["male", "female", "others"] not null
  user_type enum["doctor", "patients", "admin"]
  created_at timestamp
  updated_at timestamp
}

doctors[icon: doctor, color: green]{
  id int PK
  user_id int FK
  specialization VARCHAR not null
  license_number VARCHAR unique not null
  experience_years int not null
  bio text
}

patients[icon: client, color: blue]{
  id int PK
  user_id int FK
  blood_group VARCHAR
  medical_history text
}

appointments[icon: calendar, color: teal]{
  id int PK
  patient_id int FK
  doctor_id int FK
  start_time DateTime
  end_time DateTime
  status enum["booked", "completed", "cancelled", "no_show"]
  reason text
  booked_at timestamp
  created_at timestamp
  updated_at timestamp
}

visits[icon: walking, color: purple]{
  id int PK
  appointment_id int FK null
  patient_id int FK
  visit_type enum["walk_in", "appointment"]
  status enum["waiting", "in_diagnostic", "in_consultation", "completed"]
  check_in_time timestamp
  check_out_time timestamp
}

consultations[icon: Clipboard-List, color: red]{
  id int PK
  visit_id int FK
  doctor_id int FK
  consultation_date date
  notes text
  diagnosis text
  prescription text
  duration_minutes int
  created_at timestamp
}

diagnostic_tests[icon: test-tube, color: pink]{
  id int PK
  consultation_id int FK
  patient_id int FK
  test_name VARCHAR
  test_category VARCHAR
  status enum["pending", "sample_collected", "in_progress", "completed"]
  test_date date
  sample_collected_at timestamp
  created_at timestamp
}

reports[icon: report, color: orange]{
  id int PK
  diagnostic_tests_id int FK
  report_by_doctor_id int FK
  report_type VARCHAR
  report_file_url VARCHAR 
  report_file_type enum["pdf", "image", "lab_report"]
  conclusion text
  reported_at timestamp
  created_at timestamp
}

payments[icon:payment, color: magenta]{
  id int PK
  visit_id int FK null
  diagnostic_tests_id int FK null
  consultation_id int FK null
  amount decimal(10,2)
  payment_type enum["registration", "diagnostic_test", "consultation_fee"]
  payment_method enum["upi", "card", "net_banking", "cash"]
  payment_status enum["paid", "pending", "refunded"]
  transaction_id VARCHAR unique
  paid_at timestamp
  created_at timestamp
}

users.id - doctors.user_id
users.id - patients.user_id

patients.id - appointments.patient_id
patients.id < visits.patient_id
patients.id < diagnostic_tests.patient_id

doctors.id < appointments.doctor_id
doctors.id < consultations.doctor_id
doctors.id < reports.report_by_doctor_id

appointments.id - visits.appointment_id

visits.id < consultations.visit_id
visits.id < payments.visit_id

consultations.id < diagnostic_tests.consultation_id
consultations.id < payments.consultation_id

diagnostic_tests.id < reports.diagnostic_tests_id
diagnostic_tests.id < payments.diagnostic_tests_id