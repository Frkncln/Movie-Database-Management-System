TYPE=TRIGGERS
triggers='CREATE DEFINER=`root`@`localhost` TRIGGER calcdirectorexperience \nbefore INSERT on Director  for each row \nBEGIN\n  IF new.experience IS NULL THEN \n    set new.experience  = 2022- new.StartDate ;\n  END IF;  \nEND' 'CREATE DEFINER=`root`@`localhost` TRIGGER calcdirectorexperienceup \nbefore UPDATE on Director  for each row \nBEGIN\n  IF new.experience IS NULL THEN \n    set new.experience  = 2022- new.StartDate ;\n  END IF;  \nEND'
sql_modes=524288 524288
definers='root@localhost' 'root@localhost'
client_cs_names='utf8mb4' 'utf8mb4'
connection_cl_names='utf8mb4_unicode_ci' 'utf8mb4_unicode_ci'
db_cl_names='utf8mb4_general_ci' 'utf8mb4_general_ci'
created=165367071348 165367071352
