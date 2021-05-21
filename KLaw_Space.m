%   UASLP FACULTAD DE INGENIERÍA 
%   Proyecto : Reconocedor de llaves
%   Autores:   Luis Alberto López Romero
%              Axel López Rodríguez
%   Fecha: 17/05/2021
%   Profesor: Dr. Martínez Pérez Francisco Eduardo
%   Descripción: El profesor nos compartió esta función, lo que hace es leer la
%   imagen especificada por la ruta y convertirla al dominio de Fourier.
%   Parametros : 
%   L_K : Valor de la ley K
%   nombreA : Nombre del archivo
function [imOr] = KLaw_Space(L_K, nombreA)
## Se lee la imagen
  recI = imread(nombreA);
## Se convierte la imagen al dominio de fourier
  YIni = fft2(double(recI));
## Se hacen estas operaciones para obtener mejores resultados con la imagen
 imOr = (abs(YIni).^L_K).*exp(j*angle(YIni));
endfunction