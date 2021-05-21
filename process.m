% UASLP     FACULTAD DE INGENIERÍA    VISIÓN COMPUTACIONAL
% Proyecto : Reconocedor de llaves
% Autores:      Luis Alberto López Romero
%               Axel López Rodríguez
% Fecha:        21 de abril del 2021
% Descripción:  Recibimos un video con un número de frame y con las respectivas 
%               máscaras que se quieran reconocer.

function imgRecognized = process(arrVideo, mascaras , numFrame, show=false)
  
  %% Se cargan los paquetes de video e imagen
  pkg load image;
  pkg load video;
  
  numMascaras = size(mascaras)(2);
  
  % Obtenemos la imagen del escenario
  img = arrVideo(numFrame).frame;

  % Aplicamos los filtros necesarios.
  img = apply_filters(img);
  
  % Si se desea se imprime la imagen. Normalmente viene en false
  if(show)
    imshow(arrVideo(numFrame).frame);
  endif
  
  % Ciclo para recorrer cada una de las mï¿½scaras
  for i=1:numMascaras    
    mascara = mascaras(i).filter;
       
    % Reconocemos la máscara en el escenario y obtenemos los puntos
  ##    points = recognition(img, mascara, 'conv');
      [value, point] = recognition(img, mascara, 'corr');      
        %%printf("%d\n", point.y);
        %%printf("%d\n", point.x);
    % Dibujamos los puntos que obtuvimos
      draw_points(arrVideo(numFrame).frame, mascaras(i).size, point, ...
                 mascaras(i).color, mascaras(i).label);
  end
