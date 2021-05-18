%   UASLP FACULTAD DE INGENIERÍA 
%   Examen 2o Parcial. Visión Computacional
%   Autor: Axel López Rodríguez
%   Fecha: 05/05/2021
%   Profesor: Dr. Martínez Pérez Francisco Eduardo
%   Descripción: La función crea un filtro con varias máscaras
%   Parametros:
%   L_K : Número de la ley K
%   ruta : Ruta donde se encuentran los archivos de las máscaras
%   Nim : Número de imagenes a procesar


function [H1]=filtroC_LK(L_K, ruta, Nim)
  X = [];
  for i=1:Nim %% Se lee el número de imagenes
    B=KLaw_Space(L_K, [ruta,num2str(i),'.png']);
    x=reshape(B',[],1); % Forma Vectorial de la imagen
    X = [X x]; % X Con todas las imagenes de entrenamiento
  endfor
  %% Se crea una matriz llena de 1
  vectorU = double(ones(Nim,1));
  H1 = makeSDFX(X,vectorU);
endfunction
