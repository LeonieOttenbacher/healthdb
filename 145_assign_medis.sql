--  Weist den entsprechenden Probanden mit jeweiligen Krankheiten die richtigen Medikamente zu
-- Umsetzung für Krankheit: Bluthochdruck (2) und Fettstoffwechselstörung (4) und sonst nichts -> Bekommt Medikamente Gesundix(4) und Kannix (5)

insert into probanden_medikamente (Probanden_ID, Medikamente_ID)
select id, 4 from proband
where id in (
select probanden_id from probanden_krankheiten where Krankheits_ID = 2
union
select probanden_id from probanden_krankheiten where Krankheits_ID = 4

);

insert into probanden_medikamente (Probanden_ID, Medikamente_ID)
select id, 5 from proband
where id in (
select probanden_id from probanden_krankheiten where Krankheits_ID = 2
union
select probanden_id from probanden_krankheiten where Krankheits_ID = 4
);

-- Beispielausgabe zum Überprüfen
select p.id, p.lastname, p.firstname, m.Name from proband as p
join probanden_medikamente as pm on p.id = pm.Probanden_ID
join medikamente m on m.Medikamenten_ID = pm.Medikamente_ID
order by lastname asc

-- Umsetzung für Krankheit: Fehlsichtigkeit (3) sonst nichts -> Bekommt Medikament Istnix (7)

insert into probanden_medikamente (Probanden_ID, Medikamente_ID)
select  id , 7 from proband
where id in (
    select probanden_id from probanden_medikamente  where Krankheits_ID = 3
    );

-- Umsetzung für Krankheit: Rückenschmerzen (1), Fettstoffwechselstörung (4) und Grippe (5) und sonst nichts  -> Bekommt Medikament Machmichfix (2)

insert into probanden_medikamente (Probanden_ID, Medikamente_ID)
select id, 2 from proband
where id in (select probanden_id
             from probanden_krankheiten
             where Krankheits_ID = 1
             union
             select probanden_id
             from probanden_krankheiten
             where Krankheits_ID = 4
             union
             select probanden_id
             from probanden_krankheiten
             where Krankheits_ID = 5
            );

-- Umsetzung für Krankheit: Rückenschmerzen (1), Fettstoffwechselstörung (4), Grippe (5), Fehlsichtigkeit (3) und Bluthochdruck (2) und sonst nichts
-- -> Bekommt Medikamente Supix (6) u. Wirknix (1)

insert into probanden_medikamente (Probanden_ID, Medikamente_ID)
select id, 1 from proband
where id in (select probanden_id
             from probanden_krankheiten
             where Krankheits_ID = 1
             union
             select probanden_id
             from probanden_krankheiten
             where Krankheits_ID = 2
             union
             select probanden_id
             from probanden_krankheiten
             where Krankheits_ID = 3
             union
             select probanden_id
             from probanden_krankheiten
             where Krankheits_ID = 4
             union
             select probanden_id
             from probanden_krankheiten
             where Krankheits_ID = 5
             );

insert into probanden_medikamente (Probanden_ID, Medikamente_ID)
select id, 6 from proband
where id in (select probanden_id
             from probanden_krankheiten
             where Krankheits_ID = 1
             union
             select probanden_id
             from probanden_krankheiten
             where Krankheits_ID = 2
             union
             select probanden_id
             from probanden_krankheiten
             where Krankheits_ID = 3
             union
             select probanden_id
             from probanden_krankheiten
             where Krankheits_ID = 4
             union
             select probanden_id
             from probanden_krankheiten
             where Krankheits_ID = 5
             );


