var urlWS = "";
$(document).ready(function(){
   urlWS = "http://localhost/sae/server/";
});

function leer(id){
    if(id==0){
        urltorequest = urlWS +"genero/leer";
    }else{
        urltorequest = urlWS +"genero/leer?id="+id;
    }
    $.ajax({
        type: "get",
        url: urltorequest,
        async:true,
        success:  function (respuesta) {
           toshow = JSON.parse(respuesta);
           cabeceraTabla = "<table class=\"table table-condensed\"><thead><tr><th>id</th><th>Descripcion</th></tr></thead><tbody>";
           pieTabla = "</tbody></table>";
           contenidoTabla = "";
           $(toshow).each(function(key,value){
                contenidoTabla=contenidoTabla+"<tr><td>"+value.id+"</td><td>"+value.descripcion+"</td></tr>";
           });
           document.getElementById("respuesta").innerHTML=cabeceraTabla+contenidoTabla+pieTabla;
        }
    });
}

function borrar(){
    
}

function crear(){
    
}

function actualizar(){
    
}