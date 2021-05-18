%   UASLP FACULTAD DE INGENIER�A 
%   Examen 2o Parcial. Visi�n Computacional
%   Autor: Axel L�pez Rodr�guez
%   Fecha: 05/05/2021
%   Profesor: Dr. Mart�nez P�rez Francisco Eduardo
%   Descripci�n: La funci�n crea un filtro con varias m�scaras
%   Parametros:
%   L_K : N�mero de la ley K
%   ruta : Ruta donde se encuentran los archivos de las m�scaras
%   Nim : N�mero de imagenes a procesar


function [H1]=filtroC_LK(L_K, ruta, Nim)
  X = [];
  for i=1:Nim %% Se lee el n�mero de imagenes
    B=KLaw_Space(L_K, [ruta,num2str(i),'.png']);
    x=reshape(B',[],1); % Forma Vectorial de la imagen
    X = [X x]; % X Con todas las imagenes de entrenamiento
  endfor
  %% Se crea una matriz llena de 1
  vectorU = double(ones(Nim,1));
  H1 = makeSDFX(X,vectorU);
endfunction
