<?php

//----- posibles dbengine ------//
define("DBE_MYSQL"     , 1 );
define("DBE_ODBC"      , 2 );
define("DBE_INFORMIX"  , 3 );
define("DBE_INTERBASE" , 4 );
define("DBE_ORACLE"    , 5 );
define("DBE_POSTGRESQL", 6 );

define("CURRENT_DB_ENGINE",DBE_POSTGRESQL);


//--- TIPOS DE OBJETOS
define("DISTRITO"         , 1 );
define("SECCION"          , 2 );
define("CIRCUITO"         , 3 );
define("ESTABLECIMIENTO"  , 4 );
define("CARGO"            , 5 );
define("CATEGORIA"        , 6 );
define("PARTIDO"          , 7 );
define("CANDIDATO"        , 8 );
define("LISTA"            , 9 );
define("MESA_TESTIGO"     , 12 );
define("MESA"             , 15 );





//Apertura de la base de datos mysql
global $db1, $db2;

//---- BASE 1 ----------
$server1   = 'localhost';
$user1     = 'postgres';
$passwd1   = 'password';
$database1 = 'gestionrrhh';
$port1     = '5432';

//---- BASE 2 ----------
//$server2   = 'localhost';
//$user2     = 'postgres';
//$passwd2   = 'password';
//$database2 = 'sedroobs';
//$port2     = '5432';





//---- CONEXION BASES ----------
$db1 = DB_connect($server1, $user1, $passwd1, $database1, $port1);
if(!$db1){
    die('NO se pudo conectar a la base de datos. Db1');
}

//$db2 = DB_connect($server2, $user2, $passwd2, $database2, $port2);
//if(!$db2){
//    die('NO se pudo conectar a la base de datos. Db2');
//}




/**
 * Trae lista de equivalencia segun tipo
 */
function traerTiposEquivalentes($TIPO, $db )
{
    $result = array();
    $sql="SELECT tray as id, obs as name  FROM sys_valores WHERE tipo='{$TIPO}'";
    $datos = DB_query($sql,$db);
    while ($row = DB_fetch($datos)){
        $result[$row['id']]=$row['name'];
    }
    return $result;
}


//
//------------------------------------------------------------------------------
//function migrardbf($dbtable,$dbf_path,$memo_file) 
//{
//    create_table($dbtable, $dbf_path);
//    importdbf($dbtable, $dbf_path, $memo_file);
//    return;
//}

//------------------------------------------------------------------------------
function create_table($dbtable, $db_path)
{
    global $conn;

    // Open dbase file
    $dbh = dbase_open($db_path, 0) or die("Error! Could not open dbase database file '$db_path'.");

    // Get column information
    $column_info = dbase_get_header_info($dbh);

    // Display information
    //print_r($column_info);

    $line = array();
    $b=0;
    foreach($column_info as $col)
    {
        switch($col['type'])
        {
            case 'character':
                $type = traerTipo('character');
                $line[]= "$col[name] VARCHAR( $col[length] )";
                break;
            case 'number':
                $line[]= "$col[name] FLOAT";
                break;
            case 'boolean':
                $line[]= "$col[name] CHAR(2)";
                break;
            case 'date':
                $line[]= "$col[name] DATE";
                break;
            case 'memo':
                $line[]= "$col[name] TEXT";
                break;
        }
        $b=$b+1;
        //print "field $b = $col[name] ";
    }
    $str = implode(",",$line);
    $sql = "CREATE TABLE $dbtable ( $str );";

    //print $sql."";
    $result = DB_query($sql, $conn);
    if ($result)
    {
        //$i +=1;
        print "Tabla Creada: $dbtable";
    }

}
function traerTipo($untipo)
{
    $return = '';
    
    $tipos=array();
    switch (CURRENT_DB_ENGINE)
    {
        case DBE_MYSQL: 
            $tipos = array('character'=>'VARCHAR','number'=>'FLOAT','boolean'=>'TINYINT(4)','date'=>'DATE','memo'=>'TEXT');
            break;
        case DBE_POSTGRESQL:
            $tipos = array('character'=>'character varying','number'=>'numeric(13,4)','boolean'=>'smallint','date'=>'date','memo'=>'text');
            break;
    }
    return $tipos[$untipo];
}



function secondsToTime($s)
{
    $h = floor($s / 3600);
    $s -= $h * 3600;
    $m = floor($s / 60);
    $s -= $m * 60;
    return $h.':'.sprintf('%02d', $m).':'.sprintf('%02d', $s);
}


//----------------------------------
//------  SECCION:  Base de datos  ----
function DB_connect($sqlserver, $sqluser, $sqlpassword, $database, $port, $persistency = true)
{
  $db_connect_id = false;
  switch (CURRENT_DB_ENGINE)
  {
    case DBE_MYSQL:
            $db_connect_id = mysql_connect($sqlserver, $sqluser, $sqlpassword);
            if($db_connect_id)
            {
                if($database != "")
                {
                    $dbselect = mysql_select_db($database);
                    if(!$dbselect){
                        mysql_close($db_connect_id);
                        $db_connect_id = $dbselect;
                    }
                }
                return $db_connect_id;
            }else{
                $db_connect_id=false;
            }
            break;
    case DBE_POSTGRESQL:
            $db_connect_id = pg_connect( "host=$sqlserver port=$port dbname=$database user=$sqluser password=$sqlpassword"  );
            pg_query($db_connect_id, "SET CLIENT_ENCODING TO 'UTF8'");
            pg_set_client_encoding($db_connect_id,"UNICODE");
            break;
    case DBE_INFORMIX:
            $db_connect_id = ifx_connect ($sqlserver, $sqluser, $sqlpassword);
            break;
    case DBE_INTERBASE: break;
    case DBE_ORACLE:
            $db_connect_id = oci_connect( $sqluser , $sqlpassword, $sqlserver );
            break;
    case DBE_ODBC:
	    $db_connect_id = odbc_connect($sqlserver, $sqluser, $sqlpassword);
	    break;
  }// end switch

  return ( $db_connect_id );
}




function DB_fetch_all($cursor)
{
  $result = true;
  switch (CURRENT_DB_ENGINE)
  {
    case DBE_MYSQL: $result = mysqli_fetch_assoc($cursor); break;
    case DBE_POSTGRESQL: 
        $result = pg_fetch_all($cursor);
        break;
    case DBE_INFORMIX: $result = ifx_fetch_row($cursor,1); break;
    case DBE_INTERBASE: break;
    case DBE_ORACLE: 
            $result = oci_fetch($cursor);
            oci_execute($result);
        break;
    case DBE_ODBC:
            $result = odbc_fetch_array($cursor);
    	break;
  }

  return $result;
}


function DB_fetch($cursor)
{
  $result = false;
  switch (CURRENT_DB_ENGINE)
  {
    case DBE_MYSQL: $result = mysqli_fetch_assoc($cursor); break;
    case DBE_POSTGRESQL: 
        $result = pg_fetch_assoc($cursor);
        break;
    case DBE_INFORMIX: $result = ifx_fetch_row($cursor,1); break;
    case DBE_INTERBASE: break;
    case DBE_ORACLE: 
            $result = oci_fetch($cursor);
            oci_execute($result);
        break;
    case DBE_ODBC:
            $result = odbc_fetch_array($cursor);
    	break;
  }
  return $result;
}

function DB_execute($db, $name, $vals){
  $result = true;
  switch (CURRENT_DB_ENGINE)
  {
    case DBE_MYSQL: $result = null; break;
    case DBE_POSTGRESQL: 
        //print_r($vals); die();
        $result = pg_execute($db, $name, $vals);
        if(!$result){
            die("ERROR-execute: field ".$name);
        }
        break;
    case DBE_INFORMIX: $result =null; break;
    case DBE_INTERBASE: break;
    case DBE_ORACLE: 
            $result = null;
        break;
    case DBE_ODBC:
            $result = null;
    	break;
  }

  return $result;
}


function DB_prepare($db, $name, $sql)
{
  $result = true;
  switch (CURRENT_DB_ENGINE)
  {
    case DBE_MYSQL: $result = null; break;
    case DBE_POSTGRESQL: 
        $result = pg_prepare($db,$name,$sql);
        break;
    case DBE_INFORMIX: $result =null; break;
    case DBE_INTERBASE: break;
    case DBE_ORACLE: 
            $result = null;
        break;
    case DBE_ODBC:
            $result = null;
    	break;
  }

  return $result;
}
      

function DB_query($sql, $dbconnect, $msg = '')
{
  $result = true;
  switch (CURRENT_DB_ENGINE)
  {
    case DBE_MYSQL: $result = mysqli_query($dbconnect,$sql,MYSQLI_ASSOC); break;
    case DBE_POSTGRESQL: 
        //echo "\n".$sql;
        $result = pg_query($dbconnect,$sql);
        if (!$result) {
            echo "--- ERROR --- \n";
            echo pg_last_error($dbconnect);
            echo "----------------- \n";
            exit;
          }
        break;
    case DBE_INFORMIX: $result = ifx_query($sql, $dbconnect); break;
    case DBE_INTERBASE: break;
    case DBE_ORACLE: 
            $result = oci_parse($dbconnect, $sql);
            oci_execute($result);
        break;
    case DBE_ODBC:
            $result = odbc_do ( $dbconnect, $sql );
    	break;
  }

  if (!$result)
  {
          $msgerr='';
          switch (CURRENT_DB_ENGINE)
          {
                case DBE_MYSQL:
                	$msgerr = mysql_errno().": ".mysql_error()."<BR>";
			if ( (mysql_errno()>=1060) && (mysql_errno()<=1062))
                            $msg.="<b>YA EXISTE EL CDIGO QUE INTENTA INGRESAR</b><br>".$msg;
			if ( (mysql_errno()>=1215) && (mysql_errno()<=1216))
                            $msg.="<b>No se puede Agregar o Modificar ya que no existe alguna referencia al valor que intenta grabar</b><br>".$msg;
			if ( (mysql_errno()==1217))
                            $msg.="<b>No se puede Borrar o Modificar ya que existe referencias al valor que intenta grabar</b><br>".$msg;
                    break;
                case DBE_POSTGRESQL:
                        die( pg_last_error($dbconnect) );
                     break;
                case DBE_INFORMIX:
                        $result = ifx_query($sql, $dbconnect);
                     break;
                case DBE_INTERBASE: break;
                case DBE_ORACLE: 
//                    $e = oci_error();   // Para errores de oci_connect errors, no pase un gestor
//                    trigger_error(htmlentities($e['message']), E_USER_ERROR);
                    break;
                case DBE_ODBC:
                            $msgerr = odbc_error().": ".odbc_errormsg()."<BR>";
                        break;
          }
          $msg.="<br><br>".$sql."<br><br>".$msg."Error:".$msgerr;
	}
	return $result;
}

/*
function db_escape_string($text)
{
  if (function_exists('mb_detect_encoding')) 
  {
    $cur_encoding = mb_detect_encoding($text);
    if(($cur_encoding != "UTF-8" && $cur_encoding != "ASCII") || !mb_check_encoding($text, "UTF-8")) {
      $text = utf8_encode($text);
    }
  }
  return pg_escape_string($text);
}
*/

function fixEncoding($in_str)
{
  $cur_encoding = mb_detect_encoding($in_str) ;
  if($cur_encoding == "UTF-8" && mb_check_encoding($in_str,"UTF-8"))
    return $in_str;
  else
    return utf8_encode($in_str);
}

 function db_escape_string($text) {
   return pg_escape_string(fixEncoding($text));
 }


/*
 * Agrega un texto a un archivo
 */
function appendArchivo($contenido,$archivo )
{
	$ok=false;
	$file = fopen($archivo, 'a+');
	if($file)
	{
		$ok=true;
		fwrite($file, $contenido);
		fclose($file);
	}
	return $ok;
}
/*
 *
 * Graba un texto a un archivo. Si ya existe reemplaza todo el contenido
 */
function grabarArchivo( $contenido, $nombrearchivo )
{
	$gestor = fopen($nombrearchivo, 'w+');
	fwrite( $gestor, $contenido );
	fclose($gestor);
}

function traerIDActual($dbconn,$idAnterior, $tipoOBJ, $tabla='ele_dimension' )
{
    $creterioOBJ = ($tipoOBJ=='')?"":" tipo_id={$tipoOBJ} AND ";
    
    $curtabla = DB_query("SELECT id FROM {$tabla} WHERE $creterioOBJ idanterior={$idAnterior}", $dbconn);
    $row = DB_fetch($curtabla);
    return $row['id'];
}


function traerValor($dbconn, $field, $tabla,$criteria)
{   
    $curtabla = DB_query("SELECT {$field} FROM {$tabla} WHERE $criteria", $dbconn);
    $row = DB_fetch($curtabla);
    return $row[$field];
}



//-------FUNCIONES VARIAS --------------------------------------------------
function existe($conn, $table,$criteria="1=1")
{
    $result = DB_query("SELECT count(*) as cantidad FROM {$table} WHERE {$criteria}", $conn);
    $res =  DB_fetch($result);
    if(!$res){
        return false;
    }else{
        return ($res['cantidad']>0);
    }
}

function traerMaximo($conn, $table, $campo, $criteria="1=1")
{
    $result = DB_query("SELECT MAX( {$campo} ) as maximo FROM {$table} WHERE {$criteria}", $conn);
    $res =  DB_fetch($result);
    if(isset($res['maximo'])){
        return $res['maximo'];
    }else{
        return 0;
    }
}

function TraerVectorIds($conn, $id, $tabla, $condicion="true")
{
     $arrlista = array();
     $cursorlista = DB_query("select $id from $tabla where $condicion", $conn);
     while ( $rowLista = DB_fetch($cursorlista))
       $arrlista[] =  $rowLista[$id];
	 if (!(count($arrlista)>0)) $arrlista[]=null;
  return($arrlista);
}
