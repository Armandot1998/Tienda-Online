<?php
include_once('../controladores/ControladorBase.php');
include_once('../entidades/CRUD/Usuarios.php');
class ControladorUsuarios extends ControladorBase
{
   function crear(Usuarios $usuarios)
   {
      $sql = "INSERT INTO Usuarios (idUsuarios,nombres,apellidos,cedula,correo,contraseÃ±a,idCargo) VALUES (?,?,?,?,?,?,?);";
      $parametros = array($usuarios->idUsuarios,$usuarios->nombres,$usuarios->apellidos,$usuarios->cedula,$usuarios->correo,$usuarios->contraseÃ±a,$usuarios->idCargo);
      $respuesta = $this->conexion->ejecutarConsulta($sql,$parametros);
      if(is_null($respuesta[0])){
         return true;
      }else{
         return false;
      }
   }

   function actualizar(Usuarios $usuarios)
   {
      $parametros = array($usuarios->idUsuarios,$usuarios->nombres,$usuarios->apellidos,$usuarios->cedula,$usuarios->correo,$usuarios->contraseÃ±a,$usuarios->idCargo,$usuarios->id);
      $sql = "UPDATE Usuarios SET idUsuarios = ?,nombres = ?,apellidos = ?,cedula = ?,correo = ?,contraseÃ±a = ?,idCargo = ? WHERE id = ?;";
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
      $sql = "DELETE FROM Usuarios WHERE id = ?;";
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
         $sql = "SELECT * FROM Usuarios;";
      }else{
      $parametros = array($id);
         $sql = "SELECT * FROM Usuarios WHERE id = ?;";
      }
      $respuesta = $this->conexion->ejecutarConsulta($sql,$parametros);
      return $respuesta;
   }

   function leer_paginado($pagina,$registrosPorPagina)
   {
      $desde = (($pagina-1)*$registrosPorPagina);
      $sql ="SELECT * FROM Usuarios LIMIT $desde,$registrosPorPagina;";
      $respuesta = $this->conexion->ejecutarConsulta($sql,$parametros);
      return $respuesta;
   }

   function numero_paginas($registrosPorPagina)
   {
      $sql ="SELECT IF(ceil(count(*)/$registrosPorPagina)>0,ceil(count(*)/$registrosPorPagina),1) as 'paginas' FROM Usuarios;";
      $respuesta = $this->conexion->ejecutarConsulta($sql,$parametros);
      return $respuesta[0];
   }

   function leer_filtrado(string $nombreColumna, string $tipoFiltro, string $filtro)
   {
      switch ($tipoFiltro){
         case "coincide":
            $parametros = array($filtro);
            $sql = "SELECT * FROM Usuarios WHERE $nombreColumna = ?;";
            break;
         case "inicia":
            $sql = "SELECT * FROM Usuarios WHERE $nombreColumna LIKE '$filtro%';";
            break;
         case "termina":
            $sql = "SELECT * FROM Usuarios WHERE $nombreColumna LIKE '%$filtro';";
            break;
         default:
            $sql = "SELECT * FROM Usuarios WHERE $nombreColumna LIKE '%$filtro%';";
            break;
      }
      $respuesta = $this->conexion->ejecutarConsulta($sql,$parametros);
      return $respuesta;
   }
}