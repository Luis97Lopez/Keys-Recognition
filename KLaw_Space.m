%   UASLP FACULTAD DE INGENIERÍA 
%   Examen 2o Parcial. Visión Computacional - Recuperación
%   Autor: Axel López Rodríguez
%   Fecha: 14/05/2021
%   Profesor: Dr. Martínez Pérez Francisco Eduardo
%   Descripción: El profesor nos compartió esta función, lo que hace es leer la
%   imagen especificada por la ruta y convertirla al dominio de Fourier.
%   Parametros : 
%   L_K : Valor de la ley K
%   nombreA : Nombre del archivo

function [imOr] = KLaw_Space(L_K, nombreA)
  recI = imread(nombreA);
  YIni = fft2(double(recI));
  
 imOr = (abs(YIni).^L_K).*exp(j*angle(YIni));
endfunction