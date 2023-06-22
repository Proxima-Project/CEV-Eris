/obj/item/organ/external/robotic/veymed
	name = "\"Vey-Med\""
	desc = "Fragile, sophisticated, and hell of expensive."
	armor = list(melee = -1, bullet = -1, energy = -1, bomb = -10, bio = 100, rad = 100)
	force_icon = 'proxima/icons/mob/human_races/vey-med.dmi'
	model = "veymed"
	min_broken_damage = 30
	min_malfunction_damage = 15
	price_tag = 10000
	bad_type = /obj/item/organ/external/robotic/veymed

/obj/item/organ/external/robotic/veymed/l_arm
	default_description = /datum/organ_description/arm/left

/obj/item/organ/external/robotic/veymed/r_arm
	default_description = /datum/organ_description/arm/right

/obj/item/organ/external/robotic/veymed/l_leg
	default_description = /datum/organ_description/leg/left

/obj/item/organ/external/robotic/veymed/r_leg
	default_description = /datum/organ_description/leg/right

/obj/item/organ/external/robotic/veymed/groin
	default_description = /datum/organ_description/groin

/obj/item/organ/external/robotic/veymed/torso
	default_description = /datum/organ_description/chest

/obj/item/organ/external/robotic/veymed/head
	default_description = /datum/organ_description/head

/datum/body_modification/limb/prosthesis/veymed
	id = "prosthesis_veymed"
	replace_limb = /obj/item/organ/external/robotic/veymed
	body_parts = list(BP_L_ARM, BP_R_ARM, BP_L_LEG, BP_R_LEG, BP_CHEST, BP_GROIN, BP_HEAD)
	icon = 'proxima/icons/mob/human_races/vey-med.dmi'
