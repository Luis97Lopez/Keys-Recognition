% UASLP     FACULTAD DE INGENIER�A    VISI�N COMPUTACIONAL
% Proyecto : Reconocedor de llaves
% Autores:      Luis Alberto L�pez Romero
%               Axel L�pez Rodr�guez
% Fecha:        17 de Mayo del 2021
% Descripci�n:  Esta funci�n crea todas las m�scaras para el escenario 1, 
%               regresa el arreglo de m�scaras con la informaci�n necesaria.

function mascaras = get_mascaras()
  L_K = 0.4;
  mascaras(1:4) = struct();
  
##  Cada estructura guarda el color del rectangulo, el texto a mostrar en el
##  rectangulo, el tama�o de la m�scara y el filtro( se aplica leyk directo)
  mascaras(1).color = "blue";
  mascaras(1).label = 'Mariquita';
  mascaras(1).size = size(rgb2gray(imread('./mascaras/escenario1/mari_1.png')));
  mascaras(1).filter = filtroC_LK(L_K, "./mascaras/escenario1/mari", 4);
  
  mascaras(2).color = "red";
  mascaras(2).label = 'Coraz�n';
  mascaras(2).size = size(rgb2gray(imread('./mascaras/escenario1/cora_1.png')));
  mascaras(2).filter = filtroC_LK(L_K, "./mascaras/escenario1/cora", 4);
  
  mascaras(3).color = "green";
  mascaras(3).label = 'Carro';
  mascaras(3).size = size(rgb2gray(imread('./mascaras/escenario1/car_1.png')));
  mascaras(3).filter = filtroC_LK(L_K, "./mascaras/escenario1/car", 2);
  
  mascaras(4).color = "magenta";
  mascaras(4).label = 'Espada';
  mascaras(4).size = size(rgb2gray(imread('./mascaras/escenario1/espada_1.png')));  
  mascaras(4).filter = filtroC_LK(L_K, "./mascaras/escenario1/espada", 2);
endfunction
