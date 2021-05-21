% UASLP     FACULTAD DE INGENIER�A    VISI�N COMPUTACIONAL
% Proyecto : Reconocedor de llaves
% Autores:      Luis Alberto L�pez Romero
%               Axel L�pez Rodr�guez
% Fecha:        24 de Abril del 2021
% Descripci�n:  Este m�todo dibuja sobre la imagen utilizando el punto m�ximo
%               del resultado de la convoluci�n, se dibuja un rect�ngulo del 
%               tama�o ingresado a la funci�n, se recibe tambi�n el color del 
%               rectangulo as� como el texto a poner cerca del rect�ngulo.

function draw_points(img, imageSize, points, color, label)
##  Se obtiene el n�mero de puntos.
  numPuntos = size(points)(2);
##  Se obtiene el tama�o de la imagen del video.
  [n m] = size(img);
##  Se obtienen el tama�o en Y de la m�scara que se va a dibujar.
  nM = imageSize(1);
##  Se obtiene el tama�o en X de la m�scara que se va a dibujar.
  mM = imageSize(2);
##  Para cada punto se va a dibujar un rect�ngulo.
  for i=1:numPuntos
##    Variable del punto X.
      _x = points(i).x;
##    Variable del punto Y.
      _y = points(i).y;
##    Se obtiene el valor en X desde donde va a empezar el rect�ngulo.    
      min_x = _x-(floor(mM/2)); if(min_x < 1) min_x = 1; endif
##    Se obtiene el valor en Y desde donde va a empezar el rectangulo.     
      min_y = _y-(floor(nM/2)); if(min_y < 1) min_y = 1; endif
##    Se dibuja el rect�ngulo con el color ingresado y las coordenadas
##    calculadas anteriormente.
      rectangle('Position',[min_x, min_y,mM,nM],'Edgecolor', color);            
##    Se pone encima del rect�ngulo el texto que se recibi�.  
      text(min_x, min_y-7, label, 'Color', color);
  end
endfunction
