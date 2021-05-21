% UASLP     FACULTAD DE INGENIER�A    VISI�N COMPUTACIONAL
% Proyecto : Reconocedor de llaves
% Autores:      Luis Alberto L�pez Romero
%               Axel L�pez Rodr�guez
% Fecha:        21 de abril del 2021
% Descripci�n:  Se recibe una imagen y se regresa el negativo de esa imagen.
function im = filter_negative(im)
##  A la imagen recibida se le aplica el negativo del valor RGB.
  im = 255 - im;
end
