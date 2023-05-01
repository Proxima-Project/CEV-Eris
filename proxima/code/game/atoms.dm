/atom
	var/paint_color
	var/can_paint = FALSE

/atom/proc/get_color()
	return paint_color

/atom/proc/set_color(var/color)
	paint_color = color
	update_icon()
