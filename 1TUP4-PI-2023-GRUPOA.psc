Algoritmo _1TUP4_PI_2023_GRUPOA
	Definir opcMenu Como Entero
	
	Repetir
		menu()
		Leer opcMenu
		Limpiar Pantalla
		Si (opcMenu<1) o (opcMenu>4) Entonces
			Escribir "!!!!Opcion incorrecta. Intente nuevamente!!!!"
		FinSi
		Segun opcMenu Hacer
			1: subMenu1()
			2: 
			3: 
			4:
			0:  Escribir "----------------------"
				Escribir "GRACIAS POR SU VISITA"
				Escribir "----------------------"
		FinSegun
	Mientras Que (opcMenu<>0)
	
	
	
	
FinAlgoritmo

SubProceso menu()
	Escribir "    *-*-*-*-*- BIENVENIDO -*-*-*-*-*"
	Escribir "------------------------------------"
	Escribir "   Menu principal |Futbol 5 GRUPO A|   "
	Escribir "------------------------------------"
	Escribir "* 1- Carga | Modificacion de reservas"
	Escribir "* 2- Busqueda por Nombre reservado"
	Escribir "* 3- Ordenamiento por horario"
	Escribir "* 4- Cierre del dia"
	Escribir "* 0- Salir"
FinSubProceso
SubProceso subMenu1()
	Definir opcSubmenu Como Entero
	Repetir
		Escribir "1- Cargar Reserva"
		Escribir "2- Modificar Reserva"
		Escribir "//Pulse cualquier otro numero para volver al menu principal\\"
		Leer opcSubmenu
	Mientras Que (opcSubmenu<>1) o (opcSubmenu<>2) 
	Si opcSubmenu==1 Entonces
		cargarReserva()
		Si opcSubmenu==2 Entonces
			modificarReserva()
		FinSi
	FinSi
FinSubProceso

	