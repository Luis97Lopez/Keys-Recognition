function img = draw_points(img, mascara, points)
  numPuntos = size(points)(2);
  [n m] = size(img);
  [nM mM] = size(mascara);
  
  figure, imshow(img);
  
  % Para cada punto se le va a imprimir un cuadrado de 3x3 en la imagen
  for i=1:numPuntos
      _x = points(i).x;
      _y = points(i).y;
      
##      img(_y-2:_y+2, _x-2:_x+2) = 255;
      
      
      
      min_x = _x-(floor(mM/2)); if(min_x < 1) min_x = 1; endif
##      max_x = _x+(floor(mM/2)); if(max_x > m) max_x = m; endif
      min_y = _y-(floor(nM/2)); if(min_y < 1) min_y = 1; endif
##      max_y = _y+(floor(nM/2)); if(max_y > n) max_y = n; endif

##      color = [0 0 255];
      
      rectangle('Position',[min_x, min_y,mM,nM],'Edgecolor', "green");
    
  end
endfunction
