<?php
include_once("../persistencia/DatosConexion.php");
class ConexionBaseDatos {
    private static $array = array();
    public static function DatosConexiones(){
        $array = array();
        $array[] = new DatosConexion("ConexionWeb", "sql313.byethost9.com", "b9_21140740", "b9_21140740_TiendaOnline", "Armandotelmo123");
        return $array;
    }
}