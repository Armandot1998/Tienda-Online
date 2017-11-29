<?php
include_once('../routers/RouterBase.php');
include_once('../routers/RouterFuncionalidadesEspecificas.php');
function cargarRouters() {
   define("routersPath", "../routers/");
   $files = glob(routersPath."CRUD/*.php");
   foreach ($files as $filename) {
      include_once($filename);
   }
}
cargarRouters();

class RouterPrincipal extends RouterBase
{
   function route(){
      switch(strtolower($this->datosURI->controlador)){
         case "cargo":
            $routerCargo = new RouterCargo();
            return json_encode($routerCargo->route());
            break;
         case "detalledefactura":
            $routerDetalleDeFactura = new RouterDetalleDeFactura();
            return json_encode($routerDetalleDeFactura->route());
            break;
         case "factura":
            $routerFactura = new RouterFactura();
            return json_encode($routerFactura->route());
            break;
         case "productos":
            $routerProductos = new RouterProductos();
            return json_encode($routerProductos->route());
            break;
         case "tipoproducto":
            $routerTipoProducto = new RouterTipoProducto();
            return json_encode($routerTipoProducto->route());
            break;
         case "usuarios":
            $routerUsuarios = new RouterUsuarios();
            return json_encode($routerUsuarios->route());
            break;
         default:
            $routerEspeficias = new RouterFuncionalidadesEspecificas();
            return $routerEspeficias->route();
            break;
      }
   }
}
