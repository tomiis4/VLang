// import time to calculate how much time it took to execute 
import time
import math

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
		"\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m\n",
		"\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m\n",
		"\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m\n",
		"\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m\n",
		"\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m\n",
		"\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m\n",
		"\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m\n",
		"\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m\n",
		"\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m\n",
		"\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m\n",
		"\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m\n",
		"\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m\n",
		"\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m\n",
		"\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m\n",
		"\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m\n",
		"\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m\n",
		"\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m\n",
		"\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m\n",
		"\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m\n",
		"\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m\n",
		"\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m\n",
		"\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m\n",
		"\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m\n",
		"\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m\n",
		"\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m\n",
		"\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m\n",
		"\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m\n",
		"\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m\n",
		"\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m\n",
		"\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m","\u001b[30;1m# \u001b[0m\n"
	]

	// start timer
	start := time.now()
	
	// start main function 
	// number have to be EVEN to work perfectly
	three_dimensional_square(12, mut board_object)
	
	// end timer
	end := time.since(start)
	println("It took: $end")
}

fn three_dimensional_square(scaleMain int, mut board []string) {
	full_square(scaleMain, (scaleMain / 3) * 2, mut board, 0.6)
}

fn full_square(widthMain int, widthSecond int, mut board []string, rotate f64) {
	main_get_position := 15 - (widthMain / 2)
	main_position_variable := main_get_position + 1
	main_width_variable := (widthMain + main_position_variable) -1

	second_get_position := 15 - (widthSecond / 2)
	second_position_variable := second_get_position + 1
	second_width_variable := (widthSecond + second_position_variable) -1

	println("Pos: $main_position_variable")
	println("Wid: $main_width_variable")
	// get vectors
	mut vector1 := [main_position_variable, main_position_variable, 0] // front  left top
	mut vector3 := [main_width_variable, main_position_variable, 0] // front  right top
	mut vector5 := [main_position_variable, main_width_variable, 0] // front  left  bottom
	mut vector7 := [main_width_variable, main_width_variable, 0] // front  right bottom

	mut vector0 := [main_position_variable, main_position_variable, -widthMain] // back   left top
	mut vector2 := [main_width_variable, main_position_variable, -widthMain] // back   right top
	mut vector4 := [main_position_variable, main_width_variable, -widthMain] // back   left  bottom
	mut vector6 := [main_width_variable, main_width_variable, -widthMain] // back   right bottom
	mut vectors := [vector0, vector1, vector2, vector3, vector4, vector5, vector6, vector7]
	
	mut lines0  := [0, 1] // connect line left/top
	mut lines4  := [4, 5]	// connect line left/bottom
	mut lines2  := [3, 2] // connect line right/top
	mut lines6  := [7, 6] // connect line right/bottom

	mut lines1  := [1, 3] // front top line 
	mut lines5  := [5, 7] // front bottom line 
	mut lines9  := [1, 5] // front left line 
	mut lines11 := [3, 7] // front right line
	
	mut lines3  := [2, 0] // back top line 
	mut lines7  := [6, 4] // back bottom line 
	mut lines8  := [0, 4] // back left line 
	mut lines10 := [2, 6] // back right line 
	mut lines := [lines0, lines1, lines2, lines3, lines4, lines5, lines6, lines7, lines8, lines9, lines10, lines11]

	mut sin_theta := math.sin(rotate)
  mut cos_theta := math.cos(rotate)
  
	// Rotate around Z (round)
	//? remove comment to rotate
	// mut rotate_z := 0
  // for rotate_z < vectors.len {
  //   mut vector := vectors[rotate_z]
  //   mut x := vector[0]
  //   mut y := vector[1]
  //   mut z := vector[2]
	// 	mut test := abs(int(math.round(x * cos_theta + y * sin_theta)))
	// 	mut test2 := abs(int(math.round(y * cos_theta - x * sin_theta)))
		
	// 	vector[0] = test
	// 	vector[1] = test2
  //   println("$vector")
	// 	rotate_z++
  // }

	// Rotate around Y (left/right)
	mut rotate_y := 0
  for rotate_y < vectors.len {
    mut vector := vectors[rotate_y]
    mut x := vector[0]
    mut y := vector[1]
    mut z := vector[2]
		mut test := abs(int(math.round(x * cos_theta + z * sin_theta)))
		mut test2 := abs(int(math.round(z * cos_theta - x * sin_theta)))
		
		vector[0] = test
		vector[2] = test2
    println("$vector")
		rotate_y++
  }

	// Rotate around X (top/bottom)
	mut rotate_x := 0
  for rotate_x < vectors.len {
    mut vector := vectors[rotate_x]
    mut x := vector[0]
    mut y := vector[1]
    mut z := vector[2]
		mut test := abs(int(math.round(y * cos_theta + z * sin_theta)))
		mut test2 := abs(int(math.round(z * cos_theta - y * sin_theta)))
		
		vector[1] = test
		vector[2] = test2
    println("$vector")
		rotate_x++
  }


	// draw square
	mut e := 0
	for e < lines.len {
		mut n0 := lines[e][0]
		mut n1 := lines[e][1]
		mut vector_start := vectors[n0]
		mut vector_end := vectors[n1]
		draw_line(vector_start[0], vector_start[1], vector_end[0], vector_end[1], mut board)
		
		e++
  }
}
