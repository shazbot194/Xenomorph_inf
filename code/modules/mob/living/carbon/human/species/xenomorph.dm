/datum/species/xenomorph // /vg/
	name = "Xenomorph"
	name_plural = "Xenomorphs"
	icobase = 'icons/mob/human_races/r_xeno.dmi'
	deform = 'icons/mob/human_races/r_xeno.dmi'  // TODO: Need deform.
	language = "Xenomorph"
	tail = "xenos_drone_tail"
	unarmed_type = /datum/unarmed_attack/punch

	flags = IS_WHITELISTED | NOGUNS | NO_BREATHE
	dietflags = DIET_OMNI
	reagent_tag = PROCESS_ORG

	//default_mutations=list(SKELETON) // This screws things up

	butt_sprite = "plasma"

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

/datum/species/plasmaman/say_filter(mob/M, message, datum/language/speaking)
	if(copytext(message, 1, 2) != "*")
		message = replacetext(message, "s", stutter("ss"))
	return message

