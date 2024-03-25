/*
/obj/effect/spinning_light
	var/spin_rate = 1 SECONDS
	var/_size = 48
	var/_factor = 0.5
	var/_density = 4
	var/_offset = 30
	var/_color = COLOR_ORANGE
	plane = ABOVE_LIGHTING_PLANE
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT


/obj/effect/spinning_light/Initialize()
	. = ..()
	filters = filter(type="rays", size = _size, color = _color, factor = _factor, density = _density, flags = FILTER_OVERLAY, offset = _offset)

	alpha = 200

	//Rays start rotated which made synchronizing the scaling a bit difficult, so let's move it 45 degrees
	var matrix/m = new
	var/matrix/test = new
	test.Turn(-45)
	var/matrix/squished = new
	squished.Scale(1, 0.5)
	animate(src, transform = test * m.Turn(90), spin_rate / 4, loop = -1)
	animate(transform = test * m.Turn(90), spin_rate / 4, loop = -1)
	animate(transform = test * m.Turn(90), spin_rate / 4, loop = -1)
	animate(transform = test * matrix(),   spin_rate / 4, loop = -1)


/obj/effect/spinning_light/proc/set_color(_color)
	filters = filter(type="rays", size = _size, color = _color, factor = _factor, density = _density, flags = FILTER_OVERLAY, offset = _offset)


/obj/machinery/rotating_alarm
	name = "Industrial alarm"
	desc = "An industrial rotating alarm light."
	icon = 'icons/obj/rotating_alarm.dmi'
	icon_state = "alarm"
	idle_power_usage = 0
	active_power_usage = 0
	anchored = TRUE

	var/on = FALSE
	var/low_alarm = FALSE

	var/obj/effect/spinning_light/spin_effect = null

	var/alarm_light_color = COLOR_ORANGE
	/// This is an angle to rotate the colour of alarm and its light. Default is orange, so, a 45 degree angle clockwise will make it green
	var/angle = 0

	var/static/list/spinning_lights_cache = list()


/obj/machinery/rotating_alarm/Initialize()
	. = ..()

	//Setup colour
	var/list/color_matrix = color_rotation(angle)

	color = color_matrix

	set_color(alarm_light_color)

	setDir(dir) //Set dir again so offsets update correctly


/obj/machinery/rotating_alarm/setDir(ndir) //Due to effect, offsets cannot be part of sprite, so need to set it for each dir
	. = ..()
	if(dir == NORTH)
		pixel_y = -13
	if(dir == SOUTH)
		pixel_y = 28
	if(dir == WEST)
		pixel_x = 20
	if(dir == EAST)
		pixel_x = -20


/obj/machinery/rotating_alarm/proc/set_color(color)
	if (on)
		vis_contents -= spin_effect
	if (isnull(spinning_lights_cache["[color]"]))
		spinning_lights_cache["[color]"] = new /obj/effect/spinning_light()
	spin_effect = spinning_lights_cache["[color]"]
	alarm_light_color = color

	var/RGB = RotateHue(alarm_light_color, angle)

	alarm_light_color = RGB
	spin_effect.set_color(color)
	if (on)
		vis_contents += spin_effect


/obj/machinery/rotating_alarm/proc/set_on()
	vis_contents += spin_effect
	set_light(1, 0.5, 2, 0.3, l_color = alarm_light_color)
	on = TRUE
	low_alarm = FALSE


/obj/machinery/rotating_alarm/proc/set_off()
	vis_contents -= spin_effect
	set_light(0)
	on = FALSE
	low_alarm = FALSE

/obj/machinery/rotating_alarm/supermatter
	name = "Supermatter alarm"
	desc = "An industrial rotating alarm light. This one is used to monitor supermatter engines."
	frame_type = /obj/item/frame/supermatter_alarm
	construct_state = /singleton/machine_construction/default/item_chassis
	base_type = /obj/machinery/rotating_alarm/supermatter

/obj/machinery/rotating_alarm/supermatter/Initialize()
	. = ..()
	GLOB.supermatter_status.register_global(src, .proc/check_supermatter)
/obj/machinery/rotating_alarm/supermatter/Destroy()
	GLOB.supermatter_status.unregister_global(src, .proc/check_supermatter)
	. = ..()
/obj/machinery/rotating_alarm/supermatter/proc/check_supermatter(obj/machinery/power/supermatter/SM, danger)
	if (SM)
		if (SM.z in GetConnectedZlevels(src.z))
			if (danger && !on)
				set_on()
			else if (!danger && on)
				set_off()
var/datum/looping_sound/gasmask/soundloop

/datum/looping_sound/security_alarm

	mid_sounds = list('modular_thabes/modules/shit_for_event/sound/gasmask.ogg'=1)
	mid_length = 2.9 SECONDS
	volume = 50
*/

/datum/looping_sound/industrial_alarm
	mid_sounds = list('modular_thabes/modules/shit_for_event/sound/gasmask.ogg'=1)
	mid_length = 2.9 SECONDS
	volume = 50

/obj/machinery/firealarm/industrial
	name = "industrial fire alarm"
	icon = 'modular_thabes/modules/shit_for_event/icons/monitors_custom.dmi'
	var/datum/looping_sound/industrial_alarm/soundloop

/obj/machinery/firealarm/Initialize(mapload, dir, building)
	. = ..()
	if(building)
		buildstage = 0
		panel_open = TRUE
		if(dir)
			setDir(dir)
	update_appearance()
	myarea = get_area(src)
	LAZYADD(myarea.firealarms, src)

/obj/machinery/firealarm/Destroy()
	myarea.firereset(src)
	LAZYREMOVE(myarea.firealarms, src)
	return ..()

/obj/machinery/firealarm/update_icon_state()
	if(panel_open)
		icon_state = "fire_b[buildstage]"
		return ..()

	if(machine_stat & BROKEN)
		icon_state = "firex"
		return ..()

	icon_state = "fire0"
	return ..()

/obj/machinery/firealarm/update_overlays()
	. = ..()
	if(machine_stat & NOPOWER)
		return


	. += "fire_[SEC_LEVEL_GREEN]"
	SSvis_overlays.add_vis_overlay(src, icon, "fire_[SEC_LEVEL_GREEN]", layer, plane, dir)
	SSvis_overlays.add_vis_overlay(src, icon, "fire_[SEC_LEVEL_GREEN]", layer, EMISSIVE_PLANE, dir)

	var/area/A = get_area(src)

	if(!detecting || !A.fire)
		. += "fire_off"
		SSvis_overlays.add_vis_overlay(src, icon, "fire_off", layer, plane, dir)
		SSvis_overlays.add_vis_overlay(src, icon, "fire_off", layer, EMISSIVE_PLANE, dir)
	else if(obj_flags & EMAGGED)
		. += "fire_emagged"
		SSvis_overlays.add_vis_overlay(src, icon, "fire_emagged", layer, plane, dir)
		SSvis_overlays.add_vis_overlay(src, icon, "fire_emagged", layer, EMISSIVE_PLANE, dir)
	else
		. += "fire_on"
		SSvis_overlays.add_vis_overlay(src, icon, "fire_on", layer, plane, dir)
		SSvis_overlays.add_vis_overlay(src, icon, "fire_on", layer, EMISSIVE_PLANE, dir)

/obj/machinery/firealarm/emp_act(severity)
	. = ..()

	if (. & EMP_PROTECT_SELF)
		return

	if(prob(50 / severity))
		alarm()

/obj/machinery/firealarm/emag_act(mob/user)
	if(obj_flags & EMAGGED)
		return
	obj_flags |= EMAGGED
	update_appearance()
	if(user)
		user.visible_message("<span class='warning'>Sparks fly out of [src]!</span>",
							"<span class='notice'>You emag [src], disabling its thermal sensors.</span>")
	playsound(src, "sparks", 50, TRUE, SHORT_RANGE_SOUND_EXTRARANGE)

/obj/machinery/firealarm/temperature_expose(datum/gas_mixture/air, temperature, volume)
	if((temperature > T0C + 200 || temperature < HUMAN_BODYTEMP_COLD_DAMAGE_LIMIT) && (last_alarm+FIREALARM_COOLDOWN < world.time) && !(obj_flags & EMAGGED) && detecting && !machine_stat)
		alarm()
	..()

/obj/machinery/firealarm/proc/alarm(mob/user)
	if(!is_operational || (last_alarm+FIREALARM_COOLDOWN > world.time))
		return
	last_alarm = world.time
	var/area/A = get_area(src)
	A.firealert(src)
	playsound(loc, 'sound/machines/FireAlarm.ogg', 75)
	if(user)
		log_game("[user] triggered a fire alarm at [COORD(src)]")

/obj/machinery/firealarm/proc/reset(mob/user)
	if(!is_operational)
		return
	var/area/A = get_area(src)
	A.firereset()
	if(user)
		log_game("[user] reset a fire alarm at [COORD(src)]")
