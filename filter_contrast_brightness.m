% UASLP     FACULTAD DE INGENIERÍA    VISIÓN COMPUTACIONAL
% Proyecto : Reconocedor de llaves
% Autores:      Luis Alberto López Romero
%               Axel López Rodríguez
% Fecha:        21 de abril del 2021
% Descripción:  Se aplica el filtro de contraste y brillo con los valores que 
%               recibe la función.

function im = filter_contrast_brightness(im, ct, br)
## Se hace la multiplicación de cada elemento en la imagen por el valor
## del contraste.
  im .*= ct;
##  Se hace la suma de cada elemento en la imagen con el valor del brillo
  im .+= br;
## Se obtiene el módulo de la imagen
  mod(im, 256);
end