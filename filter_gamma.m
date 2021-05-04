function im = filter_gamma(im, gamma)
  im = double(im);
  im ./= 256;
  im .^= gamma;
  im .*=256;
  im = uint8(im);
end