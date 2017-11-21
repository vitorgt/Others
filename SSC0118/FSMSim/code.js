 $(document).ready(function(){

	$( ".btn" ).click(function() {
		
		var tipoEstado = parseInt($("input[name='tipo']:checked").val());
		var qtdEstados = parseInt($("option:selected").val());
		var qtdEntradas = parseInt($("input[name='qtdEntrada']").val());
		var qtdSaidas = parseInt($("input[name='qtdSaida']").val());
		
		var tp = "Mealy";
		if(tipoEstado == 1) tp = "Moore";
		qtdEstados++;
		
		//alert("Tipo: " + tp + " com " + qtdEstados + " estados, " + qtdEntradas +" entradas e " + qtdSaidas + " saidas");
		
		var bitsEstados = 1;
		
		if(qtdEstados != 1) {
			bitsEstados = parseInt(Math.ceil(Math.log2(qtdEstados)));
		}
		
		//alert("Bits para a representação de estado " + bitsEstados);
		
		var tabelaVerd = $("textarea[name='tabelaVerdade']").val();
		
		var vetorTop = tabelaVerd.replace( /\n/g, " " ).split(" ");
		
		alert(tabelaVerd + " " + vetorTop.length);
		
		var i;
		for(i=0;i<vetorTop.length;i++){
			alert(vetorTop[i]);
		}
		
		var numCol = bitsEstados*2 + qtdEntradas + qtdSaidas;
		var numLin = bitsEstados * 2^qtdEntradas;
		//var pos = j + i*numCol; //formula para achar a posicao da matriz para um vetor
		

		alert(numCol);


		
	});

});

