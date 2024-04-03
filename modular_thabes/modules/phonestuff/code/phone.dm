GLOBAL_LIST_EMPTY_TYPED(transmitters, /obj/structure/transmitter)

/obj/structure/transmitter
	name = "telephone receiver"
	icon = 'modular_thabes/modules/phonestuff/icons/obj.dmi'
	icon_state = "wall_phone"
	desc = "It is a wall mounted telephone. Uses 8G to communicate across local space, although it cant reach any further than the sector."
	force = 0

	var/phone_category = "Uncategorised"
	var/phone_color = "white"
	var/phone_id = "Telephone"
	var/phone_icon

	var/auto_name = TRUE

	var/obj/item/phone/attached_to

	var/obj/structure/transmitter/calling
	var/obj/structure/transmitter/caller

	var/next_ring = 0

	var/phone_type = /obj/item/phone

	var/range = 7

	var/enabled = TRUE
	var/callable = TRUE

	var/timeout_timer_id
	var/timeout_duration = 30 SECONDS

/obj/structure/transmitter/hidden
	callable = FALSE

/obj/structure/transmitter/Initialize(mapload, ...)
	. = ..()
	base_icon_state = icon_state

	attached_to = new phone_type(src)
	RegisterSignal(attached_to, COMSIG_PARENT_PREQDELETED, .proc/override_delete)
	update_icon()

	if(!get_turf(src))
		return

	GLOB.transmitters += src

	if(auto_name)
		var/area/area = get_area(src)
		if(area)
			phone_id = area.name
			if(istype(area, /area/ship))
				phone_category = "Vessels"

/obj/structure/transmitter/examine(mob/user)
	. = ..()
	. += "<span class='notice'>You can use a multitool on it to change it's name and category.</span>"

/obj/structure/transmitter/update_icon()
	. = ..()
	SEND_SIGNAL(src, COMSIG_TRANSMITTER_UPDATE_ICON)
	if(attached_to.loc != src)
		icon_state = "[base_icon_state]_ear"
		return

	if(caller)
		icon_state = "[base_icon_state]_ring"
	else
		icon_state = base_icon_state

/obj/structure/transmitter/proc/override_delete()
	SIGNAL_HANDLER
	recall_phone()
	return QDEL_HINT_LETMELIVE


#define TRANSMITTER_UNAVAILABLE(T) (\
	T.get_calling_phone() \
	|| !T.attached_to \
	|| T.attached_to.loc != T \
	|| !T.enabled\
)

/proc/get_transmitters()
	var/list/phone_list = list()

	for(var/t in GLOB.transmitters)
		var/obj/structure/transmitter/T = t
		if(TRANSMITTER_UNAVAILABLE(T) || !T.callable) // Phone not available
			continue

		var/id = T.phone_id
		var/num_id = 1
		while(id in phone_list)
			id = "[T.phone_id] [num_id]"
			num_id++

		T.phone_id = id
		phone_list[id] = T

	return phone_list

/obj/structure/transmitter/ui_status(mob/user, datum/ui_state/state)
	. = ..()
	if(TRANSMITTER_UNAVAILABLE(src))
		return UI_CLOSE

/obj/structure/transmitter/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(.)
		return

	if(TRANSMITTER_UNAVAILABLE(src))
		return

	if(!ishuman(usr))
		return

	var/mob/living/carbon/human/user = usr

	switch(action)
		if("call_phone")
			call_phone(user, params["phone_id"])
			. = TRUE
			SStgui.close_uis(src)

	update_icon()

/obj/structure/transmitter/ui_static_data(mob/user)
	. = list()

	.["available_transmitters"] = get_transmitters() - list(phone_id)
	var/list/transmitters = list()
	for(var/i in GLOB.transmitters)
		var/obj/structure/transmitter/T = i
		transmitters += list(list(
			"phone_category" = T.phone_category,
			"phone_color" = T.phone_color,
			"phone_id" = T.phone_id,
			"phone_icon" = T.phone_icon
		))

	.["transmitters"] = transmitters

/obj/structure/transmitter/proc/call_phone(var/mob/living/carbon/human/user, calling_phone_id)
	var/list/transmitters = get_transmitters()
	transmitters -= phone_id

	if(!length(transmitters) || !(calling_phone_id in transmitters))
		to_chat(user, span_purple("[icon2html(src, user)] No transmitters could be located to call!"))
		return

	var/obj/structure/transmitter/T = transmitters[calling_phone_id]
	if(!istype(T) || QDELETED(T))
		transmitters -= T
		CRASH("Qdelled/improper atom inside transmitters list! (istype returned: [istype(T)], QDELETED returned: [QDELETED(T)])")

	if(TRANSMITTER_UNAVAILABLE(T))
		return

	calling = T
	T.caller = src
	T.update_icon()

	to_chat(user, span_purple("[icon2html(src, user)] Dialing [calling_phone_id].."))
	playsound(src, 'sound/machines/telephone/rtb_handset_1.ogg')
	timeout_timer_id = addtimer(CALLBACK(src, .proc/reset_call, TRUE), timeout_duration, TIMER_UNIQUE|TIMER_OVERRIDE|TIMER_STOPPABLE)

	START_PROCESSING(SSobj, src)
	START_PROCESSING(SSobj, T)

	user.put_in_active_hand(attached_to)
	attached_to.setup_signal(user)

/obj/structure/transmitter/attack_hand(mob/user)
	. = ..()

	if(!attached_to || attached_to.loc != src)
		return

	if(!ishuman(user))
		return

	if(!enabled)
		return

	if(!get_calling_phone())
		ui_interact(user)
		return

	var/obj/structure/transmitter/T = get_calling_phone()

	if(T.attached_to && ismob(T.attached_to.loc))
		var/mob/M = T.attached_to.loc
		to_chat(M, span_purple("[icon2html(src, M)] [phone_id] has picked up."))
		if(T.timeout_timer_id)
			deltimer(T.timeout_timer_id)
			T.timeout_timer_id = null

	to_chat(user, span_purple("[icon2html(src, user)] Picked up a call from [T.phone_id]."))
	playsound(src, 'sound/machines/telephone/rtb_handset_1.ogg')

	user.put_in_active_hand(attached_to)
	attached_to.setup_signal(user)

	update_icon()


#undef TRANSMITTER_UNAVAILABLE

/obj/structure/transmitter/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "PhoneMenu", phone_id)
		ui.open()

/obj/structure/transmitter/proc/reset_call(var/timeout = FALSE)
	var/obj/structure/transmitter/T = get_calling_phone()
	if(T)
		if(T.attached_to && ismob(T.attached_to.loc))
			var/mob/M = T.attached_to.loc
			to_chat(M, span_purple("[icon2html(src, M)] [phone_id] has hung up on you."))

		if(attached_to && ismob(attached_to.loc))
			var/mob/M = attached_to.loc
			if(timeout)
				to_chat(M, span_purple("[icon2html(src, M)] Your call to [T.phone_id] has reached voicemail, you immediately disconnect the line."))
			else
				to_chat(M, span_purple("[icon2html(src, M)] You have hung up on [T.phone_id]."))

	if(calling)
		calling.caller = null
		calling = null

	if(caller)
		caller.calling = null
		caller = null

	if(timeout_timer_id)
		deltimer(timeout_timer_id)
		timeout_timer_id = null

	if(T)
		if(T.timeout_timer_id)
			deltimer(T.timeout_timer_id)
			T.timeout_timer_id = null

		T.update_icon()
		STOP_PROCESSING(SSobj, T)

	STOP_PROCESSING(SSobj, src)

/obj/structure/transmitter/process()
	if(caller)
		if(!attached_to)
			STOP_PROCESSING(SSobj, src)
			return

		if(attached_to.loc == src)
			if(next_ring < world.time)
				playsound(loc, 'sound/machines/telephone/telephone_ring.ogg', 75)
				visible_message(span_warning("[src] rings vigorously!"))
				next_ring = world.time + 3 SECONDS

	else if(calling)
		var/obj/structure/transmitter/T = get_calling_phone()
		if(!T)
			STOP_PROCESSING(SSobj, src)
			return

		var/obj/item/phone/P = T.attached_to

		if(P && attached_to.loc == src && P.loc == T && next_ring < world.time)
			playsound(get_turf(attached_to), 'sound/machines/telephone/telephone_ring.ogg', 20, FALSE, 14)
			visible_message(span_warning("[src] rings vigorously!"))
			next_ring = world.time + 3 SECONDS

	else
		STOP_PROCESSING(SSobj, src)
		return


/obj/structure/transmitter/proc/recall_phone()
	if(ismob(attached_to.loc))
		var/mob/M = attached_to.loc
		M.dropItemToGround(attached_to)
		playsound(src, 'sound/machines/telephone/rtb_handset_1.ogg', 100, FALSE, 7)

	attached_to.forceMove(src)
	reset_call()

	update_icon()

/obj/structure/transmitter/proc/get_calling_phone()
	if(calling)
		return calling
	else if(caller)
		return caller

	return

/obj/structure/transmitter/proc/handle_speak(datum/source, list/speech_args, mob/living/speaker)
	SIGNAL_HANDLER

//	if(language.flags & TONGUELESS_SPEECH)
//		return

	var/obj/structure/transmitter/T = get_calling_phone()
	if(!istype(T))
		return

	var/obj/item/phone/P = T.attached_to

	if(!P || !attached_to)
		return

	P.handle_hear(source, speech_args, speaker)
	attached_to.handle_hear(source, speech_args, speaker)

/obj/structure/transmitter/attackby(obj/item/W, mob/user)
	if(W == attached_to)
		recall_phone()
	if(istype(W, /obj/item/multitool))
		rename_phone(user)
	else
		. = ..()


/obj/structure/transmitter/proc/rename_phone(mob/user)
	var/choices = list(
	PHONE_RENAME_CAT,
	PHONE_RENAME_ID,
	)
	var/picked = tgui_input_list(user, "Rename which field?", "Rename what?" , sortList(choices))

	if(isnull(picked))
		return
	switch(picked)
		if(PHONE_RENAME_CAT)
			var/input = stripped_input(user,"What category do you want to set [src.name] to?", ,"", MAX_NAME_LEN)
			if(input)
				phone_category = input
				to_chat(user, "<span class='notice'>You set the phone category to [input].</span>")

		if(PHONE_RENAME_ID)
			var/input = stripped_input(user,"What do you want to name [src.name]?", ,"", MAX_NAME_LEN)
			if(input)
				phone_id = input
				to_chat(user, "<span class='notice'>You set the phone name to [input].</span>")
				auto_name = FALSE


/obj/structure/transmitter/Destroy()
	if(attached_to)
		if(attached_to.loc == src)
			UnregisterSignal(attached_to, COMSIG_PARENT_PREQDELETED)
			qdel(attached_to)
		else
			attached_to.attached_to = null
			attached_to = null

	GLOB.transmitters -= src
	SStgui.close_uis(src)

	reset_call()
	return ..()

/obj/item/phone
	name = "telephone"
	icon = 'modular_thabes/modules/phonestuff/icons/obj.dmi'
	icon_state = "rpb_phone"

	w_class = WEIGHT_CLASS_BULKY

	var/obj/structure/transmitter/attached_to

	var/raised = FALSE
	var/zlevel_transfer = FALSE
	var/zlevel_transfer_timer = TIMER_ID_NULL
	var/zlevel_transfer_timeout = 5 SECONDS

	force = 0
	throwforce = 0

/obj/item/phone/Initialize(mapload)
	. = ..()
	if(istype(loc, /obj/structure/transmitter))
		attach_to(loc)

/obj/item/phone/Destroy()
	remove_attached()
	return ..()

/obj/item/phone/Moved()
	. = ..()
	check_range()

/obj/item/phone/proc/check_range()
	SIGNAL_HANDLER

	if(!attached_to)
		return

	if(!in_range(src,attached_to))
		var/mob/living/holder = loc
		if(istype(holder))
			to_chat(holder, "<span class='warning'>[src] overextends and come out of your hands!</span>")
		else
			visible_message("<span class='notice'>[src] flies back to [attached_to].</span>")
		forceMove(get_turf(attached_to))

/obj/item/phone/proc/handle_speak(datum/source, list/speech_args, mob/living/speaker)
	SIGNAL_HANDLER

	if(!attached_to || loc == attached_to)
		UnregisterSignal(speaker, COMSIG_MOB_SAY)
		return

	attached_to.handle_speak(source, speech_args, speaker)

/obj/item/phone/proc/handle_hear(datum/source, list/speech_args, mob/living/speaker)
	var/new_message = speech_args[SPEECH_MESSAGE]
	var/language = speech_args[SPEECH_LANGUAGE]
	if(!attached_to)
		return

	var/obj/structure/transmitter/T = attached_to.get_calling_phone()

	if(!T)
		return

	if(!ismob(loc))
		return

	if(!raised)
		new_message = stars(new_message, 40)

	var/composed_message = compose_message(speaker, language, new_message, FREQ_PHONE)

	var/mob/living/carbon/M = loc

	for(var/mob/dead/observer/observer in GLOB.player_list)
		if(M.client.prefs.chat_toggles & CHAT_GHOSTRADIO)
			observer.Hear(composed_message, speaker, language, new_message, FREQ_PHONE)

	M.Hear(composed_message, speaker, language, new_message, FREQ_PHONE)

/obj/item/phone/proc/attach_to(var/obj/structure/transmitter/to_attach)
	if(!istype(to_attach))
		return

	remove_attached()

	attached_to = to_attach


/obj/item/phone/proc/remove_attached()
	attached_to = null

/obj/item/phone/attack_hand(mob/user)
	if(attached_to && get_dist(user, attached_to) > attached_to.range)
		return FALSE
	return ..()

/obj/item/phone/attack_self(mob/user)
	..()
	if(raised)
		set_raised(FALSE, user)
		to_chat(user, span_notice("You lower [src]."))
	else
		set_raised(TRUE, user)
		to_chat(user, span_notice("You raise [src] to your ear."))


/obj/item/phone/proc/set_raised(var/to_raise, var/mob/living/carbon/human/H)
	if(!istype(H))
		return

	if(!to_raise)
		raised = FALSE
		item_state = "rpb_phone"

		if(istype(H.ears, /obj/item/radio))
			var/obj/item/radio/R = H.ears
			R?.on = TRUE
	else
		raised = TRUE
		item_state = "rpb_phone_ear"

		if(istype(H.ears, /obj/item/radio))
			var/obj/item/radio/R = H.ears
			R?.on = FALSE

	H.update_inv_hands()

/obj/item/phone/dropped(var/mob/user)
	. = ..()
	UnregisterSignal(user, COMSIG_MOB_SAY)
	UnregisterSignal(user, COMSIG_MOVABLE_MOVED)

	set_raised(FALSE, user)

/obj/item/phone/on_enter_storage(obj/item/storage/S)
	. = ..()
	if(attached_to)
		attached_to.recall_phone()

/obj/item/phone/pickup(mob/user)
	. = ..()
	setup_signal(user)

/obj/item/phone/proc/setup_signal(mob/user)
	RegisterSignal(user, COMSIG_MOB_SAY, .proc/handle_speak)
	RegisterSignal(user, COMSIG_MOVABLE_MOVED, .proc/check_range)

/obj/item/phone/proc/do_zlevel_check()
	if(!attached_to || !loc.z || !attached_to.z)
		return FALSE

	if(zlevel_transfer)
		if(loc.z == attached_to.z)
			zlevel_transfer = FALSE
			if(zlevel_transfer_timer)
				deltimer(zlevel_transfer_timer)
			UnregisterSignal(attached_to, COMSIG_MOVABLE_MOVED)
			return FALSE
		return TRUE

	if(attached_to && loc.z != attached_to.z)
		zlevel_transfer = TRUE
		RegisterSignal(attached_to, COMSIG_MOVABLE_MOVED, .proc/transmitter_move_handler)
		return TRUE
	return FALSE

/obj/item/phone/proc/transmitter_move_handler(var/datum/source)
	SIGNAL_HANDLER
	zlevel_transfer = FALSE
	if(zlevel_transfer_timer)
		deltimer(zlevel_transfer_timer)
	UnregisterSignal(attached_to, COMSIG_MOVABLE_MOVED)

//rotary desk phones (need a touch tone handset at some point)
/obj/structure/transmitter/rotary
	name = "rotary telephone"
	icon_state = "rotary_phone"
	desc = "The finger plate is a little stiff."

/obj/structure/transmitter/touchtone
	name = "touch-tone telephone"
	icon_state = "rotary_phone"//placeholder
	desc = "Ancient aliens, its all true. I'm an expert just like you!"
