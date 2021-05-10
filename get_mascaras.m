% Esta función crea todas las máscaras
function mascaras = get_mascaras()
  mascaras(1:4) = struct('color', char, 'file', char);
  
  mascaras(1).color = "blue";
  mascaras(1).file = "./mascaras/escenario1/mari_1.png";
  mascaras(1).label = 'Mariquita';
  
  mascaras(2).color = "red";
  mascaras(2).file = "./mascaras/escenario1/cora_1.png";
  mascaras(2).label = 'Corazón';
  
  mascaras(3).color = "green";
  mascaras(3).file = "./mascaras/escenario1/car_1.png";
  mascaras(3).label = 'Carro';
  
  mascaras(4).color = "magenta";
  mascaras(4).file = "./mascaras/escenario1/espada_1.png";
  mascaras(4).label = 'Espada';
  
endfunction
