% UASLP Facultad de Ingeniería
% Visión Computacional 
% Examen 2 -  Recuperación
% Autor : Axel López Rodríguez
% Profesor: Dr. Martínez Pérez Francisco Eduardo
% Fecha : 14/05/2021

function [h] = makeSDFX(X,vectorU)
  d = sqrt(size(X,1));
  hx = X; %% Matriz con imagenes en las columnas
  hsdf = hx*inv(hx'*hx)*vectorU; %% Se aplica el filtro sdf
  h=reshape(hsdf,d,d);
  h=h'; % Convierto el vector HSDF en una matriz
endfunction
