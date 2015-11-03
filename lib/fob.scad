include <round-corners-cube.scad>

module fob(length, width, thickness, text, font, font_size) {

  module fob_attachment() {
    _att_wid = 8;
    _att_len = 12;
    _att_rad = _att_wid / 2;

    difference(){
      translate([length / 2 + _att_len / 2 - _att_rad - 1, 0, 0]) {
        round_corners_cube(_att_len, _att_wid, thickness, _att_rad);
      }

      translate([length / 2 + _att_len - 2 * _att_rad - 1, 0, 0]){
        cylinder(r = _att_rad / 2, h = thickness + .1, center = true);
      }
    }
  }

  module fob_body() {
    union(){
      round_corners_cube(length, width, thickness, width / 2);
      fob_attachment();
    }
  }

  module fob_text() {
    linear_extrude(h = thickness + 0.2, center = true, convexity = 2, twist = 0) {
      text(text, font = font, size = font_size, halign = "center", valign = "center", spacing = 1.1);
    }
  }

  difference(){
    fob_body();
    fob_text();
  }

}

