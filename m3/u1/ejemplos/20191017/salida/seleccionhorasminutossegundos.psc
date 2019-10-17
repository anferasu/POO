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
	Si segu>59 Entonces
		segundos <- 0
	SiNo
		segu <- 0
		minutos <- minutos+1
	FinSi
	Escribir 'La hora es: ',horas,':',minutos,':',segu
FinAlgoritmo

