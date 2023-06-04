use music;

DROP TABLE user;

CREATE TABLE user (
	user_id INT PRIMARY KEY AUTO_INCREMENT,
    display_name VARCHAR(250) NOT NULL,
    email VARCHAR(250) NOT NULL unique
);

SELECT * FROM user;

SELECT * FROM reply;

DROP TABLE reply;

CREATE TABLE reply (
	reply_no INT PRIMARY KEY AUTO_INCREMENT,
    -- user_id INT,
--     
--     FOREIGN KEY (user_id) 
--     REFERENCES user(user_id)
--     ON DELETE CASCADE,
    
    reply_id VARCHAR(250) NOT NULL,
    reply_content VARCHAR(3000) NOT NULL,
    reg_date DATETIME DEFAULT CURRENT_TIMESTAMP
    
);
