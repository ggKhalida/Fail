CREATE TABLE HubDiscipline (
    discipline_key BIGSERIAL PRIMARY KEY,
    discipline_id INT UNIQUE NOT NULL,
    load_date TIMESTAMP NOT NULL,
    record_source VARCHAR(50) NOT NULL
);

CREATE TABLE HubPracticalWork (
    work_key BIGSERIAL PRIMARY KEY,
    work_id INT UNIQUE NOT NULL,
    load_date TIMESTAMP NOT NULL,
    record_source VARCHAR(50) NOT NULL
);

CREATE TABLE HubStudent (
    student_key BIGSERIAL PRIMARY KEY,
    student_id INT UNIQUE NOT NULL,
    load_date TIMESTAMP NOT NULL,
    record_source VARCHAR(50) NOT NULL
);

CREATE TABLE HubInstructor (
    instructor_key BIGSERIAL PRIMARY KEY,
    instructor_id INT UNIQUE NOT NULL,
    load_date TIMESTAMP NOT NULL,
    record_source VARCHAR(50) NOT NULL
);

CREATE TABLE LinkWorkAssignment (
    work_assignment_key BIGSERIAL PRIMARY KEY,
    work_key BIGINT NOT NULL REFERENCES HubPracticalWork(work_key),
    student_key BIGINT NOT NULL REFERENCES HubStudent(student_key),
    load_date TIMESTAMP NOT NULL,
    record_source VARCHAR(50) NOT NULL
);

CREATE TABLE LinkInstructorAssignment (
    instructor_assignment_key BIGSERIAL PRIMARY KEY,
    instructor_key BIGINT NOT NULL REFERENCES HubInstructor(instructor_key),
    work_key BIGINT NOT NULL REFERENCES HubPracticalWork(work_key),
    load_date TIMESTAMP NOT NULL,
    record_source VARCHAR(50) NOT NULL
);

CREATE TABLE LinkStep (
    step_key BIGSERIAL PRIMARY KEY,
    work_key BIGINT NOT NULL REFERENCES HubPracticalWork(work_key),
    load_date TIMESTAMP NOT NULL,
    record_source VARCHAR(50) NOT NULL
);

CREATE TABLE SatDiscipline (
    discipline_key BIGINT NOT NULL REFERENCES HubDiscipline(discipline_key),
    name VARCHAR(100) NOT NULL,
    load_date TIMESTAMP NOT NULL,
    record_source VARCHAR(50) NOT NULL,
    PRIMARY KEY (discipline_key, load_date)
);

CREATE TABLE SatPracticalWork (
    work_key BIGINT NOT NULL REFERENCES HubPracticalWork(work_key),
    title VARCHAR(200) NOT NULL,
    description TEXT,
    deadline DATE,
    discipline_key BIGINT NOT NULL REFERENCES HubDiscipline(discipline_key),
    load_date TIMESTAMP NOT NULL,
    record_source VARCHAR(50) NOT NULL,
    PRIMARY KEY (work_key, load_date)
);

CREATE TABLE SatStudent (
    student_key BIGINT NOT NULL REFERENCES HubStudent(student_key),
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    "group" VARCHAR(50) NOT NULL,
    load_date TIMESTAMP NOT NULL,
    record_source VARCHAR(50) NOT NULL,
    PRIMARY KEY (student_key, load_date)
);

CREATE TABLE SatInstructor (
    instructor_key BIGINT NOT NULL REFERENCES HubInstructor(instructor_key),
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    load_date TIMESTAMP NOT NULL,
    record_source VARCHAR(50) NOT NULL,
    PRIMARY KEY (instructor_key, load_date)
);

CREATE TABLE SatWorkAssignment (
work_assignment_key BIGINT NOT NULL REFERENCES   LinkWorkAssignment(work_assignment_key),
    assigned_date DATE NOT NULL,
    status VARCHAR(50) NOT NULL,
    completion_date DATE,
    load_date TIMESTAMP NOT NULL,
    record_source VARCHAR(50) NOT NULL,
    PRIMARY KEY (work_assignment_key, load_date)
);

CREATE TABLE SatInstructorAssignment (
instructor_assignment_key BIGINT NOT NULL REFERENCES LinkInstructorAssignment(instructor_assignment_key),
    load_date TIMESTAMP NOT NULL,
    record_source VARCHAR(50) NOT NULL,
    PRIMARY KEY (instructor_assignment_key, load_date)
);

CREATE TABLE SatStep (
    step_key BIGINT NOT NULL REFERENCES LinkStep(step_key),
    step_number INT NOT NULL,
    description TEXT NOT NULL,
    load_date TIMESTAMP NOT NULL,
    record_source VARCHAR(50) NOT NULL,
    PRIMARY KEY (step_key, load_date)
);

