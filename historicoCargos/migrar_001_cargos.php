<?php
$contador =0;
$db = $db1;

$sql = "SELECT distinct  l.legajo ,  l.cargo ,  l.fechaingcateg , g.id as idCategoria
        FROM  migracion.legcategh l LEFT JOIN general g on g.\"auxEntero1\" = l.\"codCateg\"::int and g.\"grupoId\"=1006
        ORDER BY legajo, cargo, idcategoria";
$datos = DB_query($sql,$db);

echo "\n INICIANDO EL PROCESO. PROCESANDO...";
echo "\n------------------------------;Legajo;Cargo;FechaCategoria;IdCategoria";
while ($row = DB_fetch($datos))
{
    $existe = existeCargo($db , $row['legajo'], $row['cargo']);
    if (!$existe)  {
        $contador++;
        //echo "\n ----------------------------------------------------------------------"."\n Cantidad: ".$contador."\n";
        //print_r($row);
        insertarRegistroCargo($db, $row);
        //echo "\n ----------------------------------------------------------------------";
    }
}
//-----------------------------------------------------------------------------

// ----------------------------------------------
// retorna true si exsite cargo
// ----------------------------------------------
function existeCargo($db, $legajo, $cargo) {
    $sql="SELECT id FROM \"public\".\"cargo\" WHERE legajo = {$legajo} AND \"nroCargo\" = {$cargo}";
    $datos = DB_query($sql,$db);
    $result = DB_fetch($datos);

    $res = (isset($result['id']) && ($result['id']!=""));

    return $res;
}

// ----------------------------------------------
// Obtiene Nro.Empleado de empleados
// ----------------------------------------------
function traerIdEmpleado($db, $legajo) {
    $sql="SELECT id FROM public.empleado WHERE legajo = {$legajo}";
    $datos = DB_query($sql,$db);
    $result = DB_fetch($datos);
    if (isset($result['id']) && ($result['id']!="")) 
    {
        return $result['id'];
    }else{
        return false;
    }
}

// ----------------------------------------------
// Obtiene Nro.Empleado de empleados
// ----------------------------------------------
function traerFuncionPersonal($db, $legajo, $fecha)
{
    $sql="SELECT \"idFuncionDePersonal\" FROM public.cargo WHERE legajo = {$legajo} AND \"fechaIngresoAlCargo\" >= '{$fecha}'";
    $datos = DB_query($sql,$db);
    $result = DB_fetch($datos);
    return (isset($result['idFuncionDePersonal'])) ? $result['idFuncionDePersonal'] : 3802;
}



/**
 * Inserta registro
 */
function insertarRegistroCargo($db,$row)
{
    $legajo = $row['legajo'];
    $cargo = $row['cargo'];
    $fechacateg = $row['fechaingcateg'];
    $idCategoria= $row['idcategoria'];
    $IdEmpleado = traerIdEmpleado($db,$legajo);
    if(trim($IdEmpleado)==""){
        echo "\nNO se encontro empleado legajo;{$legajo};{$cargo};{$fechacateg};{$idCategoria}";
        return;
    }

    $funcionPersonal = traerFuncionPersonal($db,$legajo, $fechacateg);
    
    $IdPuesto= 4155;
    $IdPlantaDePersonal= 3798; //sin informar
    $IdGrupoDePersonal= 3801; //sin informar
    $IdFuncionDePersonal= $funcionPersonal;
    $IdGrupoDeLiquidacion= 3802; //sin informar
    $IdSituacionDelEmpleado= 3806; //sin informar
    $IdMotivoDeIngreso= 3789; //sin informar
        
    //echo "\nINSERTANDO (legajo,cargo,fechaCat,IdCategoria): ".$legajo." , ".$cargo." , ".$fechacateg." , ".$idCategoria;
    $ahora = date("Y-m-d H:i:s");
    
    $sql="INSERT INTO public.CARGO(activado,\"creadoEn\",\"activadoEn\",legajo,\"nroCargo\",\"fechaDeNormaDeIngreso\",\"fechaIngresoAlCargo\",
		\"marcaParaLiquidar\",\"idEmpleado\",\"idPuesto\",\"idPlantaDePersonal\", \"idGrupoDePersonal\", \"idFuncionDePersonal\", \"idGrupoDeLiquidacion\",
		\"idSituacionDelEmpleado\",\"idMotivoDeIngreso\",\"fechaVersionDesde\", \"idCategoria\",observaciones,\"creadoPorId\",\"activadoPorId\"
        ) VALUES (
          true,'{$ahora}','{$ahora}', {$legajo}, {$cargo}, '{$fechacateg}','{$fechacateg}',
          'X',{$IdEmpleado}, $IdPuesto, $IdPlantaDePersonal, $IdGrupoDePersonal, $IdFuncionDePersonal, $IdGrupoDeLiquidacion,
          $IdSituacionDelEmpleado,$IdMotivoDeIngreso, '{$fechacateg}', $idCategoria, '', -1, -1
        )" ;
    $datos=DB_query( $sql, $db );
}
