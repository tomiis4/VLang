fn abs(x int) int {
	if x.str().contains("-") {
		return x * -1
	} else {
		return x
	}
}

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

fn draw_line_better(x1 int, y1 int, x2 int, y2 int, mut board []string) {
    mut x := x1
    mut y := y1
    mut dx := abs(x2 - x1 )
    mut dy := abs(y2 - y1 )
    mut s1 := sign(x2 - x1)
    mut s2 := sign(y2 - y1)
	mut interchange := "false"
	// mut board := board_object.clone()
	// mut board_object := [ 
	// 	" # ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# \n",
	// 	"# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# \n",
	// 	"# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# \n",
	// 	"# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# \n",
	// 	"# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# \n",
	// 	"# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# \n",
	// 	"# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# \n",
	// 	"# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# \n",
	// 	"# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# \n",
	// 	"# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# \n",
	// 	"# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# \n",
	// 	"# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# \n",
	// 	"# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# \n",
	// 	"# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# \n",
	// 	"# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# \n",
	// 	"# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# \n",
	// 	"# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# \n",
	// 	"# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# \n",
	// 	"# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# \n",
	// 	"# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# \n",
	// 	"# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# \n",
	// 	"# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# \n",
	// 	"# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# \n",
	// 	"# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# \n",
	// 	"# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# \n"
	// ]

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
	board[index] = "  "
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

		index = (25 * (y -1)) + (x-1)
		board[index] = "  "
		println(board.join("") )
	}
}

fn main() {
	mut board_object := [ 
		"# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# \n",
		"# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# \n",
		"# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# \n",
		"# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# \n",
		"# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# \n",
		"# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# \n",
		"# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# \n",
		"# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# \n",
		"# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# \n",
		"# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# \n",
		"# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# \n",
		"# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# \n",
		"# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# \n",
		"# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# \n",
		"# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# \n",
		"# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# \n",
		"# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# \n",
		"# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# \n",
		"# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# \n",
		"# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# \n",
		"# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# \n",
		"# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# \n",
		"# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# \n",
		"# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# \n",
		"# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# ","# \n"
	]
	draw_line_better(10,6, 22,6, mut board_object) // x1 y1, x2 y2   min: 1,1 max: 25,25
	draw_line_better(4,9, 16,9, mut board_object) // x1 y1, x2 y2   min: 1,1 max: 25,25
	draw_line_better(10,6, 4,9, mut board_object) // x1 y1, x2 y2   min: 1,1 max: 25,25
	draw_line_better(22,6, 16,9, mut board_object) // x1 y1, x2 y2   min: 1,1 max: 25,25
	draw_line_better(4,9, 4,21, mut board_object) // x1 y1, x2 y2   min: 1,1 max: 25,25
	draw_line_better(10,6, 10,18, mut board_object) // x1 y1, x2 y2   min: 1,1 max: 25,25
	draw_line_better(22,6, 22,18, mut board_object) // x1 y1, x2 y2   min: 1,1 max: 25,25
	draw_line_better(10,18, 4,21, mut board_object) // x1 y1, x2 y2   min: 1,1 max: 25,25
	draw_line_better(22,18, 16,21, mut board_object) // x1 y1, x2 y2   min: 1,1 max: 25,25
	draw_line_better(10,18, 22,18, mut board_object) // x1 y1, x2 y2   min: 1,1 max: 25,25
	draw_line_better(4,21, 16,21, mut board_object) // x1 y1, x2 y2   min: 1,1 max: 25,25
	draw_line_better(16,9, 16,21, mut board_object) // x1 y1, x2 y2   min: 1,1 max: 25,25
}
