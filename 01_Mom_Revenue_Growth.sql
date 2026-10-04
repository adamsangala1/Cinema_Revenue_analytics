SELECT 
    TO_CHAR(pl.datum_cas, 'YYYY-MM') AS mesiac,
    SUM(l.konecna_cena) AS trzba_tento_mesiac,
    LAG(SUM(l.konecna_cena)) OVER (ORDER BY TO_CHAR(pl.datum_cas, 'YYYY-MM')) AS trzba_minuly_mesiac,
    SUM(l.konecna_cena) - LAG(SUM(l.konecna_cena)) OVER (ORDER BY TO_CHAR(pl.datum_cas, 'YYYY-MM')) AS rozdiel
FROM listky l
JOIN predaj_listky pl ON l.predaj_id = pl.predaj_id
GROUP BY TO_CHAR(pl.datum_cas, 'YYYY-MM')
ORDER BY mesiac;