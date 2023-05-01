/turf/simulated/wall
	var/stripe_color
	can_paint = TRUE

/turf/simulated/wall/examine(mob/user)
	. = ..()

	if(paint_color)
		to_chat(user, "<span class='notice'>It has a coat of paint applied.</span>")
