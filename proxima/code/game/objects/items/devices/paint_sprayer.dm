/obj/item/device/floor_painter
	name = "wall painter"

	decals = list(
		"Quarter-turf" =      list("path" = /obj/effect/floor_decal/corner, "precise" = 1, "colored" = 1),
		"Monotile full" =     list("path" = /obj/effect/floor_decal/corner/white/mono, "colored" = 1),
		"Monotile halved" =   list("path" = /obj/effect/floor_decal/corner/white/half, "colored" = 1),
		"hazard stripes" =    list("path" = /obj/effect/floor_decal/industrial/warning),
		"corner, hazard" =    list("path" = /obj/effect/floor_decal/industrial/warning/corner),
		"hatched marking" =   list("path" = /obj/effect/floor_decal/industrial/hatch, "coloured" = 1),
		"dotted outline" =    list("path" = /obj/effect/floor_decal/industrial/outline, "coloured" = 1),
		"loading sign" =      list("path" = /obj/effect/floor_decal/industrial/loading),
		"mosaic, large" =     list("path" = /obj/effect/floor_decal/chapel),
		"1" =                 list("path" = /obj/effect/floor_decal/sign),
		"2" =                 list("path" = /obj/effect/floor_decal/sign/two),
		"A" =                 list("path" = /obj/effect/floor_decal/sign/a),
		"B" =                 list("path" = /obj/effect/floor_decal/sign/b),
		"C" =                 list("path" = /obj/effect/floor_decal/sign/c),
		"D" =                 list("path" = /obj/effect/floor_decal/sign/d),
		"M" =                 list("path" = /obj/effect/floor_decal/sign/m),
		"V" =                 list("path" = /obj/effect/floor_decal/sign/v),
		"CMO" =               list("path" = /obj/effect/floor_decal/sign/cmo),
		"Ex" =                list("path" = /obj/effect/floor_decal/sign/ex),
		"Psy" =               list("path" = /obj/effect/floor_decal/sign/p),
		"remove all decals" = list("path" = /obj/effect/floor_decal/reset)
		)
	paint_dirs = list(
		"north" =       NORTH,
		"northwest" =   NORTHWEST,
		"west" =        WEST,
		"southwest" =   SOUTHWEST,
		"south" =       SOUTH,
		"southeast" =   SOUTHEAST,
		"east" =        EAST,
		"northeast" =   NORTHEAST,
		"precise" = 0
		)
	var/list/preset_colors = list(
		"Beasty brown" =   COLOR_BEASTY_BROWN,
		"Blue" =           COLOR_BLUE_GRAY,
		"Civvie green" =   COLOR_CIVIE_GREEN,
		"Command blue" =   COLOR_COMMAND_BLUE,
		"Cyan" =           COLOR_CYAN,
		"Green" =          COLOR_GREEN,
		"Bottle green" =   COLOR_PALE_BTL_GREEN,
		"Nanotrasen red" = COLOR_NT_RED,
		"Orange" =         COLOR_ORANGE,
		"Pale orange" =    COLOR_PALE_ORANGE,
		"Red" =            COLOR_RED,
		"Sky blue" =       COLOR_DEEP_SKY_BLUE,
		"Titanium" =       COLOR_TITANIUM,
		"Aluminium"=       COLOR_ALUMINIUM,
		"Violet" =         COLOR_VIOLET,
		"White" =          COLOR_WHITE,
		"Yellow" =         COLOR_AMBER,
		"Sol blue" =       COLOR_HULL_BLUE,
		"Bulkhead black" = COLOR_WALL_GUNMETAL,
		"Remove all colors"=null
		)

/obj/item/device/floor_painter/afterattack(var/atom/A, var/mob/user, proximity, params)
	if(!proximity)
		return

	if(istype(A, /turf/simulated/wall))
		paint_wall()
		return

	if(istype(A, /turf/simulated/floor))
		paint_floor()
		return
	return

/obj/item/device/floor_painter/proc/paint_wall(/var/atom/A, var/mob/user)
	if ((A.can_paint == TRUE) && paint_colour)
		A.set_color(paint_color)
		add_fingerprint(user)
		. = TRUE

/obj/item/device/floor_painter/proc/paint_floor(/var/turf/simulated/floor/F, var/mob/user, params)
	if(!F.flooring || !F.flooring.can_paint || F.broken || F.burnt)
		to_chat(user, SPAN_WARNING("\The [src] cannot paint broken or missing tiles."))
		return

	var/list/decal_data = decals[decal]
	var/config_error
	if(!islist(decal_data))
		config_error = 1
	var/painting_decal
	if(!config_error)
		painting_decal = decal_data["path"]
		if(!ispath(painting_decal))
			config_error = 1

	if(config_error)
		to_chat(user, SPAN_WARNING("\The [src] flashes an error light. You might need to reconfigure it."))
		return

	if(F.decals && F.decals.len > 5 && painting_decal != /obj/effect/floor_decal/reset)
		to_chat(user, SPAN_WARNING("\The [F] has been painted too much; you need to clear it off."))
		return
	var/painting_dir = 0

	if(paint_dir == "precise")
		if(!decal_data["precise"])
			painting_dir = user.dir
		else
			var/list/mouse_control = params2list(params)
			var/mouse_x = text2num(mouse_control["icon-x"])
			var/mouse_y = text2num(mouse_control["icon-y"])
			if(isnum(mouse_x) && isnum(mouse_y))
				if(mouse_x <= 16)
					if(mouse_y <= 16)
						painting_dir = WEST
					else
						painting_dir = NORTH
				else
					if(mouse_y <= 16)
						painting_dir = SOUTH
					else
						painting_dir = EAST
			else
				painting_dir = user.dir
	else if(paint_dirs[paint_dir])
		painting_dir = paint_dirs[paint_dir]

	var/painting_colour
	if(decal_data["coloured"] && paint_colour)
		painting_colour = paint_colour

	new painting_decal(F, painting_dir, painting_colour)

/obj/item/device/floor_painter/attack_self(var/mob/user)
	var/choice = input("Do you wish to change the decal type, paint direction, or paint colour?") as null|anything in list("Decal","Direction", "Colour Selector", "Colour Presets")
	if(choice == "Decal")
		choose_decal()
	else if(choice == "Direction")
		choose_direction()
	else if(choice == "Colour Selector")
		choose_colour()
	else if(choice == "Colour Presets")
		choose_preset_color()

/obj/item/device/floor_painter/examine(mob/user)
	..(user)
	to_chat(user, "It is configured to produce the '[decal]' decal with a direction of '[paint_dir]' using [paint_colour] paint.")

/obj/item/device/floor_painter/choose_colour()
	set name = "Choose Colour"
	set desc = "Choose a floor painter colour."
	set category = "Object"
	set src in usr

	if(usr.incapacitated())
		return
	var/new_colour = input(usr, "Choose a colour.", "Floor painter", paint_colour) as color|null
	if(new_colour && new_colour != paint_colour)
		paint_colour = new_colour
		to_chat(usr, SPAN_NOTICE("You set \the [src] to paint with <font color='[paint_colour]'>a new colour</font>."))

/obj/item/device/floor_painter/choose_decal()
	set name = "Choose Decal"
	set desc = "Choose a floor painter decal."
	set category = "Object"
	set src in usr

	if(usr.incapacitated())
		return

	var/new_decal = input("Select a decal.") as null|anything in decals
	if(new_decal && !isnull(decals[new_decal]))
		decal = new_decal
		to_chat(usr, SPAN_NOTICE("You set \the [src] decal to '[decal]'."))

/obj/item/device/floor_painter/choose_direction()
	set name = "Choose Direction"
	set desc = "Choose a floor painter direction."
	set category = "Object"
	set src in usr

	if(usr.incapacitated())
		return

	var/new_dir = input("Select a direction.") as null|anything in paint_dirs
	if(new_dir && !isnull(paint_dirs[new_dir]))
		paint_dir = new_dir
		to_chat(usr, SPAN_NOTICE("You set \the [src] direction to '[paint_dir]'."))

/obj/item/device/floor_painter/verb/choose_preset_color()
	set name = "Choose Preset color"
	set desc = "Choose a preset color."
	set category = "Object"
	set src in usr

	if(usr.incapacitated())
		return
	var/preset = input(usr, "Choose a color.", name, paint_color) as null|anything in preset_colors
	if(usr.incapacitated())
		return
	if(preset && preset != paint_colour)
		paint_colour = preset
		to_chat(usr, SPAN_NOTICE("You set \the [src] to paint with <font color='[paint_colour]'>a new colour</font>."))
