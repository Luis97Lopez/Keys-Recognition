%   UASLP FACULTAD DE INGENIER�A 
%   Proyecto : Reconocedor de llaves
%   Autores:   Luis Alberto L�pez Romero
%              Axel L�pez Rodr�guez
%   Fecha: 17/05/2021
%   Profesor: Dr. Mart�nez P�rez Francisco Eduardo
%   Descripci�n: El profesor nos comparti� esta funci�n, lo que hace es leer la
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