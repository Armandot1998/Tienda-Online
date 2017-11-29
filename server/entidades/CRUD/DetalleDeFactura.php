<?php
class DetalleDeFactura
{
   public $idDetalleDeFactura;
   public $cantidad;
   public $idProductos;

   function __construct(int $idDetalleDeFactura,int $cantidad,int $idProductos){
      $this->idDetalleDeFactura = $idDetalleDeFactura;
      $this->cantidad = $cantidad;
      $this->idProductos = $idProductos;
   }
}
?>