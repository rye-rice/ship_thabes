/obj/item/sharpener
	name = "whetstone"
	icon = 'icons/obj/kitchen.dmi'
	icon_state = "sharpener"
	desc = "A block that makes things sharp."
	force = 5
	var/used = 0
	var/increment = 4
	var/max = 30
	var/prefix = "sharpened"
	var/requires_sharpness = 1


/obj/item/sharpener/attackby(obj/item/I, mob/user, params)
	if(used)
		to_chat(user, span_warning("The sharpening block is too worn to use again!"))
		return
	if(I.force >= max || I.throwforce >= max)//no esword sharpening
		to_chat(user, span_warning("[I] is much too powerful to sharpen further!"))
		return
	if(requires_sharpness && !I.get_sharpness())
		to_chat(user, span_warning("You can only sharpen items that are already sharp, such as knives!"))
		return
	if(istype(I, /obj/item/melee/energy))
		to_chat(user, span_warning("You don't think \the [I] will be the thing getting modified if you use it on \the [src]!"))
		return

	var/signal_out = SEND_SIGNAL(I, COMSIG_ITEM_SHARPEN_ACT, increment, max)
	if(signal_out & COMPONENT_BLOCK_SHARPEN_MAXED)
		to_chat(user, span_warning("[I] is much too powerful to sharpen further!"))
		return
	if(signal_out & COMPONENT_BLOCK_SHARPEN_BLOCKED)
		to_chat(user, span_warning("[I] is not able to be sharpened right now!"))
		return
	if((signal_out & COMPONENT_BLOCK_SHARPEN_ALREADY) || (I.force > initial(I.force) && !signal_out))
		to_chat(user, span_warning("[I] has already been refined before. It cannot be sharpened further!"))
		return
	if(!(signal_out & COMPONENT_BLOCK_SHARPEN_APPLIED))
		I.force = clamp(I.force + increment, 0, max)
		I.wound_bonus = I.wound_bonus + increment
	user.visible_message(span_notice("[user] sharpens [I] with [src]!"), span_notice("You sharpen [I], making it much more deadly than before."))
	playsound(src, 'sound/items/unsheath.ogg', 25, TRUE)
	I.sharpness = SHARP_POINTY
	I.throwforce = clamp(I.throwforce + increment, 0, max)
	I.name = "[prefix] [I.name]"
	name = "worn out [name]"
	desc = "[desc] At least, it used to."
	used = 1
	update_appearance()

/obj/item/sharpener/super
	name = "super whetstone"
	desc = "A block of the frontier's most advanced edge winnowing technology. Be careful, it's sharp!"
	increment = 15
	max = 40
	prefix = "razor-sharp"

/obj/item/sharpener/giga
	name = "giga whetstone"
	desc = "A block that will make your weapon sharper than Einstein on adderall."
	increment = 200
	max = 200
	prefix = "balance-destroying"
	requires_sharpness = 0
