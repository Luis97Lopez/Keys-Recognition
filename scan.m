% UASLP     FACULTAD DE INGENIERÍA    VISIÓN COMPUTACIONAL
% Proyecto : Reconocedor de llaves
% Autores:        Luis Alberto López Romero
%                 Axel López Rodríguez
% Fecha:        26 de marzo del 2021
% Descripción:  El siguiente código realiza el proceso de Slit Scanning 
%               al video que le indiquemos. Los valores resultados se guardan
%               en un arreglo de resultados para posteriormente analizarse.

function results = scan(videoEntrada)
  pkg load video;
  
  % Variables modificables
  altoDeLineas = 7;
  
  % Se lee el video y se obtienen los datos necesarios.
  nFrames             = size(videoEntrada)(2);
  vidHeight           = size(videoEntrada(1).frame)(1);
  vidWidth            = size(videoEntrada(1).frame)(2);
  
  % La coordenadaY inicial donde se leerá cada barra de cada frame.
  % Caso default se escoge el pixel de la mitad del video.
  coordenadaY         = floor(vidHeight*0.5);
  
  % Vamos a guardar los resultados de la diferencia de las barras
  results(1:nFrames-1) = 0;
  
  % Guardamos el primer recuadro del primer frame
  prev = videoEntrada(1).frame(coordenadaY:coordenadaY+altoDeLineas, :,:);
  
  % Hacemos un ciclo con los demás frames
  for iFrame       = 2:nFrames
      % Obtenemos el recuadro del iFrame
      actual = videoEntrada(iFrame).frame...
                (coordenadaY:coordenadaY+altoDeLineas, :,:);
               
      % Almacenamos la desviación estándar de cada uno de los RGB.
      results(iFrame-1) = mean(std(std(prev-actual)));
      
      % Actualizamos el previo frame
      prev = actual;
  end
endfunction
