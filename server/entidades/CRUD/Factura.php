<?php
class Factura
{
   public $idFactura;
   public $fecha;
   public $idDetalleDeFactura;
   public $UsuariosidUsuarios;

   function __construct(int $idFactura,date $fecha,int $idDetalleDeFactura,int $UsuariosidUsuarios){
      $this->idFactura = $idFactura;
      $this->fecha = $fecha;
      $this->idDetalleDeFactura = $idDetalleDeFactura;
      $this->UsuariosidUsuarios = $UsuariosidUsuarios;
   }
}
?>