//Shine levels
#define SHINE_MATTE 0
#define SHINE_REFLECTIVE 1
#define SHINE_SHINY 2

/obj/effect/mapping_helpers/turf_shiny_helper
	name = "Shiny Helper"
	icon_state = "shiner"
	var/new_shine = SHINE_REFLECTIVE

/obj/effect/mapping_helpers/turf_shiny_helper/Initialize(mapload)
	. = ..()
	var/turf/current_turf = get_turf(src)
	current_turf.AddComponent(/datum/component/shiny, SHINE_REFLECTIVE)

/datum/component/shiny
	///Reflective overlay
	var/mutable_appearance/reflection
	var/shine = SHINE_MATTE

/datum/component/shiny/Initialize(_shine = SHINE_REFLECTIVE, _relfection_plane = REFLECTIVE_PLANE)
	. = ..()
	shine = _shine
	on_update_overlays(_relfection_plane=_relfection_plane)

/datum/component/shiny/RegisterWithParent()
	var/atom/current_thing = parent
	current_thing.update_appearance()

	ADD_TRAIT(parent, TRAIT_SHINY, REF(src))
	RegisterSignal(parent, COMSIG_ATOM_UPDATE_OVERLAYS, PROC_REF(on_update_overlays))
	RegisterSignal(parent, COMSIG_ATOM_SMOOTHED_ICON, PROC_REF(on_smoothed_icon))
	RegisterSignal(parent, COMSIG_ATOM_DESTROY_SHINY, PROC_REF(destroy_self))

/datum/component/shiny/UnregisterFromParent()
	var/atom/current_thing = parent
	current_thing.update_appearance()

	REMOVE_TRAIT(parent, TRAIT_SHINY, REF(src))
	UnregisterSignal(parent, COMSIG_ATOM_UPDATE_OVERLAYS)
	UnregisterSignal(parent, COMSIG_ATOM_SMOOTHED_ICON)
	UnregisterSignal(parent, COMSIG_ATOM_DESTROY_SHINY)

	current_thing.cut_overlay(reflection)
	shine = SHINE_MATTE

	if(!QDELETED(current_thing))
		current_thing.update_appearance()

/// Used to maintain the shiny overlays on the parent [/atom].
/datum/component/shiny/proc/on_update_overlays(atom/source, list/overlays, _relfection_plane = REFLECTIVE_PLANE)
	SIGNAL_HANDLER

	var/atom/current_thing = parent

	var/r_overlay
	switch(shine)
		if(SHINE_MATTE)
			return
		if(SHINE_REFLECTIVE)
			r_overlay = "partialOverlay"
		if(SHINE_SHINY)
			r_overlay = "whiteOverlay"
	reflection = mutable_appearance('icons/effects/shine.dmi', r_overlay, plane = _relfection_plane)

	current_thing.add_overlay(reflection)


/datum/component/shiny/proc/on_smoothed_icon(atom/source)
	SIGNAL_HANDLER

	source.update_appearance(~UPDATE_SMOOTHING)

/datum/component/shiny/proc/destroy_self()
	qdel(src)
