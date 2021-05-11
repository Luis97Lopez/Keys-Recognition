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
    % Creamos el filtro de correlaci�n (imagen ampliada).
    missingSizes = [ floor((n - nM)/2), floor((m - mM)/2)];
    filtroCorr = padarray(mascara, missingSizes);

    [nF mF] = size(filtroCorr);

    % Si el tama�o era impar le va a faltar un rengl�n de puros ceros
    if(nF < n)
      filtroCorr = [filtroCorr; zeros(1, mF)];
      nF += 1;
    endif
    
    % Si el tama�o era impar le va a faltar una columna de puros ceros
    if(mF < m)
      filtroCorr = [filtroCorr, zeros(nF, 1)];
      mF += 1;
    endif
    
    
    % Transformamos nuestra imagen y nuestro filtro al dominio de Fourier.
    fImg = fft2(imagen);
    fFiltroCorr = fft2(filtroCorr);

    % Se aplica la correlaci�n
    reconocimiento = real(ifftshift(ifft2(fImg .* conj(fFiltroCorr) ./ abs(fFiltroCorr))));
    numPuntos = 1;
    
  else
    imgReconocida = [];
    return
  endif
  
  % Si est� habilitado muestra las gr�ficas
  if(graficas)
    figure, mesh(reconocimiento);
  endif
  
  % Obtenemos el punto m�ximo y sus coordenadas
  point = struct('value',0, 'x', 0, 'y', 0);
  value = max(max(reconocimiento));
  [point.y point.x] = find(value == reconocimiento);
  
##  % Ordenamos a los puntos de mayor a menor
##  vectorFiltrado = reshape(reconocimiento, [],1);
##  vectorFiltrado = sort(vectorFiltrado, 'descend');
##
##  % Creamos la estructura con los puntos que almacenaremos
##  points(1:numPuntos) = struct('x', 0, 'y', 0);
##  
##  % Para cada punto se le va a imprimir un cuadrado de 3x3 en la imagen
##  for i=1:numPuntos
##
##      [_y, _x] = find(vectorFiltrado(i) == reconocimiento);
##      points(i).x = (_x);
##      points(i).y = (_y);
##      
##  end
    
##  figure, plot(vectorFiltrado, "g");

end
