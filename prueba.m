function prueba(video)
  results = scan(video);
  
  medio1 = mean(mean(results));
  medio2 = (max(results) + min(results)) /2;
  reconoce = true;
  im = [];
  nFrames             = size(video)(2);
  
  for iFrame       = 2:nFrames
    img = video(iFrame).frame;
    
    
    if(!reconoce && results(iFrame-1) > medio2)
        clf;
        im = image(img);
        reconoce = true;
    elseif reconoce && results(iFrame-1) < medio1
      reconoce = false;
      process(video, iFrame);
    end
    
    if (isempty (im))
      im = image (img);
    else
      set (im, "cdata", img);
    endif
    pause(0.02);
    drawnow

  end
endfunction
