TYPE=TRIGGERS
triggers='CREATE DEFINER=`root`@`localhost` TRIGGER calcpersonage \nbefore INSERT on Person  for each row  \nBEGIN\n  IF new.Age IS NULL THEN \n    set new.Age  = 2022 - Year(new.DOB) ;\n  END IF;  \nEND'
sql_modes=524288
definers='root@localhost'
client_cs_names='utf8mb4'
connection_cl_names='utf8mb4_unicode_ci'
db_cl_names='utf8mb4_general_ci'
created=165367071342
