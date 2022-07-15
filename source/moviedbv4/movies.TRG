TYPE=TRIGGERS
triggers='CREATE DEFINER=`root`@`localhost` TRIGGER calcduration \nbefore INSERT on Movies  FOR EACH ROW\nBEGIN\n IF new.Hour IS NULL THEN \n set new.Hour  = Floor(new.duration / 60) + (new.duration % 60)/100;\nEND IF;  \nEND'
sql_modes=524288
definers='root@localhost'
client_cs_names='utf8mb4'
connection_cl_names='utf8mb4_unicode_ci'
db_cl_names='utf8mb4_general_ci'
created=165367071334
