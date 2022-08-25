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
	// draw all sqares/lines to draw 3D square
	// square_thick(scaleMain, mut board)
	// square_inner((scaleMain / 3) * 2, mut board)
	// midlle_lines(scaleMain, (scaleMain / 3) * 2, mut board)
	full_square(scaleMain, (scaleMain / 3) * 2, mut board, 5)
}

fn full_square(widthMain int, widthSecond int, mut board []string, rotate int) {
	main_get_position := 15 - (widthMain / 2)
	main_position_variable := main_get_position + 1
	main_width_variable := (widthMain + main_position_variable) -1

	second_get_position := 15 - (widthSecond / 2)
	second_position_variable := second_get_position + 1
	second_width_variable := (widthSecond + second_position_variable) -1

	// get vectors
	mut vector1 := [main_position_variable, main_position_variable, main_width_variable] // front  left top
	mut vector3 := [main_width_variable, main_position_variable, main_width_variable] // front  right top
	mut vector5 := [main_position_variable, main_width_variable, main_width_variable] // front  left  bottom
	mut vector7 := [main_width_variable, main_width_variable, main_width_variable] // front  right bottom
	mut vector0 := [second_position_variable, second_position_variable, -second_width_variable] // back   left top
	mut vector2 := [second_width_variable, second_position_variable, -second_width_variable] // back   right top
	mut vector4 := [second_position_variable, second_width_variable, -second_width_variable] // back   left  bottom
	mut vector6 := [second_width_variable, second_width_variable, -second_width_variable] // back   right bottom
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
	mut liness := [lines0, lines1, lines2, lines3, lines4, lines5, lines6, lines7, lines8, lines9, lines10, lines11]
	
	

	mut e := 0
	for e < liness.len {
		mut n0 := liness[e][0]
		mut n1 := liness[e][1]
		mut vector_start := vectors[n0]
		mut vector_end := vectors[n1]

		if vectors[n0] == vector1 && vectors[n1] == vector5 { 
			vector_start = [second_position_variable, second_position_variable, -second_width_variable]
			vector_end = [second_position_variable, second_width_variable, -second_width_variable]
		}
		else if vectors[n0] == vector1 && vectors[n1] == vector3 { 
			vector_start = [main_position_variable, main_position_variable, main_width_variable]
			vector_end = [second_position_variable, second_position_variable, -second_width_variable]
		}
		else if vectors[n0] == vector5 && vectors[n1] == vector7 { 
			vector_start = [main_position_variable, main_width_variable, main_width_variable]
			vector_end = [second_position_variable, second_width_variable, -second_width_variable]
		}
		else if vectors[n0] == vector3 && vectors[n1] == vector7 { 
			vector_start = [main_position_variable, main_position_variable, main_width_variable]
			vector_end = [main_position_variable, main_width_variable, main_width_variable]
		}
		else if vectors[n0] == vector0 && vectors[n1] == vector2 { 
			vector_start = [main_width_variable, main_position_variable, main_width_variable]
			vector_end = [second_width_variable, second_position_variable, -second_width_variable]
		}
		else if vectors[n0] == vector2 && vectors[n1] == vector6 { 
			vector_start = [main_width_variable, main_position_variable, main_width_variable]
			vector_end = [main_width_variable, main_width_variable, main_width_variable]
		}
		else if vectors[n0] == vector4 && vectors[n1] == vector6 { 
			vector_start = [main_width_variable, main_width_variable, main_width_variable]
			vector_end = [second_width_variable, second_width_variable, -second_width_variable]
		}


		draw_line(vector_start[0], vector_start[1], vector_end[0], vector_end[1], mut board)
		e++
  }






	//? Thick/Front
	// draw front top
	// draw_line(main_position_variable,main_position_variable, main_width_variable,main_position_variable, mut board)
	// // draw front left
	// draw_line(main_position_variable,main_position_variable, main_position_variable,main_width_variable, mut board) 
	// // draw front right
	// draw_line(main_width_variable,main_position_variable, main_width_variable,main_width_variable, mut board) 
	// // draw front bottom
	// draw_line(main_position_variable,main_width_variable, main_width_variable,main_width_variable, mut board)

	// //? Inner/Slim
	// // draw back top
	// draw_line(second_position_variable,second_position_variable, second_width_variable, second_position_variable, mut board) 
	// // draw bottom left
	// draw_line(second_position_variable,second_position_variable, second_position_variable,second_width_variable, mut board) 
	// // draw bottom right
	// draw_line(second_width_variable,second_position_variable, second_width_variable,second_width_variable, mut board) 
	// // draw bottom bottom
	// draw_line(second_position_variable,second_width_variable, second_width_variable,second_width_variable, mut board)

	// //? Connect points
	// //left top line
	// draw_line(main_position_variable,main_position_variable, second_position_variable,second_position_variable, mut board)
	// //right top line
	// draw_line(main_width_variable,main_position_variable,  second_width_variable, second_position_variable, mut board)
	// //left bottom line
	// draw_line(main_position_variable,main_width_variable,  second_position_variable,second_width_variable, mut board)
	// //right bottom line
	// draw_line(main_width_variable,main_width_variable,  second_width_variable,second_width_variable, mut board)
}

// fn rotate_y(theta int) {
// 	mut sin_theta = sine(theta)
//   mut cos_theta = cosse(theta)
  
//   for (mut n=0; n<vectors.length; n++) {
//       mut vector = vectors[n]
//       mut x = vector[0]
//       mut z = vector[2]
//       println("-Cur-: $vector")
//       vector[0] = x * cos_theta + z * sin_theta
//       vector[2] = z * cos_theta - x * sin_theta
// 			println("-Cur-: $vector")
//   }
// }

fn square_thick(width int, mut board []string) {
	get_position := 15 - (width / 2)
	position_variable := get_position + 1
	width_variable := (width + position_variable) -1

	// draw front top
	draw_line(position_variable,position_variable, width_variable,position_variable, mut board)
	// draw front left
	draw_line(position_variable,position_variable, position_variable,width_variable, mut board) 
	// draw front right
	draw_line(width_variable,position_variable, width_variable,width_variable, mut board) 
	// draw front bottom
	draw_line(position_variable,width_variable, width_variable,width_variable, mut board) 
}

fn square_inner(width int, mut board []string) {
	get_position := 15 - (width / 2)
	position_variable := get_position + 1
	width_variable := (width + position_variable) -1

	// draw back top
	draw_line(position_variable,position_variable, width_variable, position_variable, mut board) 
	// draw bottom left
	draw_line(position_variable,position_variable, position_variable,width_variable, mut board) 
	// draw bottom right
	draw_line(width_variable,position_variable, width_variable,width_variable, mut board) 
	// draw bottom bottom
	draw_line(position_variable,width_variable, width_variable,width_variable, mut board) 
}

fn midlle_lines(widthMain int, widthSecond int, mut board []string) {
	main_get_position := 15 - (widthMain / 2)
	main_position_variable := main_get_position + 1
	main_width_variable := (widthMain + main_position_variable) -1

	second_get_position := 15 - (widthSecond / 2)
	second_position_variable := second_get_position + 1
	second_width_variable := (widthSecond + second_position_variable) -1

	//left top line
	draw_line(main_position_variable,main_position_variable, second_position_variable,second_position_variable, mut board)
	//right top line
	draw_line(main_width_variable,main_position_variable,  second_width_variable, second_position_variable, mut board)
	//left bottom line
	draw_line(main_position_variable,main_width_variable,  second_position_variable,second_width_variable, mut board)
	//right bottom line
	draw_line(main_width_variable,main_width_variable,  second_width_variable,second_width_variable, mut board)
}
