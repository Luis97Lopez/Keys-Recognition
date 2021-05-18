%   UASLP FACULTAD DE INGENIER�A 
%   Examen 2o Parcial. Visi�n Computacional - Recuperaci�n
%   Autor: Axel L�pez Rodr�guez
%   Fecha: 14/05/2021
%   Profesor: Dr. Mart�nez P�rez Francisco Eduardo
%   Descripci�n: El profesor nos comparti� esta funci�n, lo que hace es leer la
%   imagen especificada por la ruta y convertirla al dominio de Fourier.
%   Parametros : 
%   L_K : Valor de la ley K
%   nombreA : Nombre del archivo

function [imOr] = KLaw_Space(L_K, nombreA)
  recI = imread(nombreA);
  YIni = fft2(double(recI));
  
 imOr = (abs(YIni).^L_K).*exp(j*angle(YIni));
endfunction