  clear all                                                                                                                                 clear all 
  clc
  fprintf("Leyendo videos...\n");
  videos = read_all_videos();
  fprintf("Se han cargado los videos!!\n");
  %% Se limpia el contenido de la memoria de Octave
  
  %% Se limpia la consola
  
  %% Bandera que determina si el programa todavía sigue corriendo
  running = true;
  
while (running)
  clc  
  fprintf("-------------- RECONOCEDOR DE LLAVES  ----------------- \n\n");   
  fprintf("\tElige un Video: \n");  
  fflush (stdout);
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
  if(option == 0)
  running = false;
  elseif(option == 20)
  prueba(videos(10).video,1);
else 
  indice = mod(option,10);
  escenario = 0;
  if(indice > 5)
    escenario = 1;
  else
    escenario = 2;
  endif
  prueba(videos(indice).video, escenario);
endif  
if(running)
  printf("PRESIONE UNA TECLA PARA CONTINUAR\n");
  kbhit();
endif
endwhile  

