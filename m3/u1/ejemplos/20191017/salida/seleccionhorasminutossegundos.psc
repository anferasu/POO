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
<<<<<<< HEAD
	segu <- seg + 1
=======
	segu <- segu+1
>>>>>>> f7487fd510089ee336396c08747442a6250ef699
	Si segu>59 Entonces
		segu <- 0
		Si minutos>60 Entonces
			minutos <- 0
			horas <- horas + 1
		FinSi
	SiNo
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

