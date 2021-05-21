% UASLP     FACULTAD DE INGENIERÍA    VISIÓN COMPUTACIONAL
% Proyecto : Reconocedor de llaves
% Autores:      Luis Alberto López Romero
%               Axel López Rodríguez
% Fecha:        21 de abril del 2021
% Descripción:  Se aplica el filtro de contraste y brillo con los valores que 
%               recibe la función.


function [H1]=filtroC_LK(L_K, ruta, Nim)
  X = [];
  for i=1:Nim %% Se lee el número de imagenes
    B=KLaw_Space(L_K, [ruta,num2str(i),'.png']);
    x=reshape(B',[],1); % Forma Vectorial de la imagen
    X = [X x]; % X Con todas las imagenes de entrenamiento
  endfor
  %% Se crea una matriz llena de 1
  vectorU = double(ones(Nim,1));
  %% Se manda a llamar a la función makeSDFX
  H1 = makeSDFX(X,vectorU);
endfunction
