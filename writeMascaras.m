% UASLP     FACULTAD DE INGENIER�A    VISI�N COMPUTACIONAL
%                     RECOGNITION
% Autores:      Luis Alberto L�pez Romero
%               Axel L�pez Rodr�guez
% Fecha:        17 de Mayo del 2021
% Descripci�n:  Este c�digo crea los filtros para las m�scaras 
%               utilizando padArray, crea imagenes de 640 * 480



%% Se cargan los paquetes necesarios 

pkg load video;
pkg load image;

%%%%%%%% ESCENARIO 1

%% Ciclo para leer las llaves de la mariquita
for i=1:4
  im = imread(strcat('./mascaras/escenario1/mari_', num2str(i) , '.png'));
  im = rgb2gray(im);
  im = rellenaFiltros(im);
  imwrite(im, strcat('./mascaras/escenario1/mari' , num2str(i) , '.png'));
endfor
%% Ciclo para leer las llaves del coche
for i=1:2
  im = imread(strcat('./mascaras/escenario1/car_', num2str(i) , '.png'));
  im = rgb2gray(im);
  im = rellenaFiltros(im);
  imwrite(im, strcat('./mascaras/escenario1/car' , num2str(i) , '.png'));
endfor
%% Ciclo para leeer las llaves espada
for i=1:2
  im = imread(strcat('./mascaras/escenario1/espada_', num2str(i) , '.png'));
  im = rgb2gray(im);
  im = rellenaFiltros(im);
  imwrite(im, strcat('./mascaras/escenario1/espada' , num2str(i) , '.png'));
endfor
%% Ciclo para leer las llaves corazon
for i=1:4
  im = imread(strcat('./mascaras/escenario1/cora_', num2str(i) , '.png'));
  im = rgb2gray(im);
  im = rellenaFiltros(im);
  imwrite(im, strcat('./mascaras/escenario1/cora_' , num2str(i) , '.png'));
endfor
%%%%%%%% ESCENARIO 2

