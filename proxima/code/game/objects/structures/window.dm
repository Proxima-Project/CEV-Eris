/obj/structure/window
	can_paint = TRUE

/turf/structure/window/examine(mob/user)
	. = ..()

	if(paint_color)
		to_chat(user, "<span class='notice'>It has a coat of paint applied.</span>")
