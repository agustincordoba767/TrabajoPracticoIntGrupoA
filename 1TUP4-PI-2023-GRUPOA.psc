Algoritmo _1TUP4_PI_2023_GRUPOA
	Definir opcMenu Como Entero
	Definir horariosCanchas, pausa Como Caracter
	Definir horaDeseada, posicionArreglo, respuestaBusqueda Como Entero
	Dimension horariosCanchas[13, 4] //Lo dimensiono de esta manera ya que el horario de las canchas es de 10am hasta 22pm
	posicionArreglo<- 0 //inicializo la posicion
	Repetir
		menu()
		Leer opcMenu
		Limpiar Pantalla
		Si (opcMenu<1) o (opcMenu>4) Entonces
			Escribir "!!!!Opcion incorrecta. Intente nuevamente!!!!"
		FinSi
		Segun opcMenu Hacer
			1: subMenu1(horariosCanchas, posicionArreglo)
			2: 
			3: 
			4:
			0:  Escribir "----------------------"
				Escribir "GRACIAS POR SU VISITA"
				Escribir "----------------------"
		FinSegun
	Mientras Que (opcMenu<>0)
	
	
	
	
FinAlgoritmo
/////////////////////////////////////////////////////////////////////////////////////////////////
SubProceso menu()
	Escribir "    *-*-*-*-*- BIENVENIDO -*-*-*-*-*"
	Escribir "------------------------------------"
	Escribir "   Menu principal |Futbol 5 GRUPO A|   "  //Subproceso para el bucle del menu
	Escribir "------------------------------------"
	Escribir "* 1- Carga | Modificacion de reservas"
	Escribir "* 2- Busqueda por Nombre reservado"
	Escribir "* 3- Ordenamiento por horario"
	Escribir "* 4- Cierre del dia"
	Escribir "* 0- Salir"
FinSubProceso
//////////////////////////////////////////////////////////////////////////////////////
SubProceso subMenu1(horariosCanchas, posicionArreglo)
	Definir opcSubmenu Como Entero
		Escribir "1- Cargar Reserva"
		Escribir "2- Modificar Reserva" //submenu para darle la opcion a modificar o cargar reserva
		Escribir "//Pulse cualquier otro numero para volver al menu principal\\"
		Leer opcSubmenu
	Si opcSubmenu==1 Entonces
		cargarReserva(horariosCanchas, posicionArreglo)
		Si opcSubmenu==2 Entonces
			//modificarReserva()
		FinSi
	FinSi
	Limpiar Pantalla
FinSubProceso
///////////////////////////////////////////////////////////////////////////
SubProceso cargarReserva(horariosCanchas, posicionArreglo)
	Si posicionArreglo<13 Entonces //valido que haya horarios disponibles
		Limpiar Pantalla
		Repetir
			Escribir "---/Los horarios de reserva son de 10AM hasta 22PM\---"
			Escribir "Ingrese el horario que desea reservar: " //Valido que la hora ingresada este dentro del rango
			Leer horaDeseada
		Mientras Que horaDeseada<10 o horaDeseada>22
		respuestaBusqueda<- busquedaPlanilla(horariosCanchas, 13, 0, horaDeseada) //invoco a la funcion para chequear si el horario fue ocupado
		Si respuestaBusqueda<>-1 Entonces
			Limpiar Pantalla
			Escribir "----------------------------"
			Escribir "-¡ATENCION!- Horario ocupado"
			Escribir "Ingrese cualquier tecla para continuar..."
			Leer pausa
			Limpiar Pantalla
		SiNo
			Limpiar Pantalla
			horariosCanchas[posicionArreglo, 0]<- ConvertirATexto(horaDeseada)
			Escribir "Ingrese un nombre de referencia: "   //continuo cargando el arreglo
			Leer horariosCanchas[posicionArreglo, 1]
			horariosCanchas[posicionArreglo, 1]<- Mayusculas(horariosCanchas[posicionArreglo,1]) //cargo los nombres con mayusculas
			Escribir "Ingrese un numero de telefono de referencia: "
			Leer horariosCanchas[posicionArreglo,2]
			Repetir
				Escribir "¿La cancha fue abonada? - Responda con <Si> o con <No>"
				Leer horariosCanchas[posicionArreglo,3]
				horariosCanchas[posicionArreglo, 3]<- Mayusculas(horariosCanchas[posicionArreglo, 3])
			Mientras que horariosCanchas[posicionArreglo,3]<>"SI" o horariosCanchas[posicionArreglo,3]<>"NO" //valido que el ingreso sea por si o por no
		FinSi
		posicionArreglo<- posicionArreglo+1
	Sino 
		Escribir "------------------------------"
		Escribir "-¡ATENCION- Horarios COMPLETOS"
		Escribir "Ingrese cualquier tecla para continuar..."
		Leer pausa
		Limpiar Pantalla
	FinSi
FinSubProceso
/////////////////////////////////////////////////////////////////////////
Funcion return<- busquedaPlanilla(arreglo, filas, columna,  elementoABuscar) //Funcion para buscar sobre el arreglo
	Definir i Como Entero;
	Definir elementoEncontrado Como Logico
	i<-0;
	elementoEncontrado <- Falso;
	Mientras i <= filas y no elementoEncontrado
		si elementoABuscar == ConvertirANumero(arreglo[i, columna]) Entonces
			elementoEncontrado <- Verdadero; 
		FinSi
		i <- i +1; 
	FinMientras
	Si elementoEncontrado Entonces
		return<- i
	Sino 
		return<- -1
	FinSi
FinFuncion
	