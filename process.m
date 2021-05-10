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

function imgRecognized = process(arrVideo, numFrame, show=false)
  pkg load image;
  pkg load video;
  
  % Obtenemos las m�scaras y el n�mero de m�scaras
  mascaras = get_mascaras();
  numMascaras = size(mascaras)(2);
  
  % Obtenemos la imagen del escenario
  img = arrVideo(numFrame).frame;

  % Aplicamos los filtros necesarios.
  img = apply_filters(img);
  
  % Si se desea se imprime la imagen. Normalmente viene en false
  if(show)
    imshow(arrVideo(numFrame).frame);
  endif
  
  % Ciclo para recorrer cada una de las m�scaras
  for i=1:numMascaras
    mascara = apply_filters(imread(mascaras(i).file));

    % Reconocemos la m�scara en el escenario y obtenemos los puntos
##    points = recognition(img, mascara, 'conv');
    points = recognition(img, mascara, 'corr');
   
    % Dibujamos los puntos que obtuvimos
    draw_points(arrVideo(numFrame).frame, mascara, points, ...
                mascaras(i).color, mascaras(i).label);
  end
