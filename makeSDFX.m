% UASLP Facultad de Ingenier�a
% Visi�n Computacional 
% Examen 2 -  Recuperaci�n
% Autor : Axel L�pez Rodr�guez
% Profesor: Dr. Mart�nez P�rez Francisco Eduardo
% Fecha : 14/05/2021

function [h] = makeSDFX(X,vectorU)
  d = sqrt(size(X,1));
  hx = X; %% Matriz con imagenes en las columnas
  hsdf = hx*inv(hx'*hx)*vectorU; %% Se aplica el filtro sdf
  h=reshape(hsdf,d,d);
  h=h'; % Convierto el vector HSDF en una matriz
endfunction
