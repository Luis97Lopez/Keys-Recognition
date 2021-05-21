%   UASLP     FACULTAD DE INGENIER�A    VISI�N COMPUTACIONAL
%   Proyecto : Reconocedor de llaves
%   Autores:      Luis Alberto L�pez Romero
%                 Axel L�pez Rodr�guez
%   Fecha:        21 de abril del 2021
%   Profesor: Dr. Mart�nez P�rez Francisco Eduardo
%   Descripci�n: Convierte la imagen al dominio de fourier utilizando la ley K
%   Parametros: El valor de la ley K y la imagen;

function [imOr] = KLaw_SpaceV(L_K, nombreI)  
  %% Se convierte la imagen al dominio de fourier
  YIni = fft2(double(nombreI));
  %% Se hacen estas operaciones para obtener un mejor resultado
  imOr = (abs(YIni).^L_K).*exp(j*angle(YIni));
endfunction
