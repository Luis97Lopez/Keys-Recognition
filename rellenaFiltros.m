%   UASLP FACULTAD DE INGENIERÍA 
%   Examen 2o Parcial. Visión Computacional - Recuperación
%   Autores:   Luis Alberto López Romero
%              Axel López Rodríguez
%   Fecha: 17/05/2021
%   Descripción: Esta función recibe una imagen (imagen de una etiqueta)
%   y regresa una image de 640 * 480 pixeles utilizando la función padarray
%   
%   Parámetros : 
%   im : Imagen que quiere centrar usando padarray

function img = rellenaFiltros(im)  
    [y, x] =  size(im);  
    faltanteY = floor((480 - y) / 2);
    faltanteX = floor((640 - x) / 2);
    img = padarray(im, [faltanteY , faltanteX]);
    [nF mF] = size(img); 
    %% Si el tamaño era impar le va a faltar un renglón de puros zeros
    if(nF < 480)
        img = [img; zeros(1, mF)];
        nF += 1;
    endif    
    % Si el tamaño era impar le va a faltar una columna de puros ceros
    if(mF < 640)
      img = [img, zeros(nF, 1)];
      mF += 1;
    endif    
endfunction
