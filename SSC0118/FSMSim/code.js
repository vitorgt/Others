 $(document).ready(function(){

	$( ".btn" ).click(function() {
		
		var tipoEstado = $("input[name='tipo']:checked").val();
		var qtdEstados = parseInt($("option:selected").val());
		var qtdEntradas = $("input[name='qtdEntrada']").val();
		var qtdSaidas = $("input[name='qtdSaida']").val();
		
		var tp = "Mealy";
		if(tipoEstado == 1) tp = "Moore";
		qtdEstados++;
		
		alert("Tipo: " + tp + " com " + qtdEstados + " estados, com " + qtdEntradas +" entadas e com " + qtdSaidas + " saidas");
	});

});
