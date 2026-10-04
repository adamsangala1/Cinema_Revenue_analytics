SELECT
	TO_CHAR(pl.datum_cas, 'YYYY-MM') AS mesiac,
	SUM(l.konecna_cena) AS trzba_mesiac,
	SUM(SUM(l.konecna_cena)) OVER (ORDER BY TO_CHAR(pl.datum_cas, 'YYYY-MM')) AS kumulativna_trzba 
FROM listky l
JOIN predaj_listky pl ON pl.predaj_id = l.predaj_id
GROUP BY TO_CHAR(pl.datum_cas, 'YYYY-MM')
ORDER BY mesiac