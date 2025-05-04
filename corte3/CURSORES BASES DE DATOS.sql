SET SERVEROUTPUT on;
begin
  dbms_output.put_line('Electiva Oracle');
end;
/

declare
  v_nota number := 0;
begin
  v_nota := 5;
  dbms_output.put_line(v_nota);
end;
/

declare
  v_nota number default 0;
  v_cadena varchar2(50):='---';
  v_elemento number;
begin
  v_nota:=3.8;
  if v_nota>=4 then
    v_cadena:='Buena nota';
    elsif (v_nota >= 3) and (v_nota < 4) then
    v_cadena := 'Nota regular';
  else
    v_cadena := 'Mala nota';
  end if;
    dbms_output.put_line('Valor de la variable v_cadena--->' || v_cadena);
  if v_elemento is null then
    dbms_output.put_line('Valor de la variable v_elemento esta vacia...');
  else
    dbms_output.put_line('Valor de la variable v_elemento esta no esta vacia...');
  end if;
end;
/

SET SERVEROUTPUT on;
declare
  v_numero number default 0;
begin
  dbms_output.put_line('---------------');
  loop
    v_numero:=v_numero+1;
    exit when v_numero>10;
    dbms_output.put_line('Valor de la variable v_numero--->'||v_numero);
  end loop;
  dbms_output.put_line('---------------');
  loop
    if v_numero<=1 then
      exit;
    end if;
    v_numero := v_numero-1;
    dbms_output.put_line('Valor de la variable v_numero--->'||v_numero);
  end loop;
  dbms_output.put_line('---------------');
end;
/

declare
  v_numero number default 1;
begin
  dbms_output.put_line('---------------');
  while v_numero<=10 loop
    dbms_output.put_line('Valor de la variable v_numero--->'||v_numero);
    v_numero:=v_numero+1;
  end loop;
  dbms_output.put_line('---------------');
end;
/

declare
  v_numero number default 1;
begin
  dbms_output.put_line('---------------');
  for v_numero in 1 .. 10 loop
    dbms_output.put_line('Valor de la variable v_numero--->'||v_numero);
  end loop;
  dbms_output.put_line('---------------');
end;
/

declare
  v_numero number default 1;
begin
  dbms_output.put_line('---------------');
  for v_numero in reverse 1 .. 10 loop
    dbms_output.put_line('Valor de la variable v_numero--->'||v_numero);
  end loop;
  dbms_output.put_line('---------------');
end;
/

declare
  v_inicio number default 20;
  v_fin number default 30;
begin
  dbms_output.put_line('---------------');
  for v_numero in reverse v_inicio .. v_fin loop
    dbms_output.put_line('Valor de la variable v_numero--->'||v_numero);
  end loop;
  dbms_output.put_line('---------------');
end;
/

declare
  v_miestudiante estudiante%rowtype;
begin
  dbms_output.put_line('---------------');

  select * into v_miestudiante
  from estudiante e
  where e.CODIGO=5;

  dbms_output.put_line('Valor de la variable v_numero--->'
    ||v_miestudiante.codigo||' '||v_miestudiante.nombres||' '||v_miestudiante.apellido1||' '||v_miestudiante.apellido2);
  dbms_output.put_line('---------------');
end;
/

declare
  v_codigo number := -1;
  v_estudiante varchar2(30) := '---';
  v_micodigo estudiante.codigo%type;
  v_miestudiante estudiante.nombres%type;
begin
  dbms_output.put_line('---------------CURSORES IMPLICITOS---------------');

  SELECT e.CODIGO, e.NOMBRES ||' '|| e.APELLIDO1 ||' '|| e.APELLIDO2 estudiante into v_codigo, v_estudiante
  FROM estudiante e
  WHERE e.CODIGO = 3;

  dbms_output.put_line('Valor de las variables---> ' ||' '|| v_estudiante);
  dbms_output.put_line('-------------------------------------------------');

  SELECT e.CODIGO, e.NOMBRES ||' '|| e.APELLIDO1 ||' '|| e.APELLIDO2 estudiante into v_micodigo, v_miestudiante
  FROM estudiante e
  WHERE e.CODIGO = 1;
  dbms_output.put_line('-------------------------------------------------');
end;
/


declare
    micodigo number := 3;
    v_nombres varchar2(100);
    cursor mis_estudiantes is
    select e.CODIGO, e.NOMBRES || ' ' || e.APELLIDO1 || ' ' || e.APELLIDO2 Estudiante
    from estudiante e
    where e.codigo >= micodigo;
    v_micursor mis_estudiantes%rowtype;
begin
    dbms_output.put_line('------------CURSORES EXPLÍCITOS-----------------------------');   
    open mis_estudiantes;   
    fetch mis_estudiantes into micodigo, v_nombres; 
    fetch mis_estudiantes into v_micursor;  
    dbms_output.put_line('Valor de las variables micodigo y v_nombres ---> ' || micodigo || ' ' || v_nombres);
    dbms_output.put_line('Valor de las variable v_micursor ---> ' || v_micursor.codigo || ' ' || v_micursor.estudiante);    
    close mis_estudiantes;  
    dbms_output.put_line('------------------------------------------------------------');
end;
/

