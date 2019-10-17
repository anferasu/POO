Algoritmo sin_titulo
	num1 <- 0
	Definir resultado Como Caracter
	Escribir 'Digite una nota entre 0 a 10'
	Leer num1
	Si num1>=0 Y num1<3 Entonces
		resultado <- 'muy deficiente'
	SiNo
		Si num1>=3 Y num1<5 Entonces
			resultado <- 'suspenso'
		SiNo
			Si num1>=5 Y num1<6 Entonces
				resultado <- 'suficiente'
			SiNo
				Si num1>=6 Y num1<7 Entonces
					resultado <- 'bien'
				SiNo
					Si num1>=7 Y num1<9  Entonces
						resultado <- 'notable'
					SiNo
						resultado <- 'sobresaliente'
					FinSi
				FinSi
			FinSi
		FinSi
	FinSi
	Escribir 'La nota es: ' resultado
FinAlgoritmo

