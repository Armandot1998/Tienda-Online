var urlWS="";

$(document).ready(function(){
    var urlWS="http://172.16.0.9/segundo/Tienda-Online/server/";
});
function leer(){
    alert("esta leyendo");
    $.ajax({
        type: "get", 
        url: urlWS+"leer", 
        async: false, 
        success: function(respuesta) {
           toshow = JSON.parse(respuesta);
           cabeceraTabla = "<table class=\"table table-condensed"
           pieTabla = "</tobody></table>"
           contenidoTabla = ""
           $(tshow).each(function(key, value){
contenidoTabla=contenidoTabla + contenidoTabla
           })
           document.getElementById("respuesta").innerHTML=toshow[1].descripcion;
            
        }
    })

}
function borrar(){
alert("esta borrando");    
}

function crear(){
  alert("esta creabdo")      
}

function actualizar(){
  alert("esta actualizando")          
}

    
