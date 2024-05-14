DROP PROCEDURE IF EXISTS assign_illness;
delimiter //
CREATE PROCEDURE assign_illness(IN prob_id INT)
BEGIN
	DECLARE ills INT DEFAULT FLOOR(RAND()*5+1);
	LOOP_ILLS: LOOP
		IF ills < 1 THEN
			LEAVE LOOP_ILLS;
		END IF;
		INSERT INTO probanden_krankheiten VALUES(prob_id, ills);
        SET ills = ills -1;
	END LOOP LOOP_ILLS;
END //
delimiter ;


drop procedure if exists illproband;
delimiter //
create procedure illproband()
BEGIN
    DECLARE done BOOL DEFAULT false;
    DECLARE probid INT;
	declare probandidcursor cursor for
		select id from proband;
	DECLARE CONTINUE HANDLER
        FOR NOT FOUND SET done = true;
	open probandidcursor;
    assign_ill: LOOP
		fetch probandidcursor into probid;
        if done = true then
			leave assign_ill;
		end if;
		call assign_illness(probid);
	end LOOP;
    close probandidcursor;
END //
delimiter ;


call illproband();

-- Beispielausgabe zum Überprüfen

select p.lastname, p.firstname, p.birthday, k.Name from proband as p
join probanden_krankheiten as pk on p.id = pk.Probanden_ID
join krankheiten as k on k.Krankheits_ID = pk.Krankheits_ID
where p.gender = 1;


