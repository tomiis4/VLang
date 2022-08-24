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
	// number have to be even to work perfectly
	three_dimensional_square(24, mut board_object)
	
	// end timer
	end := time.since(start)
	println("It took: $end")
}


fn three_dimensional_square(scaleMain int, mut board []string) {
	// draw all sqares/lines to draw 3D square
	square_thick(scaleMain, mut board)
	square_inner((scaleMain / 3) * 2, mut board)
	midlle_lines(scaleMain, (scaleMain / 3) * 2, mut board)
}

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
