% UASLP     FACULTAD DE INGENIER脥A    VISI脫N COMPUTACIONAL
%             SLIT SCANNING
% Autor:        Luis Alberto L贸pez Romero
% Fecha:        3 de marzo del 2021
% Descripci贸n:  El siguiente c贸digo realiza el proceso de Slit Scanning 
%               al video que le indiquemos.
%               Lo que se hace es tomar de cada Frame una barra de tama帽o que 
%               se le indique (por default es 3) y pegar todas las barras en 
%               una imagen de tama帽o:
%                   height X (numeroDeFrames * anchoDeLineas)

function results = scan(videoEntrada)
  pkg load video;
  
  % Variables modificables
  altoDeLineas = 7;
  
  % Se lee el video y se obtienen los datos necesarios.
  nFrames             = size(videoEntrada)(2);
  vidHeight           = size(videoEntrada(1).frame)(1);
  vidWidth            = size(videoEntrada(1).frame)(2);
  
  % La coordenadaY inicial donde se leer谩 cada barra de cada frame.
  % Caso default se escoge el pixel de la mitad del video.
  coordenadaY         = floor(vidHeight*0.5);

  % Calcula la posici贸n de cada frame en la imagen final.
##  topIdx                = 1:altoDeLineas:(altoDeLineas*(nFrames));
##  bottomIdx             = topIdx + altoDeLineas;
  
##  fprintf('Slit-scanning processing...\n');
  
  % Vamos a guardar los resultados de la diferencia de las barras
  results(1:nFrames-1) = 0;
  
  % Guardamos el primer recuadro del primer frame
  prev = videoEntrada(1).frame(coordenadaY:coordenadaY+altoDeLineas, :,:);
  
  % Hacemos un ciclo con los dem醩 frames
  for iFrame       = 2:nFrames
      % Obtenemos el recuadro del iFrame
      actual = videoEntrada(iFrame).frame...
                (coordenadaY:coordenadaY+altoDeLineas, :,:);
               
      % Almacenamos la desviaci髇 est醤dar de cada uno de los RGB.
      results(iFrame-1) = mean(std(std(prev-actual)));
      
      % Actualizamos el previo frame
      prev = actual;
  end
  
##  fprintf('Slit-scanning done!\n');

endfunction
