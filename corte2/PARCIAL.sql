/*1. ¿En qué años se han realizado pagos, y cuántos pagos hubo por año?*/ 

SELECT 
    TO_CHAR(FECHA_PAGO,'YYYY'),
    COUNT(TO_CHAR(FECHA_PAGO,'YYYY'))
FROM
    NOMINA N
GROUP BY
    TO_CHAR(FECHA_PAGO,'YYYY');


//2. ¿Cuántos pagos se realizaron en cada día (sin importar la hora) durante todo el año 2009?

SELECT
    TRUNC(FECHA_PAGO) AS FECHA,
    COUNT(TRUNC(FECHA_PAGO)) AS CANTIDAD
FROM
    NOMINA
WHERE
    TO_CHAR(FECHA_PAGO,'YYYY') = 2009
GROUP BY
    TRUNC(FECHA_PAGO) ;

/*4.	Mostrar los empleados que recibieron su último pago en diciembre de cualquier año y 
que dicho pago superó el promedio de pagos de ese año.*/
SELECT 
    P.NOMBRE_1,
    N.FECHA_PAGO,
    N.SALARIO
FROM
    PERSONAL P,
    NOMINA N
WHERE
    P.IDENTIFICACION = N.EMPLEADO AND TO_CHAR(N.FECHA_PAGO,'MM') = 06
    AND (N.SALARIO-N.DESCUENTOS+N.BONOS) > (SELECT 
                        AVG(N1.SALARIO-N1.DESCUENTOS+N1.BONOS)
                     FROM 
                        NOMINA N1
                     WHERE TO_CHAR(N.FECHA_PAGO,'YYYY') = TO_CHAR(N1.FECHA_PAGO,'YYYY'));

SELECT 
    P.NOMBRE_1,
    N.FECHA_PAGO,
    N.SALARIO
FROM
    PERSONAL P,
    NOMINA N
WHERE
    P.IDENTIFICACION = N.EMPLEADO AND TO_CHAR(N.FECHA_PAGO,'MM') = 06
    AND (N.SALARIO-N.DESCUENTOS+N.BONOS) >  (AVG(N.SALARIO-N.DESCUENTOS+N.BONOS))



SELECT 
    AVG(SALARIO-DESCUENTOS+BONOS)
FROM 
    NOMINA
WHERE 
    TO_CHAR(FECHA_PAGO,'YYYY') = 2009;
    
SELECT 
    P.NOMBRE_1,
    N.FECHA_PAGO,
    (N.SALARIO-N.DESCUENTOS+N.BONOS)
FROM
    PERSONAL P,
    NOMINA N
WHERE
    P.IDENTIFICACION = N.EMPLEADO AND TO_CHAR(N.FECHA_PAGO,'MM') = 06;
//3. ¿Cuántos pagos se realizaron en cada mes del año 2023, mostrando el mes con su nombre (ej. "Enero", "Febrero")?
//4. Mostrar por cada departamento cuántos municipios tiene, solo si tiene más de 3 municipios.
//5. Liste las organizaciones que no tienen ningún empleado asignado en la base de datos.
//6. Obtener la organización que realizó el último pago registrado.
//7. Empleado que más ganó en un solo pago, indicando la fecha y el total pagado.
//8. ¿Qué empleados nunca han recibido bonos?
//9. ¿Hay empleados cuyo salario mensual nunca ha cambiado en toda la historia?
//10. ¿Quién gana menos que el promedio de su municipio?

