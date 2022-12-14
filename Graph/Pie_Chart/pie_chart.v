import time

fn get_angle(x int) int {
	mut reuslt := (x * 360) / 100
	
	return reuslt
}

fn get_index(x int, y int) int {
	mut reuslt := (25 * (y -1)) + (x-1)

	return reuslt
}

// return absolute number
fn abs(x int) int {
	// is not absolute
	if x.str().contains("-") {
		return x * -1
	} 
	// is absolute
	else {
		return x
	}
}

// check where draw pixel
fn sign(x int) int {
  if x > 0 {
    return 1
	}
  else if x < 0 {
    return -1
	}
  else { 
		return 0
	}
}

// function which draw lines using Bresenham's Algorithm.
fn draw_line(x1 int, y1 int, x2 int, y2 int, mut canvas []string) {
  mut x := x1
  mut y := y1
  mut dx := abs(x2 - x1 )
  mut dy := abs(y2 - y1 )
  mut s1 := sign(x2 - x1)
  mut s2 := sign(y2 - y1)
	mut interchange := "false"

	if dy > dx {
    mut t := dx
    dx = dy
    dy = t
    interchange = "true"
	} else {
		interchange = "false"
	}

	mut error := 2*dy - dx
  mut a := 2*dy
	mut b := 2*dy - 2*dx

	mut index := (25 * (y -1)) + (x-1)
	canvas[index] = "\u001b[31m# \u001b[0m"
	println(canvas.join("") )

	mut i := -1
	for i < (dx - 1) {
		i++

    if error < 0 {
      if interchange != "false" {
        y = y + s2
			} else {
        x = x + s1
				error = error + a
			}
		} else {
      y = y + s2
      x = x + s1
      error = error + b
		} 

		index = (25 * (y -1)) + (x-1)
		canvas[index] = "\u001b[31m# \u001b[0m"
		println(canvas.join("") )
	}
}

fn main() {
	mut first_value := 56

	mut first_value_angle := (get_angle(first_value) / 5)
	mut middle_point := [13,13]
	mut start_point := [1,13]


	mut canvas := [
		"  ", "  ", "  " "  ", "  ", "  ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "  ", "  ", "  ", "  ", "  ", "  \n",
		"  ", "  ", "  " "  ", "  ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "  ", "  ", "  ", "  ", "  \n",
		"  ", "  ", "  " "  ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "  ", "  ", "  ", "  \n",
		"  ", "  ", "  " "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "  ", "  ", "  \n",
		"  ", "  ", "# " "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "  ", "  \n",
		"  ", "# ", "# " "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "  \n",
		"# ", "# ", "# " "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# \n",
		"# ", "# ", "# " "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# \n",
		"# ", "# ", "# " "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# \n",
		"# ", "# ", "# " "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# \n",
		"# ", "# ", "# " "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# \n",
		"# ", "# ", "# " "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# \n",
		"# ", "# ", "# " "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# \n",
		"# ", "# ", "# " "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# \n",
		"# ", "# ", "# " "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# \n",
		"# ", "# ", "# " "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# \n",
		"# ", "# ", "# " "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# \n",
		"# ", "# ", "# " "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# \n",
		"# ", "# ", "# " "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# \n",
		"  ", "# ", "# " "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "  \n",
		"  ", "  ", "# " "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "  ", "  \n",
		"  ", "  ", "  " "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "  ", "  ", "  \n",
		"  ", "  ", "  " "  ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "  ", "  ", "  ", "  \n",
		"  ", "  ", "  " "  ", "  ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "  ", "  ", "  ", "  ", "  \n",
		"  ", "  ", "  " "  ", "  ", "  ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "# ", "  ", "  ", "  ", "  ", "  ", "  \n",
		
	]


	mut connect_points := [
		[0, 1,13], // work
		[1, 1,12],
		[2, 1,11],
		[3, 1,10],
		[4, 1,9],
		[5, 1,8],
		[6, 1,7], //w
		[7, 2,6], //
		[8, 3,5], //
		[9, 4,4], // 
		[10,5,3], // 
		[11, 6,2], //
		[12, 7,1],
		[13, 7,1], // w
		[14, 8,1],
		[15, 9,1],
		[16, 10,1],
		[17, 11,1],
		[18, 12,1],
		[18, 13,1] // work

		[19, 14,1], // work
		[20, 15,1],
		[21, 16,1],
		[22, 17,1],
		[23, 18,1],
		[24, 19,1],

		[25, 20,2],
    [26, 21,3],
		[27, 22,4],
		[28, 23,5],
		[29, 24,6],

		[30, 5,7],
		[31, 5,8],
		[32, 5,9],
		[33, 5,10],
		[34, 5,11],
		[35, 5,12],
		[36, 5,13] // work

		[37, 5,14], // work
		[38, 5,15],
		[39, 5,16],
		[40, 5,17],
		[41, 5,18],
		[42, 5,19],

		[43, 24,20],
    [44, 23,21],
		[45, 22,22],
		[46, 21,23],
		[47, 20,24],

		[48, 19,25],
		[49, 18,25],
		[50, 17,25],
		[51, 16,25],
		[52, 15,125],
		[53, 14,25],
		[54, 13,25] // work

		[37, 12,25], // work
		[38, 11,25],
		[39, 10,25],
		[40, 9,25],
		[41, 8,25],
		[42, 7,25],

		[43, 6,24],
    [44, 5,23],
		[45, 4,22],
		[46, 3,21],
		[47, 2,20],

		[48, 1,19],
		[49, 1,18],
		[50, 1,17],
		[51, 1,16],
		[52, 1,15],
		[53, 1,14],
		[54, 1,13] // work
	]

	start := time.now()
	
	for key in connect_points {
		if key[0] == first_value_angle {
			x_variable := key[1]
			y_variable := key[2]

			// draw_line(middle_point[0], middle_point[1], x_variable, y_variable, mut canvas)
			// println("$x_variable $y_variable")
		}
			draw_line(15,15, 11,25, mut canvas)
			// println("$key")
	}

	// println(first_value_angle)

	// draw_line(middle_point[0], middle_point[1], start_point[0], start_point[1], mut canvas)

	end := time.since(start)
	println(end)
}
