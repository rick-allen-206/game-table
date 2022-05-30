// variables
table_leg_x = 2; // table's x leg dimension. The x value should be 1/2. It is expected that 2 boards will be glued together.
table_leg_y = 4; // table's y leg dimension.
table_leg_z = 28; // table's z leg dimension.

inner_x = 72; // the inner x dimention of the game table. Primarily used for drop game space on the table.
inner_y = 48; // the inner y dimention of the game table. Primarily used for drop game space on the table.

outter_x_diff = 6; // the difference between the outter and the inner x values on any 1 side of the table.
outter_y_diff = 6; // the difference between the outter and the inner y values on any 1 side of the table.

outter_x = inner_x + outter_x_diff * 2; // the outter x dimensions of the table.
outter_y = inner_y + outter_y_diff * 2; // the outter y dimensions of the table.

topper_z = 2; // z value of the topper boards (the thing that acts like arm rests that cup holders will go in, ect).
depth_from_topper = 6 ; // the depth that the gamespace should be from the topper (the highest/topmost point of the table).

support_x = 1; // the width of the support boards on the x axis.
support_y = 1; // the width of the support boards on the y axis.

tv_cutout_x = 36; // the x dimention of the tv cutout.
tv_cutout_y = 24;// the y dimention of the tv cutout.

// gamespace_x = inner_x; // x value of the recessed game space.
// gamespace_y = inner_y; // y value of the recessed game space.

module table_leg(x = table_leg_x, y = table_leg_y, z = table_leg_z) {
  translate([0-x/2, 0, 0]) {
    color("red")
    cube([x, y, z + depth_from_topper], center=true);
  }
  translate([0+x/2, 0, 0]) {
    color("blue")
    cube([x, y, z + depth_from_topper], center=true);
  }
}

// table topper
translate([0, 0, table_leg_z + depth_from_topper + topper_z/2]) {
  color("purple")
  difference() {
    cube([outter_x, outter_y, topper_z], center = true);
    cube([inner_x, inner_y, topper_z + .5], center = true);
  }
};

// support frame for the topper

  // outter supports
  translate([0 - outter_x/2 + support_x/2, 0, table_leg_z + depth_from_topper/2 + topper_z/2]) {
    color("green")
    cube([support_x, outter_y, depth_from_topper - topper_z], center = true);
  };
  translate([0 + outter_x/2 - support_x/2, 0, table_leg_z + depth_from_topper/2 + topper_z/2]) {
    color("green")
    cube([support_x, outter_y, depth_from_topper - topper_z], center = true);
  };
  translate([0, 0 - outter_y/2 + support_y/2, table_leg_z + depth_from_topper/2 + topper_z/2]) {
    color("green")
    cube([outter_x, support_y, depth_from_topper - topper_z], center = true);
  };
  translate([0, 0 + outter_y/2 - support_y/2, table_leg_z + depth_from_topper/2 + topper_z/2]) {
    color("green")
    cube([outter_x, support_y, depth_from_topper - topper_z], center = true);
  };

  // inner supports
  translate([0 - inner_x/2 - support_x/2, 0, table_leg_z + depth_from_topper/2 + topper_z/2]) {
    color("yellow")
    cube([support_x, inner_y + support_y * 2, depth_from_topper - topper_z], center = true);
  };
  translate([0 + inner_x/2 + support_x/2, 0, table_leg_z + depth_from_topper/2 + topper_z/2]) {
    color("yellow")
    cube([support_x, inner_y + support_y * 2, depth_from_topper - topper_z], center = true);
  };
  translate([0, 0 - inner_y/2 - support_y/2, table_leg_z + depth_from_topper/2 + topper_z/2]) {
    color("yellow")
    cube([inner_x + support_x * 2, support_y, depth_from_topper - topper_z], center = true);
  };
  translate([0, 0 + inner_y/2 + support_y/2, table_leg_z + depth_from_topper/2 + topper_z/2]) {
    color("yellow")
    cube([inner_x + support_x * 2, support_y, depth_from_topper - topper_z], center = true);
  };

// drop game space
translate([0, 0, table_leg_z + topper_z/2]) {
  color("orange")
  difference() {
    cube([inner_x + support_x * 2, inner_y + support_y * 2, topper_z], center = true);
    cube([tv_cutout_x, tv_cutout_y, topper_z + .5], center = true);
  }
};


// add table legs
translate([
  0 - outter_x/2 + table_leg_x + support_x, 
  0 - outter_y/2 + table_leg_y/2 + support_y, 
  0 + table_leg_z/2 + depth_from_topper/2
]) {
  table_leg();
}

translate([
  0 + outter_x/2 - table_leg_x - support_x, 
  0 - outter_y/2 + table_leg_y/2 + support_y, 
  0 + table_leg_z/2 + depth_from_topper/2
]) {
  table_leg();
}

translate([
  0 + outter_x/2 - table_leg_x - support_x, 
  0 + outter_y/2 - table_leg_y/2 - support_y, 
  0 + table_leg_z/2 + depth_from_topper/2
]) {
  table_leg();
}

translate([
  0 - outter_x/2 + table_leg_x + support_x, 
  0 + outter_y/2 - table_leg_y/2 - support_y, 
  0 + table_leg_z/2 + depth_from_topper/2
]) {
  table_leg();
}