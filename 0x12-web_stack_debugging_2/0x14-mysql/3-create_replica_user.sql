CREATE USER 'replica_user'@'%' IDENTIFIED BY 'your_password_here';
GRANT REPLICATION SLAVE ON *.* TO 'replica_user'@'%';
FLUSH PRIVILEGES;
