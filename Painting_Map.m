% close all clc, dbstop if error
h=worldmap([17.5 19],[-67.5 -65.5]);
getm(h,'MapProjection')
% geoshow('worldlakes.shp', 'FaceColor', 'cyan')
% geoshow('worldrivers.shp','Color', 'blue') % %
geoshow('landareas.shp','FaceColor',[0.5 0.7 0.5])
% geoshow('landareas.shp','FaceColor')
load cities
geoshow(18.5,-66.5,'DisplayType','line')
title('Map','FontSize',14,'FontWeight','Bold')
% hold on
plot(-66.5,18.5,'o--')

plotm(-66.5,18.5,'r.')
