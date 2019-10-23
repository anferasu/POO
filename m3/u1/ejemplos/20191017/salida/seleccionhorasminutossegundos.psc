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
	segu <- seg + 1
	Si segu>59 Entonces
		segu <- 0
		Si minutos>60 Entonces
			minutos <- 0
			horas <- horas + 1
		FinSi
	SiNo
		minutos <- minutos+1
	FinSi
	Escribir 'La hora es: ',horas,':',minutos,':',segu
FinAlgoritmo

