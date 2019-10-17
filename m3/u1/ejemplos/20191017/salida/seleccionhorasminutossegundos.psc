Algoritmo sin_titulo
	horas <- 0
	minutos <- 0
	segu <- 0
	Escribir 'Digitar horas'
	Leer horas
	Escribir 'Digitar minutos'
	Leer minutos
	Escribir 'Digitar segundos'
	Leer segu
	segu <- segu+1
	Si segu>59 Entonces
		segu <- 0
		minutos <- minutos+1
	FinSi
	Si minutos>59 Entonces
		minutos <- minutos - 60
		horas <- horas+1
	FinSi
	Si horas>12 Entonces
		horas <- horas -12
		horas <- horas
	FinSi
	Escribir 'La hora es: ',horas,':',minutos,':',segu
FinAlgoritmo

