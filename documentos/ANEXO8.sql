select 
pa.idpadron,
(Select a.APPATERNO from padron a where a.IDPADRON=pa.IDPADRON), 
(Select a.APMATERNO from padron a where a.IDPADRON=pa.IDPADRON),
(Select a.NOMBRE    from padron a where a.IDPADRON=pa.IDPADRON),
(Select CASE a.sexo WHEN 'F' THEN 'M' WHEN 'M' THEN 'H' ELSE '' END Genero from padron a where a.IDPADRON=pa.IDPADRON),
(Select (select datediff (year, p.FECNAC, current_date) from persona p where p.DNI=a.dni) from padron a where a.IDPADRON=pa.IDPADRON) edad,
(Select a.TELEFONO    from padron a where a.IDPADRON=pa.IDPADRON),
(Select a.ANIO_INCORPORACION    from padron a where a.IDPADRON=pa.IDPADRON),
pa.IDACTIVIDAD,
pa.ANIO_INSTALACION,
'AÑO_INCORPORACION_ACTIVIDAD',




from PADRONACTIVIDAD pa
where pa.IDPADRON in
(select b.IDPADRON from PADRON b where b.IDADENDA='AD01-2024')
order by 1
