% UASLP     FACULTAD DE INGENIER�A    VISI�N COMPUTACIONAL
%                     READ VIDEO
% Autores:      Luis Alberto L�pez Romero
%               Axel L�pez Rodr�guez
% Fecha:        21 de abril del 2021
% Descripci�n:  Funci�n que recibe una ruta de un v�deo y devuelve un arreglo
%               de frames del video.


function videoEntrada = read_video(archivoDeVideo)
  pkg load video;
  
  % Se lee el video y se obtienen los datos necesarios.
  videoObj            = VideoReader(archivoDeVideo);
  nFrames             = videoObj.NumberOfFrames
  vidHeight           = videoObj.Height;
  vidWidth            = videoObj.Width;
  % Creamos el Arreglo de Frames del video.
  videoEntrada(1:nFrames) = struct('frame', zeros(vidHeight, vidWidth, 3, 'uint8'));
  
  % Leemos cada Frame uno por uno y lo almacenamos en nuestro arreglo de Frames.
  for iFrames = 1:nFrames
    videoEntrada(iFrames).frame = readFrame(videoObj);
  end
endfunction
 
