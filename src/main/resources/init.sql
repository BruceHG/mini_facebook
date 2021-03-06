    DROP TABLE IF EXISTS sequence;  
    CREATE TABLE sequence (  
             name VARCHAR(50) NOT NULL,  
             current_value INT NOT NULL,  
             increment INT NOT NULL DEFAULT 1,  
             PRIMARY KEY (name)  
    ) ENGINE=InnoDB;  
        DROP FUNCTION IF EXISTS currval;  
    DELIMITER $  
    CREATE FUNCTION currval (seq_name VARCHAR(50))  
             RETURNS INTEGER  
             LANGUAGE SQL  
             DETERMINISTIC  
             CONTAINS SQL  
             SQL SECURITY DEFINER  
             COMMENT ''  
    BEGIN  
             DECLARE value INTEGER;  
             SET value = 0;  
             SELECT current_value INTO value  
                       FROM sequence  
                       WHERE name = seq_name;  
             RETURN value;  
    END  
    $  
    DELIMITER ;  
        DROP FUNCTION IF EXISTS nextval;  
    DELIMITER $  
    CREATE FUNCTION nextval (seq_name VARCHAR(50))  
             RETURNS INTEGER  
             LANGUAGE SQL  
             DETERMINISTIC  
             CONTAINS SQL  
             SQL SECURITY DEFINER  
             COMMENT ''  
    BEGIN  
             UPDATE sequence  
                       SET current_value = current_value + increment  
                       WHERE name = seq_name;  
             RETURN currval(seq_name);  
    END  
    $  
    DELIMITER ;  
        DROP FUNCTION IF EXISTS setval;  
    DELIMITER $  
    CREATE FUNCTION setval (seq_name VARCHAR(50), value INTEGER)  
             RETURNS INTEGER  
             LANGUAGE SQL  
             DETERMINISTIC  
             CONTAINS SQL  
             SQL SECURITY DEFINER  
             COMMENT ''  
    BEGIN  
             UPDATE sequence  
                       SET current_value = value  
                       WHERE name = seq_name;  
             RETURN currval(seq_name);  
    END  
    $  
    DELIMITER ;  
    INSERT INTO sequence VALUES ('UserSeq', 0, 1);
	INSERT INTO sequence VALUES ('PostSeq', 0, 1);
        INSERT INTO sequence VALUES ('LikeSeq', 0, 1);
        INSERT INTO sequence VALUES ('DetailSeq', 0, 1);
            INSERT INTO sequence VALUES ('NotificationSeq', 0, 1);
            INSERT INTO sequence VALUES ('FriendSeq', 0, 1);
            
            
                DROP TABLE IF EXISTS entitystore;  
    CREATE TABLE entitystore (  
             subject VARCHAR(100),  
             predicate VARCHAR(100),  
             object VARCHAR(100)
    ) ENGINE=InnoDB;  
                    DROP TABLE IF EXISTS graph;  
    CREATE TABLE graph (  
             subject VARCHAR(100),  
             predicate VARCHAR(100),  
             object VARCHAR(100)
    ) ENGINE=InnoDB;  