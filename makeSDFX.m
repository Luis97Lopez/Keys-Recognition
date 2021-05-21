% UASLP     FACULTAD DE INGENIER�A    VISI�N COMPUTACIONAL
% Proyecto : Reconocedor de llaves
% Autores:      Luis Alberto L�pez Romero
%               Axel L�pez Rodr�guez
% Fecha:        21 de abril del 2021
% Descripci�n:  Se utiliza este c�digo para la ley K

function [h] = makeSDFX(X,vectorU)
  %d = sqrt(size(X,1));
  hx = X; %% Matriz con imagenes en las columnas
  hsdf = hx*inv(hx'*hx)*vectorU; %% Se aplica el filtro sdf
  h=reshape(hsdf, 640 , 480);
  h=h'; % Convierto el vector HSDF en su transpuesta
endfunction
