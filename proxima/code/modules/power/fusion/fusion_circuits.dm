/obj/item/electronics/circuitboard/fusion/core_control
	name = T_BOARD("fusion core controller")
	build_path = /obj/machinery/computer/fusion/core_control
	origin_tech = list(TECH_DATA = 4, TECH_ENGINEERING = 4)

/obj/item/electronics/circuitboard/kinetic_harvester
	name = T_BOARD("kinetic harvester")
	build_path = /obj/machinery/kinetic_harvester
	board_type = "machine"
	origin_tech = list(TECH_DATA = 4, TECH_ENGINEERING = 4, TECH_MATERIAL = 4)
	req_components = list(
		/obj/item/stock_parts/manipulator/pico = 2,
		/obj/item/stock_parts/matter_bin/super = 1,
		/obj/item/stock_parts/console_screen = 1,
		/obj/item/stack/cable_coil = 5
		)

/obj/item/electronics/circuitboard/fusion_fuel_compressor
	name = T_BOARD("fusion fuel compressor")
	build_path = /obj/machinery/fusion_fuel_compressor
	board_type = "machine"
	origin_tech = list(TECH_POWER = 3, TECH_ENGINEERING = 4, TECH_MATERIAL = 4)
	req_components = list(
							/obj/item/stock_parts/manipulator/pico = 2,
							/obj/item/stock_parts/matter_bin/super = 2,
							/obj/item/stock_parts/console_screen = 1,
							/obj/item/stack/cable_coil = 5
							)

/obj/item/electronics/circuitboard/fusion_fuel_control
	name = T_BOARD("fusion fuel controller")
	build_path = /obj/machinery/computer/fusion/fuel_control
	origin_tech = list(TECH_DATA = 4, TECH_ENGINEERING = 4)

/obj/item/electronics/circuitboard/gyrotron_control
	name = T_BOARD("gyrotron controller")
	build_path = /obj/machinery/computer/fusion/gyrotron
	origin_tech = list(TECH_DATA = 4, TECH_ENGINEERING = 4)

/obj/item/electronics/circuitboard/fusion_core
	name = T_BOARD("fusion core")
	build_path = /obj/machinery/power/fusion_core
	board_type = "machine"
	origin_tech = list(TECH_BLUESPACE = 2, TECH_MAGNET = 4, TECH_POWER = 4)
	req_components = list(
							/obj/item/stock_parts/manipulator/pico = 2,
							/obj/item/stock_parts/micro_laser/ultra = 1,
							/obj/item/stock_parts/subspace/crystal = 1,
							/obj/item/stock_parts/console_screen = 1,
							/obj/item/stack/cable_coil = 5
							)

/obj/item/electronics/circuitboard/fusion_injector
	name = T_BOARD("fusion fuel injector")
	build_path = /obj/machinery/fusion_fuel_injector
	board_type = "machine"
	origin_tech = list(TECH_POWER = 3, TECH_ENGINEERING = 4, TECH_MATERIAL = 4)
	req_components = list(
							/obj/item/stock_parts/manipulator/pico = 2,
							/obj/item/stock_parts/scanning_module/phasic = 1,
							/obj/item/stock_parts/matter_bin/super = 1,
							/obj/item/stock_parts/console_screen = 1,
							/obj/item/stack/cable_coil = 5
							)

/obj/item/electronics/circuitboard/gyrotron
	name = T_BOARD("gyrotron")
	build_path = /obj/machinery/power/emitter/gyrotron
	board_type = "machine"
	origin_tech = list(TECH_POWER = 4, TECH_ENGINEERING = 4)
	req_components = list(
							/obj/item/stack/cable_coil = 20,
							/obj/item/stock_parts/micro_laser/ultra = 2
							)

/datum/design/research/circuit/fusion
	name = "fusion core control console"
	id = "fusion_core_control"
	build_path = /obj/item/electronics/circuitboard/fusion/core_control
	sort_string = "LAAAD"
	category = CAT_POWER

/datum/design/research/circuit/fusion/fuel_compressor
	name = "fusion fuel compressor"
	id = "fusion_fuel_compressor"
	build_path = /obj/item/electronics/circuitboard/fusion_fuel_compressor
	sort_string = "LAAAE"

/datum/design/research/circuit/fusion/fuel_control
	name = "fusion fuel control console"
	id = "fusion_fuel_control"
	build_path = /obj/item/electronics/circuitboard/fusion_fuel_control
	sort_string = "LAAAF"

/datum/design/research/circuit/fusion/gyrotron_control
	name = "gyrotron control console"
	id = "gyrotron_control"
	build_path = /obj/item/electronics/circuitboard/gyrotron_control
	sort_string = "LAAAG"

/datum/design/research/circuit/fusion/core
	name = "fusion core"
	id = "fusion_core"
	build_path = /obj/item/electronics/circuitboard/fusion_core
	sort_string = "LAAAH"

/datum/design/research/circuit/fusion/injector
	name = "fusion fuel injector"
	id = "fusion_injector"
	build_path = /obj/item/electronics/circuitboard/fusion_injector
	sort_string = "LAAAI"

/datum/design/research/circuit/fusion/kinetic_harvester
	name = "fusion toroid kinetic harvester"
	id = "fusion_kinetic_harvester"
	build_path = /obj/item/electronics/circuitboard/kinetic_harvester
	sort_string = "LAAAJ"

/datum/design/research/circuit/fusion/gyrotron
	name = "gyrotron"
	id = "gyrotron"
	build_path = /obj/item/electronics/circuitboard/gyrotron
	sort_string = "LAAAK"
