% Esta función crea todas las máscaras
function mascaras = get_mascaras()
  
  L_K = 0.4;
  mascaras(1:3) = struct();
  
##  mascaras(1).color = "blue";
##  mascaras(1).label = 'Mariquita';
##  mascaras(1).size = size(rgb2gray(imread('./mascaras/escenario1/mari_1.png')));
##  mascaras(1).filter = filtroC_LK(L_K, "./mascaras/escenario1/mari", 4);
##  
##  mascaras(2).color = "red";
##  mascaras(2).label = 'Corazón';
##  mascaras(2).size = size(rgb2gray(imread('./mascaras/escenario1/cora_1.png')));
##  mascaras(2).filter = filtroC_LK(L_K, "./mascaras/escenario1/cora", 4);
##  
##  mascaras(3).color = "green";
##  mascaras(3).label = 'Carro';
##  mascaras(3).size = size(rgb2gray(imread('./mascaras/escenario1/car_1.png')));
##  mascaras(3).filter = filtroC_LK(L_K, "./mascaras/escenario1/car", 2);
##  
##  mascaras(4).color = "magenta";
##  mascaras(4).label = 'Espada';
##  mascaras(4).size = size(rgb2gray(imread('./mascaras/escenario1/espada_1.png')));  
##  mascaras(4).filter = filtroC_LK(L_K, "./mascaras/escenario1/espada", 2);
  
  mascaras(1).color = "blue";
  mascaras(1).label = "Dije";
  mascaras(1).size = size(rgb2gray(imread('./mascaras/escenario2/dije_1.png')));
  mascaras(1).filter = filtroC_LK(L_K, "./mascaras/escenario2/dije", 2);
  
  mascaras(2).color = "red";
  mascaras(2).label = "Foto";
  mascaras(2).size = size(rgb2gray(imread('./mascaras/escenario2/foto_1.png')));
  mascaras(2).filter = filtroC_LK(L_K, "./mascaras/escenario2/foto", 1);
  
  mascaras(3).color = "green";
  mascaras(3).label = "USB";
  mascaras(3).size = size(rgb2gray(imread('./mascaras/escenario2/usb_1.png')));
  mascaras(3).filter = filtroC_LK(L_K, "./mascaras/escenario2/usb", 1);
endfunction
