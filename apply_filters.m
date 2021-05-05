% UASLP     FACULTAD DE INGENIERÍA    VISIÓN COMPUTACIONAL
%                     PROJECT
% Autores:      Luis Alberto López Romero
%               Axel López Rodríguez
% Fecha:        21 de abril del 2021
% Descripción:  Aplicaremos los fitlros necesarios para nuestro proyecto.
%               -----------------IMPORTANTE--------------------

function img = apply_filters(img)
  img = rgb2gray(img);
  img = filter_contrast_brightness(img, 2.0, 0);
  img = filter_negative(img);

##  filtro = fspecial("average");
##  filtro = fspecial("disk");
##  filtro = fspecial("gaussian");
##  filtro = fspecial("log");
##  filtro = fspecial("laplacian");
##  filtro = fspecial("unsharp");
##  filtro = fspecial("motion");
##  filtro = fspecial("sobel");
  filtro = fspecial("sobel")';
##  filtro = fspecial("prewitt");
##  filtro = fspecial("prewitt")';
##  filtro = fspecial("kirsch");
##  filtro = fspecial("kirsch")';
  
  % Se aplica un filtro que se escogió arriba
  img = imfilter(img, filtro);
end
