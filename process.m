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

function imgRecognized = process(arrVideo, numFrame, show=false)
  pkg load image;
  pkg load video;
  
  % Obtenemos las máscaras y el número de máscaras
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
  
  % Ciclo para recorrer cada una de las máscaras
  for i=1:numMascaras
    maxPoint = [];
    maxValue = 0;
    mascara = [];
    
    % Ciclo de todas las máscaras de cada objeto máscara
    for j=1:mascaras(i).n
      % obtenemos la máscara
      mascara = apply_filters(imread(...
                                strcat(mascaras(i).path, num2str(j), '.png')));

      % Reconocemos la máscara en el escenario y obtenemos los puntos
  ##    points = recognition(img, mascara, 'conv');
      [value, point] = recognition(img, mascara, 'corr');
      
      if(value > maxValue)
        maxPoint = point;
        maxValue = value;
      end
    end
    
    % Dibujamos los puntos que obtuvimos
      draw_points(arrVideo(numFrame).frame, mascara, maxPoint, ...
                  mascaras(i).color, mascaras(i).label);
  end
