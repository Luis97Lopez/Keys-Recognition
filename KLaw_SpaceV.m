%   UASLP FACULTAD DE INGENIERÍA 
%   Examen 2o Parcial. Visión Computacional  - Recuperación
%   Autor: Axel López Rodríguez
%   Fecha: 14/05/2021
%   Profesor: Dr. Martínez Pérez Francisco Eduardo
%   Descripción: Convierte la imagen al dominio de fourier utilizando la ley K
%   Parametros: El valor de la ley K y la imagen;

function [imOr] = KLaw_SpaceV(L_K, nombreI)  
  YIni = fft2(double(nombreI));
  imOr = (abs(YIni).^L_K).*exp(j*angle(YIni));
endfunction
