%   UASLP     FACULTAD DE INGENIERÍA    VISIÓN COMPUTACIONAL
%   Proyecto : Reconocedor de llaves
%   Autores:      Luis Alberto López Romero
%                 Axel López Rodríguez
%   Fecha:        17 de Mayo del 2021
%   Descripción:  Este script es el menú principal de nuestro proyecto.
%   Profesor: Dr. Martínez Pérez Francisco Eduardo

## Se limpia el buffer de memoria
  clear all                                                                                                                                 
## Se limpia la consola
  clc
## Se hace el proceso para escribir las máscaras  
  writeMascaras;
## Se empieza la carga de los videos en memoria
  fprintf("Leyendo videos...\n");
  videos = read_all_videos();
  fprintf("Se han cargado los videos!!\n");  
  %% Bandera que determina si el programa todavía sigue corriendo
  running = true;
##  Ciclo que seguirá hasta que no se presione un cero
while (running)
  clc  
  fprintf("-------------- RECONOCEDOR DE LLAVES  ----------------- \n\n");   
  fprintf("\tElige un Video: \n");  
  fflush (stdout);
##  Se muestra un menú de opciones de videos y se lee la opción seleccionada
  option = input(" ...
  \t 11) Video 11 \n   ...     
  \t 12) Video 12 \n   ...
  \t 13) Video 13 \n   ...      
  \t 14) Video 14 \n   ...
  \t 15) Video 15 \n   ...     
  \t 16) Video 16 \n   ...
  \t 17) Video 17 \n   ...     
  \t 18) Video 18 \n   ...
  \t 19) Video 19 \n   ...
  \t 20) Video 20 \n   ...
  \t  0) Cerrar Programa\n ...
  ");
##  Si la opción es 0 se cierra el programa
  if(option == 0)
  running = false;
  elseif(option == 20)
##  Si se seleccionó la opción 20 se carga el último video
  prueba(videos(10).video,1);
else 
## SI no se seleccionó la 20 entonces lo que se hace es cargar el video 
## seleccionado usando el arreglo de videos, el cálculo para saber que video es 
## se realiza obteniendo el módulo de la opción entre 10.
  indice = mod(option,10);
  escenario = 0;
##  Si el indice es mayor a 5 entonces se tratan de los videos de Luis
  if(indice > 5)
    escenario = 1;
  else
## Si el indice es menor a 5 entonces se tratan de los videos de Axel
    escenario = 2;
  endif
##  Se manda a llamar a la función prueba con el video seleccionado y el 
##  escenario 
  prueba(videos(indice).video, escenario);
endif  
## Se muestra en pantalla que presione una tecla para limpiar el menú y volver
## a mostrar las opciones
if(running)
  printf("PRESIONE UNA TECLA PARA CONTINUAR\n");
##  Se lee cualquier tecla
  kbhit();
##  Se cierran todas las figuras abiertas en Octave
  close all;
endif
endwhile  

