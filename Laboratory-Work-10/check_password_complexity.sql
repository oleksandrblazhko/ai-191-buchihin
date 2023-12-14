CREATE OR REPLACE FUNCTION check_password_complexity(
    v_password VARCHAR
)
RETURNS BOOLEAN
AS $$
DECLARE
    num_numbers INT;
    num_lowercase INT;
    num_uppercase INT;
    num_special_chars INT;
    special_chars VARCHAR[] := '{!,@,#,$,%,^,&,*}'::VARCHAR[];
BEGIN
    IF LENGTH(v_password) <= 10 THEN
        RETURN FALSE;
    END IF;
    num_numbers := LENGTH(v_password) - LENGTH(REGEXP_REPLACE(v_password, '[0-9]', '', 'g'));
    num_lowercase := LENGTH(v_password) - LENGTH(REGEXP_REPLACE(v_password, '[a-z]', '', 'g'));
    num_uppercase := LENGTH(v_password) - LENGTH(REGEXP_REPLACE(v_password, '[A-Z]', '', 'g'));
    num_special_chars := LENGTH(v_password) - LENGTH(REGEXP_REPLACE(v_password, '[!@#$%^&*]', '', 'g'));
    IF num_numbers >= 2 AND num_lowercase >= 2 AND num_uppercase >= 2 AND num_special_chars >= 4 THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END;
$$ LANGUAGE plpgsql;
