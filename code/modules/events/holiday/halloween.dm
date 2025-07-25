/datum/round_event_control/spooky
	name = "2 SPOOKY! (Halloween)"
	holidayID = HALLOWEEN
	typepath = /datum/round_event/spooky
	weight = -1							//forces it to be called, regardless of weight
	max_occurrences = 1
	earliest_start = 0 MINUTES
	category = EVENT_CATEGORY_HOLIDAY

/datum/round_event/spooky/start()
	..()
	for(var/i in GLOB.human_list)
		var/mob/living/carbon/human/H = i
		var/obj/item/storage/backpack/b = locate() in H.contents
		if(b)
			new /obj/item/storage/spooky(b)

	for(var/mob/living/simple_animal/pet/dog/corgi/Ian/Ian in GLOB.mob_living_list)
		Ian.place_on_head(new /obj/item/bedsheet(Ian))
	for(var/mob/living/simple_animal/parrot/Polly/Polly in GLOB.mob_living_list)
		new /mob/living/simple_animal/parrot/Polly/ghost(Polly.loc)
		qdel(Polly)

/datum/round_event/spooky/announce(fake)
	priority_announce(pick("RATTLE ME BONES!","THE RIDE NEVER ENDS!", "A SKELETON POPS OUT!", "SPOOKY SCARY SKELETONS!", "CREWMEMBERS BEWARE, YOU'RE IN FOR A SCARE!") , "THE CALL IS COMING FROM INSIDE THE HOUSE")

//spooky foods (you can't actually make these when it's not halloween)
/obj/item/food/cookie/sugar/spookyskull
	name = "skull cookie"
	desc = "Spooky! It's got delicious calcium flavouring!"
	icon = 'icons/obj/halloween_items.dmi'
	icon_state = "skeletoncookie"

/obj/item/food/cookie/sugar/spookycoffin
	name = "coffin cookie"
	desc = "Spooky! It's got delicious coffee flavouring!"
	icon = 'icons/obj/halloween_items.dmi'
	icon_state = "coffincookie"

//spooky items

/obj/item/storage/spooky
	name = "trick-o-treat bag"
	desc = "A pumpkin-shaped bag that holds all sorts of goodies!"
	icon = 'icons/obj/halloween_items.dmi'
	icon_state = "treatbag"

/obj/item/storage/spooky/Initialize()
	. = ..()
	for(var/distrobuteinbag in 0 to 5)
		var/type = pick(/obj/item/food/cookie/sugar/spookyskull,
		/obj/item/food/cookie/sugar/spookycoffin,
		/obj/item/food/candy_corn,
		/obj/item/food/candy,
		/obj/item/food/candiedapple,
		/obj/item/food/chocolatebar,
		/obj/item/organ/brain ) // OH GOD THIS ISN'T CANDY!
		new type(src)

/obj/item/card/emag/halloween
	name = "hack-o'-lantern"
	desc = "It's a pumpkin with a cryptographic sequencer sticking out."
	icon_state = "hack_o_lantern"
