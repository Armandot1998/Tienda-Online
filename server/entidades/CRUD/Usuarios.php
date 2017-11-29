<?php
class Usuarios
{
   public $idUsuarios;
   public $nombres;
   public $apellidos;
   public $cedula;
   public $correo;
   public $contraseÃ±a;
   public $idCargo;

   function __construct(int $idUsuarios,string $nombres,string $apellidos,int $cedula,string $correo,string $contraseÃ±a,int $idCargo){
      $this->idUsuarios = $idUsuarios;
      $this->nombres = $nombres;
      $this->apellidos = $apellidos;
      $this->cedula = $cedula;
      $this->correo = $correo;
      $this->contraseÃ±a = $contraseÃ±a;
      $this->idCargo = $idCargo;
   }
}
?>