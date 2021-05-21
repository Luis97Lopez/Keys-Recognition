% UASLP     FACULTAD DE INGENIERÍA    VISIÓN COMPUTACIONAL
% Proyecto : Reconocedor de llaves
% Autores:      Luis Alberto López Romero
%               Axel López Rodríguez
% Fecha:        24 de Abril del 2021
% Descripción:  Este método dibuja sobre la imagen utilizando el punto máximo
%               del resultado de la convolución, se dibuja un rectángulo del 
%               tamaño ingresado a la función, se recibe también el color del 
%               rectangulo así como el texto a poner cerca del rectángulo.

function draw_points(img, imageSize, points, color, label)
##  Se obtiene el número de puntos.
  numPuntos = size(points)(2);
##  Se obtiene el tamaño de la imagen del video.
  [n m] = size(img);
##  Se obtienen el tamaño en Y de la máscara que se va a dibujar.
  nM = imageSize(1);
##  Se obtiene el tamaño en X de la máscara que se va a dibujar.
  mM = imageSize(2);
##  Para cada punto se va a dibujar un rectángulo.
  for i=1:numPuntos
##    Variable del punto X.
      _x = points(i).x;
##    Variable del punto Y.
      _y = points(i).y;
##    Se obtiene el valor en X desde donde va a empezar el rectángulo.    
      min_x = _x-(floor(mM/2)); if(min_x < 1) min_x = 1; endif
##    Se obtiene el valor en Y desde donde va a empezar el rectangulo.     
      min_y = _y-(floor(nM/2)); if(min_y < 1) min_y = 1; endif
##    Se dibuja el rectángulo con el color ingresado y las coordenadas
##    calculadas anteriormente.
      rectangle('Position',[min_x, min_y,mM,nM],'Edgecolor', color);            
##    Se pone encima del rectángulo el texto que se recibió.  
      text(min_x, min_y-7, label, 'Color', color);
  end
endfunction
