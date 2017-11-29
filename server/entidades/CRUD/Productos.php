<?php
class Productos
{
   public $idProductos;
   public $nombre;
   public $marca;
   public $precio;
   public $idTipoProducto;

   function __construct(int $idProductos,string $nombre,string $marca,float $precio,int $idTipoProducto){
      $this->idProductos = $idProductos;
      $this->nombre = $nombre;
      $this->marca = $marca;
      $this->precio = $precio;
      $this->idTipoProducto = $idTipoProducto;
   }
}
?>