% UASLP     FACULTAD DE INGENIER�A    VISI�N COMPUTACIONAL
%                     PROJECT
% Autores:      Luis Alberto L�pez Romero
%               Axel L�pez Rodr�guez
% Fecha:        21 de abril del 2021
% Descripci�n: 

function img = process(arrVideo, numFrame)
  pkg load image;
  pkg load video;
  
  
  img = arrVideo(numFrame).frame;
  img = rgb2gray(img);
  img = filter_contrast_brightness(img, 2.0, 0);
  img = filter_negative(img);
  

  mascara = imread('.\mascaras\mari_1.png');
  mascara = rgb2gray(mascara);
  mascara = filter_contrast_brightness(mascara, 2.0, 0);
  mascara = filter_negative(mascara);

##  imgRecognized = recognition(img, mascara, 'conv');
  imgRecognized = recognition(img, mascara, 'corr');

  imshow(imgRecognized);