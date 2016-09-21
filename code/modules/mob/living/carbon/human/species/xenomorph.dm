/datum/species/xenomorph // /vg/
	name = "Xenomorph"
	name_plural = "Xenomorphs"
	icobase = 'icons/mob/human_races/r_plasmaman_sb.dmi'
	deform = 'icons/mob/human_races/r_plasmaman_pb.dmi'  // TODO: Need deform.
	language = "Xenomorph"
	unarmed_type = /datum/unarmed_attack/punch

	flags = IS_WHITELISTED | NOGUNS
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
		"brain" = /obj/item/organ/internal/brain/golem
		)

	suicide_messages = list(
		"is twisting their own neck!",
		"is letting some O2 in!",
		"realizes the existential problem of being made out of plasma!",
		"shows their true colors, which happens to be the color of plasma!")

/datum/species/plasmaman/say_filter(mob/M, message, datum/language/speaking)
	if(copytext(message, 1, 2) != "*")
		message = replacetext(message, "s", stutter("ss"))
	return message


// Plasmamen are so fucking different that they need their own proc.
/datum/species/xenomorph/handle_breath(var/datum/gas_mixture/breath, var/mob/living/carbon/human/H)
	if(status_flags & GODMODE)
		return

	if(!breath || (breath.total_moles() == 0))
		//Aliens breathe in vaccuum
		return 0

	var/toxins_used = 0
	var/breath_pressure = (breath.total_moles() * R_IDEAL_GAS_EQUATION * breath.temperature) / BREATH_VOLUME

	//Partial pressure of the toxins in our breath
	var/Toxins_pp = (breath.toxins / breath.total_moles()) * breath_pressure

	if(Toxins_pp) // Detect toxins in air
		adjustPlasma(breath.toxins*250)
		throw_alert("alien_tox", /obj/screen/alert/alien_tox)

		toxins_used = breath.toxins

	else
		clear_alert("alien_tox")

	//Breathe in toxins and out oxygen
	breath.toxins -= toxins_used
	breath.oxygen += toxins_used

	//BREATH TEMPERATURE
	handle_breath_temperature(breath)

	return 1
