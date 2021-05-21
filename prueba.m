% UASLP     FACULTAD DE INGENIER�A    VISI�N COMPUTACIONAL
% Proyecto : Reconocedor de llaves
% Autores:      Luis Alberto L�pez Romero
%               Axel L�pez Rodr�guez
% Fecha:        26 de abril del 2021
% Descripci�n:  Este c�digo nos sirve para mostrar en una figura los frames
%               que se vayan analizando y aqu� se manda a llamar a la funci�n del 
%               SlitScanning y se reconocen los objetos.
%               Este es el m�todo principal para el proyecto, cualquier an�lisis
%               se realiza utilizando este c�digo.  

function prueba(video, escenario)
##  Si el video es del escenario 1 se cargan las m�scaras del escenario 1
  if(escenario == 1)
  mascaras = get_mascaras();
##  Si el video es del escenario 2 se cargan las m�scaras del escenario 2
  elseif(escenario == 2)
  mascaras = get_mascaras2();
endif
## Se obtienen los resultados del SlitScanning
  results = scan(video);
##  La variable medio1 contiene la media de los resultados
  medio1 = mean(mean(results));
##  La variable medio2 contiene el num maximo + el num minimo de los resultados 
##  entre 2, esto lo usamos para detectar si hubo un cambio abrupto en la imagen
  medio2 = (max(results) + min(results)) /2;
##  Bandera que nos sirve para determinar si se va a hacer el reconocimiento de 
##  objetos.
  reconoce = true;
##  Variable auxiliar que nos sirve para almacenar el frame que estamos viendo
  im = [];
##  Variable para saber el n�mero de frames del video
  nFrames             = size(video)(2);
##  Ciclo For para recorrer los frames del video
  for iFrame       = 2:nFrames
##    Se obtiene la imagen del frame
    img = video(iFrame).frame;
    
##  En caso de que no se est� reconociendo el frame y haya un cambio abrupto
##  en la imagen entonces se empieza a reconocer el objeto.
    if(!reconoce && results(iFrame-1) > medio2)
        clf;
##  Se guarda en la variable img la imagen que se est� analizando
        im = image(img);
##  La bandera reconoce se pone en true para que pueda entrar a la 2a condicion
        reconoce = true;
##  Este if se realiza cuando haya habido un peque�o cambio en los frames, al 
##  finalizar ese cambio se empiezan a reconocer los objetos en la imagen
    elseif reconoce && results(iFrame-1) < medio1
##  La bandera reconoce se pone en false
      reconoce = false;
##  Se manda a llamar a la funci�n que reconoce los objetos
      process(video, mascaras ,iFrame);
    end
##  En caso de que la imagen que se va a mostrar en la figura esta vacia se
##  le asigna la imagen actual
    if (isempty (im))
      im = image (img);
    else
##  Usando este SET mostramos en la figura la imagen analizada
      set (im, "cdata", img);
    endif
##  Peque�a pausa para que se haga la animaci�n del cambio de frame
    pause(0.02);
##   Se dibuja la imagen del frame actual en la figura.
    drawnow
  end
endfunction
