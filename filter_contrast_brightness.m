function im = filter_contrast_brightness(im, ct, br)
  im .*= ct;
  im .+= br;
  mod(im, 256);
end