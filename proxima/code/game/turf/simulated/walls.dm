/turf/simulated/wall
	var/paint_color
	var/stripe_color
	var/can_be_colored = TRUE

/turf/simulated/wall/proc/get_color()
	return paint_color

/turf/simulated/wall/proc/set_color(var/color)
	paint_color = color
	update_icon()

/turf/simulated/wall/examine(mob/user)
	. = ..()

	if(paint_color)
		to_chat(user, "<span class='notice'>It has a coat of paint applied.</span>")
