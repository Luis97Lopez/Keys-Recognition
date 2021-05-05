% UASLP     FACULTAD DE INGENIERÍA    VISIÓN COMPUTACIONAL
%                     PROJECT
% Autores:      Luis Alberto López Romero
%               Axel López Rodríguez
% Fecha:        21 de abril del 2021
% Descripción:  Recibimos un video con un número de frame y con la respectiva 
%               máscara que se quiera reconocer.
%               ---------------------------
%                       IMPORTANTE:
%               Este archivo va a tener que ser modificado para que una misma
%               imagen reciba varias máscaras y a partir de esa imagen imprima
%               las máscaras que SÍ logró reconocer

function imgRecognized = process(arrVideo, numFrame, pathMascara)
  pkg load image;
  pkg load video;
  
  % Obtenemos la imagen del escenario
  img = arrVideo(numFrame).frame;
  
  % Cargamos la imagen de la mascara
  mascara = imread(pathMascara);

  % Aplicamos los filtros necesarios.
  img = apply_filters(img);
  mascara = apply_filters(mascara);

  % Reconocemos la máscara en el escenario y obtenemos los puntos
##  points = recognition(img, mascara, 'conv');
  points = recognition(img, mascara, 'corr');
 
  % Dibujamos los puntos
  imgRecognized = draw_points(arrVideo(numFrame).frame, mascara, points);
  
  % Mostramos la imagen reconocida
##  imshow(imgRecognized);
