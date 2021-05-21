% UASLP     FACULTAD DE INGENIER�A    VISI�N COMPUTACIONAL
% Proyecto : Reconocedor de llaves
% Autores:      Luis Alberto L�pez Romero
%               Axel L�pez Rodr�guez
% Fecha:        21 de abril del 2021
% Descripci�n:  Se aplica el filtro de contraste y brillo con los valores que 
%               recibe la funci�n.

function im = filter_contrast_brightness(im, ct, br)
## Se hace la multiplicaci�n de cada elemento en la imagen por el valor
## del contraste.
  im .*= ct;
##  Se hace la suma de cada elemento en la imagen con el valor del brillo
  im .+= br;
## Se obtiene el m�dulo de la imagen
  mod(im, 256);
end