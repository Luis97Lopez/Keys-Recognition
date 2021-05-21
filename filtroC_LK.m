% UASLP     FACULTAD DE INGENIER�A    VISI�N COMPUTACIONAL
% Proyecto : Reconocedor de llaves
% Autores:      Luis Alberto L�pez Romero
%               Axel L�pez Rodr�guez
% Fecha:        21 de abril del 2021
% Descripci�n:  Se aplica el filtro de contraste y brillo con los valores que 
%               recibe la funci�n.


function [H1]=filtroC_LK(L_K, ruta, Nim)
  X = [];
  for i=1:Nim %% Se lee el n�mero de imagenes
    B=KLaw_Space(L_K, [ruta,num2str(i),'.png']);
    x=reshape(B',[],1); % Forma Vectorial de la imagen
    X = [X x]; % X Con todas las imagenes de entrenamiento
  endfor
  %% Se crea una matriz llena de 1
  vectorU = double(ones(Nim,1));
  %% Se manda a llamar a la funci�n makeSDFX
  H1 = makeSDFX(X,vectorU);
endfunction
