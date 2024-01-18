#!/bin/bash

# configura conexion a base de datos
DB_HOST="localhost"
DB_NAME="rrhh"
DB_SCHEMA="migracion"
DB_USER="postgres"
DB_PASSWORD="password"

# configura archivos de salida
TMP1=output_cabecera_conceptos.tmp
TMP2=output_datos_conceptos.tmp
FILESQL=genera_insert_datos_concepto.sql

# Define la linea de INSERT de la query
SQL_QUERY_INSERT="INSERT INTO public.concepto (activado, \"creadoEn\", \"modificadoEn\", \"eliminadoEn\", \"activadoEn\",  cod_concepto, fecha_desde, fecha_hasta, desc_conce, desc_corta, legajo_cargo, imprime_cero, id_tipo_concepto, id_ganancias, id_concepto_cant, \"creadoPorId\", \"modificadoPorId\", \"eliminadoPorId\", \"activadoPorId\") VALUES "
echo "$SQL_QUERY_INSERT" > $TMP1 

export PGUSER=$DB_USER
export PGPASSWORD=$DB_PASSWORD

SQL_QUERY="$(psql -h $DB_HOST -U $DB_USER -d $DB_NAME -c "SELECT DISTINCT ' (true, \"2022-12-06 11:58:32.691\", NULL, NULL, \"2022-12-06 11:58:32.689\",' || codigo_concepto || ', \"2022-12-01 00:00:00.000\", NULL, \"'|| descripcion_concepto ||'\", \"'|| descripcion_concepto ||'\", \"C\", 0, 35, 35, NULL, -1, NULL, NULL, -1),' AS col1 FROM $DB_SCHEMA.\"DetallesHab\" ORDER BY 1 ASC")"
echo "$SQL_QUERY" > $TMP2
sed -i '1,2d' $TMP2
sed -i '$d' $TMP2
sed -i '$s/,$/;/' $TMP2

PGUSER=""
PGPASSWORD=""
export PGUSER PGPASSWORD
unset PGUSER
unset PGPASSWORD


sed -i 's/"/'\''/g' $TMP2

cat $TMP1  > $FILESQL
cat $TMP2  >> $FILESQL

rm $TMP1 $TMP2

echo "El script SQL fue generado en el archivo "
