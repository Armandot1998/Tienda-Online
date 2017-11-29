<?php
class TipoProducto
{
   public $idTipoProducto;
   public $descripcion;

   function __construct(int $idTipoProducto,string $descripcion){
      $this->idTipoProducto = $idTipoProducto;
      $this->descripcion = $descripcion;
   }
}
?>