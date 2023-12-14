CREATE OR REPLACE FUNCTION user_register_secure(
    v_user_name varchar, 
	v_password varchar
)
	RETURNS INTEGER
AS $$
BEGIN
	IF NOT EXISTS ( SELECT FROM passwords 
						WHERE password = v_password) THEN
		IF check_password_complexity(v_password) THEN				
			INSERT INTO users (user_name,pass) 
					VALUES (v_user_name,
						v_password);
			RETURN 1;
		ELSE
			RAISE NOTICE 'Passname = % INCORRECT!',v_password;
			RETURN -1;
		END IF;
	ELSE 
		RAISE NOTICE 'Passname = % is bad passname',v_password;
		RETURN -1;
	END IF;
END;
$$ LANGUAGE plpgsql;
