<?php
include_once('../controladores/ControladorBase.php');
include_once('../entidades/CRUD/DetalleDeFactura.php');
class ControladorDetalleDeFactura extends ControladorBase
{
   function crear(DetalleDeFactura $detalledefactura)
   {
      $sql = "INSERT INTO DetalleDeFactura (idDetalleDeFactura,cantidad,idProductos) VALUES (?,?,?);";
      $parametros = array($detalledefactura->idDetalleDeFactura,$detalledefactura->cantidad,$detalledefactura->idProductos);
      $respuesta = $this->conexion->ejecutarConsulta($sql,$parametros);
      if(is_null($respuesta[0])){
         return true;
      }else{
         return false;
      }
   }

   function actualizar(DetalleDeFactura $detalledefactura)
   {
      $parametros = array($detalledefactura->idDetalleDeFactura,$detalledefactura->cantidad,$detalledefactura->idProductos,$detalledefactura->id);
      $sql = "UPDATE DetalleDeFactura SET idDetalleDeFactura = ?,cantidad = ?,idProductos = ? WHERE id = ?;";
      $respuesta = $this->conexion->ejecutarConsulta($sql,$parametros);
      if(is_null($respuesta[0])){
         return true;
      }else{
         return false;
      }
   }

   function borrar(int $id)
   {
      $parametros = array($id);
      $sql = "DELETE FROM DetalleDeFactura WHERE id = ?;";
      $respuesta = $this->conexion->ejecutarConsulta($sql,$parametros);
      if(is_null($respuesta[0])){
         return true;
      }else{
         return false;
      }
   }

   function leer($id)
   {
      if ($id==""){
         $sql = "SELECT * FROM DetalleDeFactura;";
      }else{
      $parametros = array($id);
         $sql = "SELECT * FROM DetalleDeFactura WHERE id = ?;";
      }
      $respuesta = $this->conexion->ejecutarConsulta($sql,$parametros);
      return $respuesta;
   }

   function leer_paginado($pagina,$registrosPorPagina)
   {
      $desde = (($pagina-1)*$registrosPorPagina);
      $sql ="SELECT * FROM DetalleDeFactura LIMIT $desde,$registrosPorPagina;";
      $respuesta = $this->conexion->ejecutarConsulta($sql,$parametros);
      return $respuesta;
   }

   function numero_paginas($registrosPorPagina)
   {
      $sql ="SELECT IF(ceil(count(*)/$registrosPorPagina)>0,ceil(count(*)/$registrosPorPagina),1) as 'paginas' FROM DetalleDeFactura;";
      $respuesta = $this->conexion->ejecutarConsulta($sql,$parametros);
      return $respuesta[0];
   }

   function leer_filtrado(string $nombreColumna, string $tipoFiltro, string $filtro)
   {
      switch ($tipoFiltro){
         case "coincide":
            $parametros = array($filtro);
            $sql = "SELECT * FROM DetalleDeFactura WHERE $nombreColumna = ?;";
            break;
         case "inicia":
            $sql = "SELECT * FROM DetalleDeFactura WHERE $nombreColumna LIKE '$filtro%';";
            break;
         case "termina":
            $sql = "SELECT * FROM DetalleDeFactura WHERE $nombreColumna LIKE '%$filtro';";
            break;
         default:
            $sql = "SELECT * FROM DetalleDeFactura WHERE $nombreColumna LIKE '%$filtro%';";
            break;
      }
      $respuesta = $this->conexion->ejecutarConsulta($sql,$parametros);
      return $respuesta;
   }
}