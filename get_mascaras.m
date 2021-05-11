% Esta función crea todas las máscaras
function mascaras = get_mascaras()
  mascaras(1:4) = struct();
  
  mascaras(1).color = "blue";
  mascaras(1).path = "./mascaras/escenario1/mari_";
  mascaras(1).label = 'Mariquita';
  mascaras(1).n = 4;
  
  mascaras(2).color = "red";
  mascaras(2).path = "./mascaras/escenario1/cora_";
  mascaras(2).label = 'Corazón';
  mascaras(2).n = 4;
  
  mascaras(3).color = "green";
  mascaras(3).path = "./mascaras/escenario1/car_";
  mascaras(3).label = 'Carro';
  mascaras(3).n = 2;

  mascaras(4).color = "magenta";
  mascaras(4).path = "./mascaras/escenario1/espada_";
  mascaras(4).label = 'Espada';
  mascaras(4).n = 2;
  
endfunction
