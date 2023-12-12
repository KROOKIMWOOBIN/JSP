create table users(
	id varchar(20) primary key,
    pw varchar(20),
    username varchar(20),
    email varchar(30)
);

create table post(
	post_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id VARCHAR(20),
    title VARCHAR(100),
    content LONGTEXT,
    foreign key(user_id) references users(id)
);
