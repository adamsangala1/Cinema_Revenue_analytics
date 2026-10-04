SELECT 
	f.nazov AS nazov_filmu,
	COUNT(l.listk_id) AS pocet_predanych_listkov,
	SUM(l.konecna_cena) AS celkova_trzba,
	ROUND(AVG(konecna_cena),2) AS priemerna_cena

FROM filmy f
JOIN premietania pr ON pr.film_id = f.film_id
JOIN listky l ON l.premietanie_id = pr.premietanie_id
GROUP BY f.nazov
ORDER BY celkova_trzba DESC