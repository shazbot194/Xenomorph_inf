/datum/species/xenomorph // /vg/
	name = "Xenomorph"
	name_plural = "Xenomorphs"
	icobase = 'icons/mob/human_races/r_xeno.dmi'
	deform = 'icons/mob/human_races/r_xeno.dmi'  // TODO: Need deform.
	language = "Xenomorph"
	tail = "xenos_drone_tail"
	unarmed_type = /datum/unarmed_attack/punch
	darksight = 5

	flags = IS_WHITELISTED | NOGUNS | NO_BREATHE
	bodyflags = HAS_TAIL | NO_EYES
	dietflags = DIET_CARN
	reagent_tag = PROCESS_ORG

	brute_mod = 0.6
	burn_mod = 3.0

	//default_mutations=list(SKELETON) // This screws things up

	butt_sprite = "xeno"

	breath_type = "plasma"


	warning_low_pressure = -1
	hazard_low_pressure = -1
	hazard_high_pressure = 999999999
	warning_high_pressure = 999999999

	cold_level_1 = -1 //Default 260 - Lower is better
	cold_level_2 = -1 //Default 200
	cold_level_3 = -1 //Default 120
	cold_env_multiplier = -1

	heat_level_1 = 350  // Heat damage level 1 above this point.
	heat_level_2 = 400  // Heat damage level 2 above this point.
	heat_level_3 = 500  // Heat damage level 3 above this point.

	blood_color = "#33cc33"
	flesh_color = "#33cc33"
	slowdown = 1
	siemens_coeff = 0

	has_organ = list(
		"brain" = /obj/item/organ/internal/brain/xeno,
		"plasma vessel" = /obj/item/organ/internal/xenos/plasmavessel/drone,
		"resin organ" = /obj/item/organ/internal/xenos/resinspinner
		)

	suicide_messages = list(
		"is twisting their own neck!",
		"is ripping out their organs!",
		"is scooping out their brains!",
		"is something!")

/datum/species/xenomorph/equip(var/mob/living/carbon/human/H)
	// Unequip existing suits and hats.
	H.unEquip(H.wear_glasses)

	H.equip_or_collect(new /glasses=/obj/item/clothing/glasses/xeno(H), slot_wear_glasses)

/obj/item/clothing/mask/gas/golem
	name = "golem's face"
	desc = "the imposing face of an adamantine golem"
	icon_state = "golem"
	item_state = "golem"
	unacidable = 1
	flags = ABSTRACT | NODROP


/obj/item/clothing/glasses/xeno
	name = "xeno eyes"
	desc = "A thick faceplate that protects from bright lights.."
	icon_state = "welding-g"
	item_state = "welding-g"
	flash_protect = 2
	flags = ABSTRACT | NODROP


/datum/species/xenomorph/say_filter(mob/M, message, datum/language/speaking)
	if(copytext(message, 1, 2) != "*")
		message = replacetext(message, "s", stutter("ss"))
	return message

