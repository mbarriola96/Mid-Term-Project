SELECT pob.communities, pob.year, emp.total_number_of_companies, emp.total_capital_subscribed, ipv.house_price_index_hpi, 
ipc.consumer_price_index_cpi, mor.cost_per_mortgage, birth.total_births, birth.total_marriages, birth.total_functions, 
occupied.occupied_population, mor.cost_per_mortgage, gdp.total_gdp, pob.total_population
FROM population.poblacion_por_comunidades pob
JOIN population.ipv_por_comunidad ipv 
ON pob.communities = ipv.communities AND pob.year = ipv.year
JOIN population.ipc_por_comunidad ipc 
ON pob.communities = ipc.communities AND pob.year = ipc.year
JOIN population.nacimiento_matrimonio_defuncion_comunidades birth
ON pob.communities = birth.communities AND pob.year = birth.year
JOIN population.numero_de_ocupados_por_comunidad_autonoma occupied
ON pob.communities = occupied.communities AND pob.year = occupied.year
JOIN population.numero_hipotecas_importe_hipotecas_por_comunidad_dividir mor 
ON pob.communities = mor.communities AND pob.year = mor.year
JOIN population.PIB_Valor_ComunidadesAutonomas gdp
ON pob.communities = gdp.communities AND pob.year = gdp.year
JOIN population.empresas_y_capital_por_comunidad emp
ON pob.communities = emp.communities AND pob.year = emp.year
WHERE pob.year IN (2020,2019,2018,2017,2016)
ORDER BY communities;
