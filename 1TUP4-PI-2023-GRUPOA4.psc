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
				posicionArreglo<- posicionArreglo+1//incremento el contador solo en el menu de carga de reservas
			2: subMenu2(horariosCanchas, posicionArreglo)
			3: listadoOrdenado(horariosCanchas, 0, 12)
			4:
			0:  Escribir "----------------------"
				Escribir "GRACIAS POR SU VISITA"
				Escribir "----------------------"
		FinSegun
	Mientras Que (opcMenu<>0)
FinAlgoritmo
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
SubProceso menu()
	Escribir "    *-*-*-*-*- BIENVENIDO -*-*-*-*-*"
	Escribir "------------------------------------"
	Escribir "   Menu principal |Futbol 5 GRUPO A|   "  //Subproceso para el bucle del menu
	Escribir "------------------------------------"
	Escribir "* 1- Carga de reservas"
	Escribir "* 2- Busqueda | Modificar -> Por nombre"
	Escribir "* 3- Listado ordenado por horario"
	Escribir "* 4- Saldos pendientes-Cierre del dia"
	Escribir "* 0- Salir"
FinSubProceso
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
SubProceso subMenu2(horariosCanchas, posicionArreglo)
	Definir opcSubmenu, rtasubmenu2, i, rta Como Entero
	Definir nombreAbuscar Como Caracter
	Escribir "                 ______________________"
	Escribir "                |#BUSQUEDA DE RESERVAS#|"
	Escribir "                 ----------------------"
	Escribir "----------------------------------------------------------------------"
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
	Limpiar Pantalla
	Si respuestaBusqueda<>-1 Entonces
		Si rtasubmenu2==1 Entonces
			Escribir "-------Datos a modificar"
			Escribir "  HORARIO", "  ", "NOMBRE", "    ", "NUMERO", "     ", "ABONO" //muestro la reserva encontrada
			Escribir  "   ", horariosCanchas[respuestaBusqueda-1, 0], "     ", horariosCanchas[respuestaBusqueda-1,1], "   ", horariosCanchas[respuestaBusqueda-1,2], "   ", horariosCanchas[respuestaBusqueda-1,3]// le resto uno ya que devuelve la posicion siguiente del arreglo
			horariosCanchas[respuestaBusqueda-1,0]<- " "
			horariosCanchas[respuestaBusqueda-1,1]<- " "
			horariosCanchas[respuestaBusqueda-1,2]<- " "
			horariosCanchas[respuestaBusqueda-1,3]<- " "
			Escribir  "   ", horariosCanchas[respuestaBusqueda-1, 0], "     ", horariosCanchas[respuestaBusqueda-1,1], "   ", horariosCanchas[respuestaBusqueda-1,2], "   ", horariosCanchas[respuestaBusqueda-1,3]
			Escribir "-ATENCION -> La reserva a modificar ha sido vaciada-"
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
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
SubProceso cargarReserva(horariosCanchas, posicionArreglo)
	Definir horaDeseada Como Entero
	Si posicionArreglo<13 Entonces //valido que haya horarios disponibles
		Repetir
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
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
SubProceso listadoOrdenado(array, columna, n)//Realizo el ordenamiento en base al horario
	Definir aux Como Caracter //variable auxiliar para mover el arreglo
	Definir i, j, k, auxNumerica1, auxNumerica2 Como Entero
	para i<-0 hasta n-2 Hacer 
		para j<-i+1 hasta n-1 Hacer 
			auxNumerica1<- ConvertirANumero(array[i,columna])
			auxNumerica2<- ConvertirANumero(array[j,columna]) //convierto a numero para hacer la comparativa
			si auxNumerica1>auxNumerica2 Entonces
				Para k<-0 Hasta 3 Hacer
					aux <- array[i, k]
					array[i,k]<- array[j,k]
					array[j,k]<- aux
				FinPara
			FinSi
		FinPara
	FinPara
	Escribir "                 ___________________"
	Escribir "                |#LISTADO ORDENADO#|"
	Escribir "                 -------------------"
	Escribir "----------------------------------------------------------------------"
	Escribir "  HORARIO", "  ", "NOMBRE", "    ", "NUMERO", "     ", "ABONO"
	Escribir "**********************************************************************"
	Para i<-0 Hasta 12 Hacer
		Si array[i,3]=="SI" o array[i,3]=="NO" Entonces
			Escribir  "   ", array[i, 0], "     ", array[i,1], "   ", array[i,2], "   ", array[i,3]
		FinSi
	FinPara
	Escribir "Pulse cualquier tecla para continuar..."
	Leer pausa
	Limpiar Pantalla
FinSubProceso
	