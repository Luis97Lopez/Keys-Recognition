%   UASLP FACULTAD DE INGENIER�A 
%   Examen 2o Parcial. Visi�n Computacional  - Recuperaci�n
%   Autor: Axel L�pez Rodr�guez
%   Fecha: 14/05/2021
%   Profesor: Dr. Mart�nez P�rez Francisco Eduardo
%   Descripci�n: Convierte la imagen al dominio de fourier utilizando la ley K
%   Parametros: El valor de la ley K y la imagen;

function [imOr] = KLaw_SpaceV(L_K, nombreI)  
  YIni = fft2(double(nombreI));
  imOr = (abs(YIni).^L_K).*exp(j*angle(YIni));
endfunction
