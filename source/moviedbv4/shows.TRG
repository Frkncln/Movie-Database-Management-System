TYPE=TRIGGERS
triggers='CREATE DEFINER=`root`@`localhost` TRIGGER calcpopularity \nbefore INSERT ON Shows \nFOR EACH ROW \nBEGIN \n	IF new.Popularity IS NULL   THEN \n		SET new.Popularity  = (new.Rating / 10) + new.Budget / 100000 ; \n	END IF; \nEND'
sql_modes=524288
definers='root@localhost'
client_cs_names='utf8mb4'
connection_cl_names='utf8mb4_unicode_ci'
db_cl_names='utf8mb4_general_ci'
created=165367071338
