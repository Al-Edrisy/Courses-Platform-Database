/*
CREATE TABLE "user" (
  user_id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
  user_name VARCHAR(200) NOT NULL,
  password_hash VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  is_student BOOLEAN DEFAULT FALSE,
  is_instructor BOOLEAN DEFAULT FALSE
);


CREATE TABLE student (
  student_id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  user_id UUID REFERENCES "user"(user_id) NOT NULL
);

CREATE TABLE instructor (
  instructor_id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL,
  phone_number VARCHAR(20),
  career VARCHAR(30),
  points INT DEFAULT 0,
  user_id UUID REFERENCES "user"(user_id) NOT NULL
);

CREATE TABLE subject (
  subject_id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
  subject_name VARCHAR(100) NOT NULL,
  description TEXT NOT NULL
);

CREATE TABLE course (
  course_id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
  subject_id UUID REFERENCES subject(subject_id),
  instructor_id UUID REFERENCES instructor(instructor_id),
  title VARCHAR(100) NOT NULL,
  categories VARCHAR(100)[] DEFAULT '{}'::VARCHAR(100)[] NOT NULL,
  duration INT NOT NULL,
  price FLOAT DEFAULT 0.00 NOT NULL
);

CREATE TABLE enrollment (
  enrollment_id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
  user_id UUID REFERENCES "user"(user_id),
  course_id UUID REFERENCES course(course_id),
  enrollment_date DATE DEFAULT CURRENT_DATE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE feedback (
  feedback_id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
  student_id UUID REFERENCES student(student_id),
  course_id UUID REFERENCES course(course_id),
  rating SMALLINT CHECK (rating > 0 AND rating <= 5),
  comment TEXT,
  created_date DATE DEFAULT CURRENT_DATE
);

CREATE TABLE payment_method (
  payment_method_id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
  user_id UUID REFERENCES "user"(user_id),
  card_type VARCHAR(20) NOT NULL,
  last_four_digits VARCHAR(4) NOT NULL,
  expiration_date DATE NOT NULL
);

CREATE TABLE transaction (
  transaction_id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
  user_id UUID REFERENCES "user"(user_id),
  amount FLOAT NOT NULL,
  "current_time" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  state VARCHAR(30) NOT NULL
);
*/



