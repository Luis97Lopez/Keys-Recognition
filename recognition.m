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
    % Creamos el filtro de correlación (imagen ampliada).
    missingSizes = [ floor((n - nM)/2), floor((m - mM)/2)];
    filtroCorr = padarray(mascara, missingSizes);

    [nF mF] = size(filtroCorr);

    % Si el tamaño era impar le va a faltar un renglón de puros ceros
    if(nF < n)
      filtroCorr = [filtroCorr; zeros(1, mF)];
      nF += 1;
    endif
    
    % Si el tamaño era impar le va a faltar una columna de puros ceros
    if(mF < m)
      filtroCorr = [filtroCorr, zeros(nF, 1)];
      mF += 1;
    endif
    
    
    % Transformamos nuestra imagen y nuestro filtro al dominio de Fourier.
    fImg = fft2(imagen);
    fFiltroCorr = fft2(filtroCorr);

    % Se aplica la correlación
    reconocimiento = real(ifftshift(ifft2(fImg .* conj(fFiltroCorr) ./ abs(fFiltroCorr))));
    numPuntos = 1;
    
  else
    imgReconocida = [];
    return
  endif
  
  % Si está habilitado muestra las gráficas
  if(graficas)
    figure, mesh(reconocimiento);
  endif
  
  % Obtenemos el punto máximo y sus coordenadas
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
