SELECT 
    pl.sposob_platby,
    SUM(l.konecna_cena) AS celkova_trzba,
    ROUND(
        (SUM(l.konecna_cena) / SUM(SUM(l.konecna_cena)) OVER ()) * 100, 
        2
    ) AS podiel_v_percentach
FROM listky l
JOIN predaj_listky pl ON l.predaj_id = pl.predaj_id

GROUP BY pl.sposob_platby
ORDER BY celkova_trzba DESC