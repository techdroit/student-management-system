CREATE TABLE quiz.student (
	id INT NOT NULL AUTO_INCREMENT,
	first_name varchar(100) NOT NULL,
	last_name varchar(100) NOT NULL,
	gender CHAR(1) NOT NULL,
	dob DATE NOT NULL,
	faculty varchar(100) NOT NULL,
	department varchar(100) NOT null,
	primary key (id)
)
ENGINE=InnoDB
DEFAULT CHARSET=latin1
COLLATE=latin1_swedish_ci ;