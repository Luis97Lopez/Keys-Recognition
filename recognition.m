% UASLP     FACULTAD DE INGENIERÍA    VISIÓN COMPUTACIONAL
%                     RECOGNITION
% Autores:      Luis Alberto López Romero
%               Axel López Rodríguez
% Fecha:        21 de abril del 2021
% Descripción: 

function imgReconocida = recognition(imagen, mascara, tipo, graficas = false)
  [n m] = size(imagen);
  [nM mM] = size(mascara);
  
##  filtro = fspecial("average");
##  filtro = fspecial("disk");
##  filtro = fspecial("gaussian");
##  filtro = fspecial("log");
##  filtro = fspecial("laplacian");
##  filtro = fspecial("unsharp");
##  filtro = fspecial("motion");
##  filtro = fspecial("sobel");
  filtro = fspecial("sobel")';
##  filtro = fspecial("prewitt");
##  filtro = fspecial("prewitt")';
##  filtro = fspecial("kirsch");
##  filtro = fspecial("kirsch")';
  
  % Se aplica un filtro que se escogió arriba
  imagenFiltrada = imfilter(imagen, filtro);
  mascara = imfilter(mascara, filtro);

  % Sin filtro
##  imagenFiltrada = imagen;
  
  if(tipo == 'conv')
    % Se aplica el proceso de convolusión
    reconocimiento = imfilter(double(imagenFiltrada), double(mascara));
    
    numPuntos = 10;
  elseif(tipo == 'corr')
    % Creamos el filtro de correlación (imagen ampliada).
    arr = [ floor((n - nM)/2), floor((m - mM)/2)];
    filtroCorr = padarray(mascara, arr);

    [nF mF] = size(filtroCorr);

    if(nF < n)
      filtroCorr = [filtroCorr; zeros(1, mF)];
      nF += 1;
    endif
    
    if(mF < m)
      filtroCorr = [filtroCorr, zeros(nF, 1)];
      mF += 1;
    endif
    
    
    % Transformamos nuestra imagen y nuestro filtro al dominio de Fourier.
    fImg = fft2(imagenFiltrada);
    fFiltroCorr = fft2(filtroCorr);

    % Se aplica la correlación
    reconocimiento = real(ifftshift(ifft2(fImg .* conj(fFiltroCorr) ./ abs(fFiltroCorr))));
    numPuntos = 3;
    
    
##    figure, imshow(filtroCorr);
  else
    imgReconocida = []
    return
  endif
  
  if(graficas)
    figure, mesh(reconocimiento);
  endif
  
  ptoMax = max(max(reconocimiento));
  [yMax xMax] = find(ptoMax == reconocimiento);
    
  vectorFiltrado = reshape(reconocimiento, [],1);
  vectorFiltrado = sort(vectorFiltrado, 'descend');

  % Para cada punto se le va a imprimir un cuadrado de 3x3 en la imagen
  for i=1:numPuntos
##    vectorFiltrado(i)  
##    if(vectorFiltrado(i) > 600)
      [_y, _x] = find(vectorFiltrado(i) == reconocimiento);
      
      imagen(_y-2:_y+2, _x-2:_x+2) = 255;
      
##      min_x = _x-(floor(mM/2)); if(min_x < 0) min_x = 1; endif
##      max_x = _x+(floor(mM/2)); if(max_x > m) max_x = m; endif
##      min_y = _y-(floor(nM/2)); if(min_y < 0) min_y = 1; endif
##      max_y = _y+(floor(nM/2)); if(max_x > n) max_x = n; endif
##      
##      imagen(min_y:max_y, min_x) = 254;
##      imagen(min_y:max_y, max_x) = 254;
##      imagen(min_y, min_x : max_x) = 254;
##      imagen(max_y, min_x : max_x) = 254;
      
      
##    endif
  end

  
  imgReconocida = imagen;
##  figure, imshow(imagenFiltrada);
##  figure, imshow(imgReconocida);
end
