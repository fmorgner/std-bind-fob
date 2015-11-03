module create_meniscus(height, radius)
difference(){
  translate([radius / 2 + 0.1, radius / 2 + 0.1, 0]){
    cube([radius + 0.2, radius + 0.1, height + 0.2], center = true);
  }

  cylinder(h = height + 0.2, r = radius, center = true);
}

module round_corners_cube(x, y, z, radius)
difference(){
  cube([x, y, z], center = true);

  translate([x / 2 - radius, y / 2 - radius]){
    rotate(0){
      create_meniscus(z, radius);
    }
  }

  translate([-x / 2 + radius, y / 2 - radius]){
    rotate(90){
      create_meniscus(z, radius);
    }
  }

  translate([-x / 2 + radius, -y / 2 + radius]){
    rotate(180){
      create_meniscus(z, radius);
    }
  }

  translate([x / 2 - radius, -y / 2 + radius]){
    rotate(270){
      create_meniscus(z, radius);
    }
  }
}
