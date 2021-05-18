% UASLP     FACULTAD DE INGENIERÍA    VISIÓN COMPUTACIONAL
%                     RECOGNITION
% Autores:      Luis Alberto López Romero
%               Axel López Rodríguez
% Fecha:        21 de abril del 2021
% Descripción:  Este archivo recibe una imagen con su respectiva máscara
%               estas dos imágenes ya DEBEN de estar en escala de grises
%               y previamente preprocesadas.
%               Devolverá un arreglo con los puntos que reconoció.
%               Parámetros:
%                   imagen:   escenario que se quiere reconocer
%                   mascara:  mascara u objeto que se quiere reconocer
%                   tipo:     "corr" realizará la correlación
%                             "conv" realizará la convolusión
%                   gráficas: si se manda un true imprimirá las gráficas

function [value, point] = recognition(imagen, mascara, tipo, graficas = false)
  [n m] = size(imagen);
  [nM mM] = size(mascara);
  
  if(tipo == 'conv')
    % Se aplica el proceso de convolusión
    reconocimiento = imfilter(double(imagen), double(mascara));
    
    numPuntos = 1;
  elseif(tipo == 'corr')
  LK = 0.4;
  
##  Transformamos nuestra imagen y nuestro filtro al dominio de Fourier.
  fImg = KLaw_SpaceV(LK, imagen);
  fFiltroCorr = mascara;

    % Se aplica la correlación
    reconocimiento = real(ifftshift(ifft2(fImg .* conj(fFiltroCorr) ./ abs(fFiltroCorr))));
    numPuntos = 1;
    
  else
    imgReconocida = [];
  endif
  
  % Si está habilitado muestra las gráficas
  if(graficas)
    figure, mesh(reconocimiento);
  endif
  
  % Obtenemos el punto máximo y sus coordenadas
  point = struct('value' , 0, 'x', 0, 'y', 0);
  value = max(max(reconocimiento));
  [point.y point.x] = find(value == reconocimiento); 
end
