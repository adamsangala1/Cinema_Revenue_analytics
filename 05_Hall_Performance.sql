SELECT 
    k.mesto,
    s.sala_id,
    ts.nazov_typu AS typ_saly,
    s.cislo_saly,
    s.kapacita AS kapacita_saly,
    COUNT(DISTINCT pr.premietanie_id) AS pocet_premietani,
    COUNT(l.listk_id) AS pocet_predanych_listkov,
    SUM(l.konecna_cena) AS trzba
FROM listky l
JOIN premietania pr ON pr.premietanie_id = l.premietanie_id
JOIN saly s ON s.sala_id = pr.sala_id
JOIN typy_sal ts ON ts.typ_saly_id = s.typ_saly_id
JOIN kina k ON k.kino_id = s.kino_id
GROUP BY k.mesto, s.sala_id, ts.nazov_typu, s.cislo_saly, s.kapacita
ORDER BY trzba DESC;