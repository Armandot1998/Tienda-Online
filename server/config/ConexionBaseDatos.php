<?php
include_once("../persistencia/DatosConexion.php");
class ConexionBaseDatos {
    private static $array = array();
    public static function DatosConexiones(){
        $array = array();
        $array[] = new DatosConexion("ConexionWeb", "sql313.byethost9.com","b9_21140740_TiendaOnline", "b9_21140740",  "Armandotelmo123");
        return $array;
    }
}