% UASLP     FACULTAD DE INGENIER�A    VISI�N COMPUTACIONAL
%                     RECOGNITION
% Autores:      Luis Alberto L�pez Romero
%               Axel L�pez Rodr�guez
% Fecha:        21 de abril del 2021
% Descripci�n:  Este archivo recibe una imagen con su respectiva m�scara
%               estas dos im�genes ya DEBEN de estar en escala de grises
%               y previamente preprocesadas.
%               Devolver� un arreglo con los puntos que reconoci�.
%               Par�metros:
%                   imagen:   escenario que se quiere reconocer
%                   mascara:  mascara u objeto que se quiere reconocer
%                   tipo:     "corr" realizar� la correlaci�n
%                             "conv" realizar� la convolusi�n
%                   gr�ficas: si se manda un true imprimir� las gr�ficas

function [value, point] = recognition(imagen, mascara, tipo, graficas = false)
  [n m] = size(imagen);
  [nM mM] = size(mascara);
  
  if(tipo == 'conv')
    % Se aplica el proceso de convolusi�n
    reconocimiento = imfilter(double(imagen), double(mascara));
    
    numPuntos = 1;
  elseif(tipo == 'corr')
  LK = 0.4;
  
##  Transformamos nuestra imagen y nuestro filtro al dominio de Fourier.
  fImg = KLaw_SpaceV(LK, imagen);
  fFiltroCorr = mascara;

    % Se aplica la correlaci�n
    reconocimiento = real(ifftshift(ifft2(fImg .* conj(fFiltroCorr) ./ abs(fFiltroCorr))));
    numPuntos = 1;
    
  else
    imgReconocida = [];
  endif
  
  % Si est� habilitado muestra las gr�ficas
  if(graficas)
    figure, mesh(reconocimiento);
  endif
  
  % Obtenemos el punto m�ximo y sus coordenadas
  point = struct('value' , 0, 'x', 0, 'y', 0);
  value = max(max(reconocimiento));
  [point.y point.x] = find(value == reconocimiento); 
end
