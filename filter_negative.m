% UASLP     FACULTAD DE INGENIERÍA    VISIÓN COMPUTACIONAL
% Proyecto : Reconocedor de llaves
% Autores:      Luis Alberto López Romero
%               Axel López Rodríguez
% Fecha:        21 de abril del 2021
% Descripción:  Se recibe una imagen y se regresa el negativo de esa imagen.
function im = filter_negative(im)
##  A la imagen recibida se le aplica el negativo del valor RGB.
  im = 255 - im;
end
