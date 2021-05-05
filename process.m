% UASLP     FACULTAD DE INGENIER�A    VISI�N COMPUTACIONAL
%                     PROJECT
% Autores:      Luis Alberto L�pez Romero
%               Axel L�pez Rodr�guez
% Fecha:        21 de abril del 2021
% Descripci�n:  Recibimos un video con un n�mero de frame y con la respectiva 
%               m�scara que se quiera reconocer.
%               ---------------------------
%                       IMPORTANTE:
%               Este archivo va a tener que ser modificado para que una misma
%               imagen reciba varias m�scaras y a partir de esa imagen imprima
%               las m�scaras que S� logr� reconocer

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

  % Reconocemos la m�scara en el escenario y obtenemos los puntos
##  points = recognition(img, mascara, 'conv');
  points = recognition(img, mascara, 'corr');
 
  % Dibujamos los puntos
  imgRecognized = draw_points(arrVideo(numFrame).frame, mascara, points);
  
  % Mostramos la imagen reconocida
##  imshow(imgRecognized);
