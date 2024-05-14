--  Weist den entsprechenden Probanden mit jeweiligen Krankheiten die richtigen Medikamente zu
-- Umsetzung für Krankheit: Bluthochdruck (4) und Fettstoffwechselstörung -> Bekommt Medikamente Gesundix und Kannix

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

-- Für weitere Krankheiten -> Medikamente obigen code beliebig erweitern und verändern