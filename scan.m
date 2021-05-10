% UASLP     FACULTAD DE INGENIERÍA    VISIÓN COMPUTACIONAL
%             SLIT SCANNING
% Autor:        Luis Alberto López Romero
% Fecha:        3 de marzo del 2021
% Descripción:  El siguiente código realiza el proceso de Slit Scanning 
%               al video que le indiquemos.
%               Lo que se hace es tomar de cada Frame una barra de tamaño que 
%               se le indique (por default es 3) y pegar todas las barras en 
%               una imagen de tamaño:
%                   height X (numeroDeFrames * anchoDeLineas)

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
  
  % Hacemos un ciclo con los dem�s frames
  for iFrame       = 2:nFrames
      % Obtenemos el recuadro del iFrame
      actual = videoEntrada(iFrame).frame...
                (coordenadaY:coordenadaY+altoDeLineas, :,:);
               
      % Almacenamos la desviaci�n est�ndar de cada uno de los RGB.
      results(iFrame-1) = mean(std(std(prev-actual)));
      
      % Actualizamos el previo frame
      prev = actual;
  end
endfunction
