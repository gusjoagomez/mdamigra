# mdamigra

***
El siguiente proyecto git contiene varias utilidades correspondientes
al tratamiento de datos del sistema de sueldos de MdA

Los programas se encuentran en el directorio cmd de este proyecto.

Muchas de estas utilidades estan agrupadas en varios programas dentro
de cmd

Antes de correr los siguienes proceso es conveniente restaurar el esquema que contiene los datos.
Deberá restaurar en su base el archivo ubicado en: basedatos/rrhh.sql

psql -d rrhh < basedatos/rrhh.sql

(Hay otra opcion basedatos/esquemaMigracion.sql que tiene datos parecidos.. Creo que algnas tablas tienen modificados algunos tipos de campos. Pero la que deberia ser es rrhh.sql)

***
## Subproyecto1: 

  Compuesto por 2 aplicaciones:

  * importadetliqui1 
  * importadetliqui2

### - Importar liquidacion de NewRol

A partir de archivos provistos por Sab.Iorgi ubicados en el directorio:
  detalleliqui

La importacion de estos datos a las tablas consta de dos (2) pasos:

  Paso 1:
  * importadetliqui1: este paso levanta archivo por archivo csv a una tabla en la base de datos llamada DetallesHab, para luego procesarlos más facilmente e insertarlos en la tabla de liquidación y detalle de liquidación (liquicon)
  
  Para correr este paso se deberá ejecutar desde linea de comandos el ejecutable pasando como parametro la ruta al archivo a importar.
  Ejemplo:
  go run detalleliquidacion1.go mdamigra/detalleliqui/detalle_A_01_2023.csv
  
  Esto ultimo importará los datos del archivo detalle_A_01_2023.csv
  ATENCION: se programó un archivo de procesamiento por lotes (bash script) que automatiza la importacion de multiples archivos indicando una carpeta. Este script se encuentra junto con el ejecutable con el nombre importaMasivoCSV.sh. Sera simplemente ejecutar ./importaMasivoCSV.sh para importar todos los archivos. Revise  y modifique en caso de ser necesario, dentro de este script el path a donde buscar los archivos CSV

  Paso 2: 
  * importadetliqui2: este paso lee de la tabla DetallesHab y genera registros en la tabla de liquidacion y tabla de detalle de conceptos.

 Para ejecutar este proceso ejecute simplemente:
  go run importadetliqui2.go 

  Este proceso puede demorar varios minutos.
  Al finalizar las tablas liqui (liquidacion) y liqui_cons (conceptos de liquidacion) deberian estar con registros.

***
## Subproyecto2: 

### - Importar datos de antigüedad de NewRol y J50 para luego unificarlos.
Este subproyecto consta de tres (3) pasos:

  * 1importaNR
  * 2importaJ50
  * 3importaFinal

 Paso 1:
   Importa datos de NewRol.
   Genera datos en una tabla en la base de datos llamada "migracion.empleadoNR". Los datos son insertado partir del archivo obtenido de los listados de NewRol y ubicados en mdamigra/antecedentesJ50/antecedentes_NR.csv

 Paso 2:
   Importa datos migrados del servidor J50.
   Genera datos en una tabla en la base de datos llamada "migracion.empleadoJ50". Los datos son insertados desde el archivo de datos ubicado en: mdamigra/antecedentesJ50/antecedentes_j50.csv

 Paso 3:
   Este paso insertará en la tabla "migracion.empleadoRES" con datos de antiguedad por rangos.
   Junta los datos anteriores y los inserta en una tabla final con los datos segun los siguientes rangos:

      Periodos o rangos de fechas:
      - desde 01/01/1900 al 31/12/1995
      - desde 01/01/1996 al 31/12/2012
      - desde 01/01/2013 al 31/12/2024

 NOTA: es conveniente respetar el orden de ejecucion en estos paso. En realidad los pasos 1 y 2 pueden ejecutarse indistintamente. Pero es condicion necesaria que el paso 3 sea ejecutado por ultimo, ya que es el paso que unifica los anteriores.


## Subproyecto3: 

### - Licencias sin goce de sueldo.

Se adjunta una tabla con datos de Licencia Sin Goce de Sueldo actualizada al dia 23/10/2023.
Esta tabla fue producto de un reporte de NewRol y fue importada a un esquema de tablas postgres.
El archivo original puede encontrarlo en: mdamigra/archivosSabri/licSinGoce/lic_sin_goce_20231023.csv

### Otras tablas migradas

Podrá encontrar otras tablas de datos utiles en el esquema a restaurar como por ejemplo:

- licenciassingoce: licencias sin goce de sueldo
- leg_categ: categorias y legajos
- lic_antec: antecedentes de licencias

Revisar y chequear los campos y su semantica de estas ultimas tablas con quien facilitó (Sabrina Iorgi) los reportes que dieron origen a estas tablas.


### Configuración de las conexiones a base de datos.

Dentro de cada directorio para correr algún programa se encuentra un directorio llamado "config" y dentro de este un archivo llamado "config.conf".
En este archivo se puede configurar las conexiones a base de datos y esquemas que se usan en el programa.

Ejemplo:

------------------------------------------------------------
[db]
siradig="postgres://postgres:password@localhost:5432/rrhh"
migracion="postgres://postgres:password@localhost:5432/rrhh"
legajos="postgres://postgres:password@localhost:5432/gestionrrhh"

[schema]
siradig="siradig"
migracion="migracion"
legajos="public"
------------------------------------------------------------


