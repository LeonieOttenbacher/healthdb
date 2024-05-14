-- Jedem Proband soll zufällig ein Land zugewiesen werden

update proband set land_id = (
    SELECT Land_ID FROM 22ita.laender
    order by rand()
    limit 1 -- Es soll sich auf ein Land beschränken
)