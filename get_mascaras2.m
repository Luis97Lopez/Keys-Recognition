% UASLP     FACULTAD DE INGENIERÍA    VISIÓN COMPUTACIONAL
% Proyecto : Reconocedor de llaves
% Autores:      Luis Alberto López Romero
%               Axel López Rodríguez
% Fecha:        17 de Mayo del 2021
% Descripción:  Esta función crea todas las máscaras para el escenario 2, 
%               regresa el arreglo de máscaras con la información necesaria.

function mascaras = get_mascaras2()  
  L_K = 0.4;
  mascaras(1:3) = struct();
  ##  Cada estructura guarda el color del rectangulo, el texto a mostrar en el
  ##  rectangulo, el tamaño de la máscara y el filtro( se aplica leyk directo)
  mascaras(1).color = "blue";
  mascaras(1).label = "Dije";
  mascaras(1).size = size(rgb2gray(imread('./mascaras/escenario2/dije_1.png')));
  mascaras(1).filter = filtroC_LK(L_K, "./mascaras/escenario2/dije", 4);
  
  mascaras(2).color = "red";
  mascaras(2).label = "Foto";
  mascaras(2).size = size(rgb2gray(imread('./mascaras/escenario2/foto_1.png')));
  mascaras(2).filter = filtroC_LK(L_K, "./mascaras/escenario2/foto", 4);
  
  mascaras(3).color = "green";
  mascaras(3).label = "USB";
  mascaras(3).size = size(rgb2gray(imread('./mascaras/escenario2/usb_1.png')));
  mascaras(3).filter = filtroC_LK(L_K, "./mascaras/escenario2/usb", 4);
endfunction