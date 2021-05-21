% UASLP     FACULTAD DE INGENIERÍA    VISIÓN COMPUTACIONAL
% Proyecto : Reconocedor de llaves
% Autores:      Luis Alberto López Romero
%               Axel López Rodríguez
% Fecha:        21 de abril del 2021
% Descripción:  Esa función lee 10 videos y regresa un arreglo de videos.

function videos = read_all_videos()
  pkg load image;
  pkg load video;
  videos(1:10) = struct();
  videos(1).video = read_video('./videos/11.mp4');
  videos(2).video = read_video('./videos/12.mp4');
  videos(3).video = read_video('./videos/13.mp4');
  videos(4).video = read_video('./videos/14.mp4');
  videos(5).video = read_video('./videos/15.mp4');
  videos(6).video = read_video('./videos/16.mp4');
  videos(7).video = read_video('./videos/17.mp4');
  videos(8).video = read_video('./videos/18.mp4');
  videos(9).video = read_video('./videos/19.mp4');
  videos(10).video = read_video('./videos/20.mp4');
endfunction  