// import time to calculate how much time it took to execute 
import time

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

// function which duraw lines using Bresenham's Algorithm.
fn draw_line(x1 int, y1 int, x2 int, y2 int, mut board []string) {
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

	mut index := (30 * (y -1)) + (x-1)
	board[index] = "\u001b[31m# \u001b[0m"
	println(board.join("") )

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

		index = (30 * (y -1)) + (x-1)
		board[index] = "\u001b[31m# \u001b[0m"
		println(board.join("") )
	}
}

fn main() {
	// "spawn" board
	mut board_object := [ 
		"\u001b[30;1m25 # \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m\n",
		"\u001b[30;1m24 # \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m\n",
		"\u001b[30;1m23 # \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m\n",
		"\u001b[30;1m22 # \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m\n",
		"\u001b[30;1m21 # \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m\n",
		"\u001b[30;1m20 # \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m\n",
		"\u001b[30;1m19 # \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m\n",
		"\u001b[30;1m18 # \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m\n",
		"\u001b[30;1m17 # \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m\n",
		"\u001b[30;1m16 # \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m\n",
		"\u001b[30;1m15 # \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m\n",
		"\u001b[30;1m14 # \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m\n",
		"\u001b[30;1m13 # \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m\n",
		"\u001b[30;1m12 # \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m\n",
		"\u001b[30;1m11 # \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m\n",
		"\u001b[30;1m10 # \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m\n",
		"\u001b[30;1m9  # \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m\n",
		"\u001b[30;1m8  # \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m\n",
		"\u001b[30;1m7  # \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m\n",
		"\u001b[30;1m6  # \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m\n",
		"\u001b[30;1m5  # \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m\n",
		"\u001b[30;1m4  # \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m\n",
		"\u001b[30;1m3  # \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m\n",
		"\u001b[30;1m2  # \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m\n",
		"\u001b[30;1m1  # \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m\n"
	]

	// start timer
	start := time.now()
	
	// start main function 
	spawn_graph(mut board_object)

	//! stonks (remove if you want :D )
	//s
	draw_line(5,9,7,9, mut board_object)
	draw_line(5,9,5,11, mut board_object)
	draw_line(5,11,7,11, mut board_object)
	draw_line(7,11,7,13, mut board_object)
	draw_line(5,13,7,13, mut board_object)
	//t
	draw_line(10,13,10,10, mut board_object)
	draw_line(9,10,11,10, mut board_object)
	//o
	draw_line(13,10,15,10, mut board_object)
	draw_line(13,13,15,13, mut board_object)
	draw_line(13,10,13,13, mut board_object)
	draw_line(15,10,15,13, mut board_object)
	//n
	draw_line(17,10,17,13, mut board_object)
	draw_line(18,11,18,11, mut board_object)
	draw_line(19,10,19,13, mut board_object)
  //k
	draw_line(21,10,21,13, mut board_object)
	draw_line(23,10,21,11, mut board_object)
	draw_line(23,13,21,11, mut board_object)
  //s
	draw_line(25,9,27,9, mut board_object)
	draw_line(25,9,25,11, mut board_object)
	draw_line(25,11,27,11, mut board_object)
	draw_line(27,11,27,13, mut board_object)
	draw_line(25,13,27,13, mut board_object)
	
	// end timer
	end := time.since(start)
	println("It took: $end")
}

fn spawn_graph(mut board_array []string) {
	mut array_object := [ // array of points
		[3,22],
		[9,18],
		[15,22],
		[20,17],
		[23,19],
		[29,14],
	]

	mut i := 0
	for i < array_object.len -1 {
		mut x1 :=array_object[i][0]
		mut y1 :=array_object[i][1]


		mut x2 :=array_object[i +1][0]
		mut y2 :=array_object[i +1][1]

		draw_line(x1, y1, x2 ,y2, mut board_array)
		i++
	} 
}
