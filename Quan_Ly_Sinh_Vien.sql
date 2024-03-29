drop database if exists Quan_Ly_Sinh_Vien;
CREATE DATABASE if not exists Quan_Ly_Sinh_Vien;
USE Quan_Ly_Sinh_Vien;
CREATE TABLE class (
    class_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    class_name VARCHAR(60) NOT NULL,
    start_date DATETIME NOT NULL,
    class_status BIT
);
CREATE TABLE student (
    student_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(30) NOT NULL,
    address VARCHAR(50),
    phone VARCHAR(20),
    student_status BIT,
    class_id INT NOT NULL,
    FOREIGN KEY (class_id)
        REFERENCES class(class_id)
);
CREATE TABLE subjects (
    sub_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    sub_name VARCHAR(30) NOT NULL,
    credit TINYINT NOT NULL DEFAULT 1 CHECK (credit >= 1),
    sub_status BIT DEFAULT 1
);

CREATE TABLE mark (
    mark_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    sub_id INT NOT NULL,
    student_id INT NOT NULL,
    mark FLOAT DEFAULT 0 CHECK (mark BETWEEN 0 AND 100),
    exam_times TINYINT DEFAULT 1,
    UNIQUE (sub_id , student_id),
    FOREIGN KEY (sub_id)
        REFERENCES subjects (sub_id),
    FOREIGN KEY (student_id)
        REFERENCES student (student_id)
);
INSERT INTO class
VALUES (1, 'A1', '2008-12-20 08:08:08', 1);
insert into class(class_name, start_date, class_status)
values('A2', '2008-12-22 12:12:12', 1),
('B3', current_date(), 0);

INSERT INTO student (student_name, address, phone, student_status, class_id)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1);

INSERT INTO student (student_name, address, student_status, class_id)
VALUES ('Hoa', 'Hai phong', 1, 1);

INSERT INTO student (student_name, address, phone, student_status, class_id)
VALUES ('Manh', 'HCM', '0123123123', 0, 2);

INSERT INTO subjects
VALUES (1, 'CF', 5, 1),
 (2, 'C', 6, 1),
 (3, 'HDJ', 5, 1),
 (4, 'RDBMS', 10, 1);
 
INSERT INTO mark (sub_id, student_id, mark, exam_times)
VALUES (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);
 