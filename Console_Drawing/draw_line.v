fn draw_dot(x int, y int, pixel_used int) {
	top := "\n".repeat(y)
	left := " ".repeat(x)
	message := "#"
	mut pixel_position := {
		"$pixel_used": [top, left]
	}

	// pixel_position["$pixel_used"] = [top, left]
	pixel_position["x"] = ["top", "left"]

	println("-----------------------------------------")
	println(pixel_position)
	println("-----------------------------------------")
	// println("$top $left $message")
}

fn draw_line(x1 int, y1 int, x2 int, y2 int) {
	mut a := 2 * (y2 - y1)
    mut error := a - (x2 - x1)
    mut b := a - (2 * (x2 - x1))
    mut x := x1
    mut y := y1
	mut pixel_used := 0

	for x <= x2 {
		pixel_used = pixel_used + 1
		x = x +1

		draw_dot(x, y, pixel_used)


		mut error1 := error + a
		mut error2 := error + b

		if error1 >=0 {
			y = y +1
			error = error2
		} else {
			error = error1
		}
	}
}

fn main() {
	draw_line(0, 0, 5, 5)
}
