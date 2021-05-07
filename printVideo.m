function printVideo(imgs)
  im = [];
  for i=1:size(imgs)(2)
   img = imgs(1,i).frame;
   if (isempty (im))
     im = image (img);
   else
     fprintf("%d\n",i);
     set (im, "cdata", img);
   endif
   pause(0.03);
   drawnow
  endfor
endfunction