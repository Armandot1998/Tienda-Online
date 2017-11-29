<?php
class Cargo
{
   public $idCargo;
   public $cargo;

   function __construct(int $idCargo,string $cargo){
      $this->idCargo = $idCargo;
      $this->cargo = $cargo;
   }
}
?>