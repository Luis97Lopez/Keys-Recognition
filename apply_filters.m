% UASLP     FACULTAD DE INGENIERÍA    VISIÓN COMPUTACIONAL
% Proyecto : Reconocedor de llaves
% Autores:      Luis Alberto López Romero
%               Axel López Rodríguez
% Fecha:        21 de abril del 2021
% Descripción:  Aplicaremos los filtros necesarios para nuestro proyecto.

function img = apply_filters(img)
  ##  Se convierte la imagen a escala de grises
  img = rgb2gray(img);
  ## Se aumenta el contraste de la imagen
  img = filter_contrast_brightness(img, 2.0, 0);
  ##  Se obtiene el negativo de esa imagen
  img = filter_negative(img);

##  filtro = fspecial("average");
##  filtro = fspecial("disk");
##  filtro = fspecial("gaussian");
##  filtro = fspecial("log");
##  filtro = fspecial("laplacian");
##  filtro = fspecial("unsharp");
##  filtro = fspecial("motion");
##  filtro = fspecial("sobel");

## Después de hacer pruebas el filtro de Sobel fue el filtro que nos dio mejores 
## resultados.
    filtro = fspecial("sobel")';
    
##  filtro = fspecial("prewitt");
##  filtro = fspecial("prewitt")';
##  filtro = fspecial("kirsch");
##  filtro = fspecial("kirsch")';
  
  % Se aplica un filtro que se escogió arriba
  img = imfilter(img, filtro);
end
