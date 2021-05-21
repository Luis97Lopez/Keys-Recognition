% UASLP     FACULTAD DE INGENIERÍA    VISIÓN COMPUTACIONAL
% Proyecto : Reconocedor de llaves
% Autores:      Luis Alberto López Romero
%               Axel López Rodríguez
% Fecha:        21 de abril del 2021
% Descripción:  Se recibe una imagen y se aplica el filtro gamma con el valor
%               ingresado.

function im = filter_gamma(im, gamma)
##  Se convierte la imagen a double.
  im = double(im);
##  Se hace la división de cada elemento entre 256
  im ./= 256;
## Se eleva cada elemento de la imagen a la potencia del valor gamma ingresado
  im .^= gamma;
## Se multiplica cada elemento de la imagen por 256
  im .*=256;
##  Se convierte la imagen a uint8(0-255)
  im = uint8(im);
end