Algoritmo _1TUP4_PI_2023_GRUPOA
	Definir opcMenu Como Entero
	Definir horariosCanchas, pausa Como Caracter
	Definir posicionArreglo, respuestaBusqueda Como Entero
	Dimension horariosCanchas[13, 4] //Lo dimensiono de esta manera ya que el horario de las canchas es de 10am hasta 22pm
	posicionArreglo<- 0 //inicializo la posicion
	Repetir
		menu()
		Leer opcMenu
		Limpiar Pantalla
		Si (opcMenu<0) o (opcMenu>4) Entonces
			Escribir "!!!!Opcion incorrecta. Intente nuevamente!!!!"
		FinSi
		Segun opcMenu Hacer
			1: cargarReserva(horariosCanchas, posicionArreglo)
				posicionArreglo<- posicionArreglo+1
			2: subMenu2(horariosCanchas, posicionArreglo)
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
	Escribir "* 1- Carga de reservas"
	Escribir "* 2- Busqueda | Modificar -> Por nombre"
	Escribir "* 3- Ordenamiento por horario"
	Escribir "* 4- Cierre del dia"
	Escribir "* 0- Salir"
FinSubProceso
//////////////////////////////////////////////////////////////////////////////////////
SubProceso subMenu2(horariosCanchas, posicionArreglo)
	Definir opcSubmenu, rtasubmenu2 Como Entero
	Definir nombreAbuscar Como Caracter
	Escribir "                 ______________________"
	Escribir "                |#BUSQUEDA DE RESERVAS#|"
	Escribir "                 ----------------------"
	Escribir "--------------------------------------------------------------"
	Repetir
		Escribir "1- Modificar Reserva" //Doy opcion a modificar o visualizar la reserva a buscar
		Escribir "2- Buscar Reserva"
		Leer rtasubmenu2
		Limpiar Pantalla
	Mientras que rtasubmenu2<1 o rtasubmenu2>2 //valido el ingreso
	Escribir "Ingrese el nombre a buscar: "
	Leer nombreAbuscar
	nombreAbuscar<- Mayusculas(nombreAbuscar) //invoco la funcion para encontrar la reserva
	respuestaBusqueda<- busquedaPlanilla(horariosCanchas, 12, 1, nombreAbuscar)
	Si respuestaBusqueda<>-1 Entonces
		Si rtasubmenu2==1 Entonces
			Escribir "Datos a modificar"
			Escribir "  HORARIO", "  ", "NOMBRE", "    ", "NUMERO", "     ", "ABONO" //muestro la reserva encontrada
			Escribir  "   ", horariosCanchas[respuestaBusqueda-1, 0], "     ", horariosCanchas[respuestaBusqueda-1,1], "   ", horariosCanchas[respuestaBusqueda-1,2], "   ", horariosCanchas[respuestaBusqueda-1,3]// le resto uno ya que devuelve la posicion siguiente del arreglo
			cargarReserva(horariosCanchas, respuestaBusqueda-1)
		SiNo
			Escribir "  HORARIO", "  ", "NOMBRE", "    ", "NUMERO", "     ", "ABONO" //muestro la reserva encontrada
			Escribir  "   ", horariosCanchas[respuestaBusqueda-1, 0], "     ", horariosCanchas[respuestaBusqueda-1,1], "   ", horariosCanchas[respuestaBusqueda-1,2], "   ", horariosCanchas[respuestaBusqueda-1,3]// le resto uno ya que devuelve la posicion siguiente del arreglo
			Escribir "Pulse cualquier tecla para continuar..."
			Leer pausa
			Limpiar Pantalla
		FinSi
	SiNo
		Limpiar Pantalla
		Escribir "-No ha sido encontrado el nombre solicitado-"
		Escribir "Pulse cualquier tecla para continuar..."
		Leer pausa
		Limpiar Pantalla
	FinSi
FinSubProceso
///////////////////////////////////////////////////////////////////////////
SubProceso cargarReserva(horariosCanchas, posicionArreglo)
	Definir horaDeseada Como Entero
	Si posicionArreglo<13 Entonces //valido que haya horarios disponibles
		Limpiar Pantalla
		Repetir
			Limpiar Pantalla
			Escribir "                ____________________"
			Escribir "                |#CARGA DE RESERVAS#|"
			Escribir "                --------------------"
			Escribir "---*Los horarios de reserva son de 10AM hasta 22PM*---"
			Escribir "----------------------------------------------------------------------"
			Escribir "Ingrese el horario que desea reservar: " //Valido que la hora ingresada este dentro del rango
			Leer horaDeseada
		Mientras Que horaDeseada<10 o horaDeseada>22
		respuestaBusqueda<- busquedaPlanilla(horariosCanchas, 12, 0, ConvertirATexto(horaDeseada))//invoco a la funcion para chequear si el horario fue ocupado
		Si respuestaBusqueda<>-1 Entonces
			Limpiar Pantalla
			Escribir "----------------------------"
			Escribir "-¡ATENCION!- Horario ocupado-"
			Escribir "Pulse cualquier tecla para continuar..."
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
			Mientras que horariosCanchas[posicionArreglo,3]<>"SI" y horariosCanchas[posicionArreglo,3]<>"NO" //valido que el ingreso sea por si o por no
		FinSi
		Limpiar Pantalla
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
		si elementoABuscar == arreglo[i, columna] Entonces
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
/////////////////////////////////////////////////////////////////////////////

	