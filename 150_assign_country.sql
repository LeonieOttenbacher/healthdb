update proband set land_id = (
    SELECT Land_ID FROM 22ita.laender
    order by rand()
    limit 1
)