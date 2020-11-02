#include "colors.inc"
#include "textures.inc"
#include "glass.inc"
#include "metals.inc"
#include "golds.inc"
#include "stones.inc"
#include "woods.inc"
#include "shapes.inc"
#include "shapes2.inc"
#include "functions.inc"
#include "math.inc"
#include "transforms.inc"

// Basic Scene Setup
background {
	rgb < 0.999997, 1.000000, 1.000000 >
}

camera {
	perspective
	location < 0.0, 0, -2.5 >
		right x * 1
	up y * 3 / 4
	angle 60
	look_at < 0.0, 0.0, 0 >
}

light_source { < -50, 100, -100 >
		color White
}

// Union of button + text for rotating
union {
	
	// Button shape
	sphere { < 0, 0, 0 > , 0.5
		texture {
			pigment {
				color rgb < 1, 0.6, 0 >
			}
			finish {
				specular 0 reflection 0.02 phong 1 phong_size 100
			}
		} // end of texture

		scale < 2.5, 1.25, 0.75 >
		rotate < 0, 0, 0 >
		translate < 0, 0, 0 >
	} // end of sphere -----------------------------------

	// Intersection of two text elements + larger button for curved text
	intersection {
		
		// Union of both sides of text
		union {
			text {
				ttf "cyrvetic.ttf", "VOTE", 0.9, 0 // thickness, offset
				texture {
					pigment {
						color rgb < 1, 0, 0 >
					}
					finish {
						specular 0 reflection 0.025
					}
				} // end of texture
				
				scale < 1, 1, 1 > * 0.75
				translate < -1.0, -0.3, -0.54 >
			} // end of text object ---------------------------------------------

			text {
				ttf "cyrvetic.ttf", "NOW", 0.9, 0 // thickness, offset
				texture {
					pigment {
						color rgb < 1, 0, 0 >
					}
					finish {
						specular 0 reflection 0.025
					}
				} // end of texture
				
				rotate < 0, 180, 180 >
				scale < 1, 1, 1 > * 0.75
				translate < -0.825, 0.3, 0.54 >
			} // end of text object ---------------------------------------------
		}

		sphere { < 0, 0, 0 > , 0.5
			texture {
				pigment {
					color rgb < 1, 0, 0 >
				}
				finish {
					specular 0.1 reflection 0.025
				}
			} // end of texture

			scale < 2.76, 1.5, 1 > * 0.9
			rotate < 0, 0, 0 >
			translate < 0, 0, 0 >
		} // end of sphere -----------------------------------
		
	} // end curved text button intersection
	
	rotate < 360 * (clock + 0.00), 0, 0 >
} // end all shapes union
