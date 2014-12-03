//VARIABLES DANS TA FACE
@sea: #9ebbda;
@forest: #a9ab53;
@land: #dbd5c6;
@road: white;
@park: #a1c36a;
@boundary: #464646;
@background: #d6d0c4;
@place: "Ubuntu Medium";
@textcolor: black;
@texthalo: white;

Map {
  background-color: @sea;
  buffer-size: 256;
}

#texture {
 polygon-pattern-file:url(static/PaperStained0023_3_S.png); 
 polygon-pattern-comp-op:multiply;
 polygon-pattern-opacity:1;
}

#countries {
  polygon-fill: @background;
}

#polys[landuse='forest']{
  polygon-fill:@forest;
}
#polys[landuse='meadow']{
  polygon-fill:lighten(@forest, 5);
}
#polys[landuse='cemetery']{
  polygon-fill:darken(@land, 10);
}

#roads {
  [highway='service'],
  [highway='pedestrian'],
  [highway='track'],
  [highway='path'],
  [highway='unclassified'],
  [highway='tertiary'],
  [highway='residential']{
    ::bridge[bridge='yes'] {
      line-color: @land;
      line-width: 3;
      left/line-width:3;
      left/line-color: darken(@land,20);
      left/line-offset: 3;
      left/line-dasharray: 5,1;
      right/line-width:3;
      right/line-color: darken(@land,20);
      right/line-offset: -3;
      right/line-dasharray: 7,1;
    }
    line-width:3;
    line-color:@road;
    [highway='tertiary'] {
      line-width: 6;
    }
    [highway='path'],
    [highway='track'] {
      line-dasharray: 5,10;
    }
    ::label {
      text-name: '[name]';
      text-face-name: @place;
      text-placement: line;
      text-halo-fill: @texthalo;
      text-halo-radius: 1;
      text-transform: uppercase;
      text-size: 10;
      text-dy: 6;
    }
  }
}


#buildings {
  line-color:#594;
  line-width:0.5;
  polygon-opacity:1;
  polygon-fill:darken(@land, 10);
  [amenity='place_of_worship'] {
    polygon-fill:darken(@land, 20);
  }
}


#waterway {
  line-width:6;
  line-color: @sea;
}


#natural[natural='water'] {
  line-color: darken(@sea, 5);
  line-width:1;
  polygon-opacity:1;
  polygon-fill: @sea;
}


#leisure {
  line-color: darken(@park, 5);
  line-width:0.5;
  polygon-opacity:1;
  polygon-fill: @park;
}


#historic {
  line-color: darken(@land, 30);
  line-width:4;
  line-dasharray: 10,2;
  polygon-opacity:1;
  polygon-fill: darken(@land, 10);
}


#boundary {
  line-color: @boundary;
  line-width: 2;
  line-dasharray: 10,5,20,5;
  line-join: round;
}


#places {
  [place='hamlet'],
  [place='isolated_dwelling'] {
    text-name: '[name]';
    text-face-name: @place;
    text-halo-fill: @texthalo;
    text-halo-radius: 1;
    text-transform: uppercase;
    text-size: 10;
    text-fill: @textcolor;
  }
}
