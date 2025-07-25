/obj/machinery/vending/autodrobe
	name = "\improper AutoDrobe"
	desc = "A vending machine for costumes."
	icon_state = "theater"
	icon_deny = "theater-deny"
	req_access = list(ACCESS_THEATRE)
	product_slogans = "Dress for success!;Suited and booted!;It's show time!;Why leave style up to fate? Use AutoDrobe!"
	vend_reply = "Thank you for using AutoDrobe!"
	products = list(
		/obj/item/clothing/under/costume/gladiator = 1,
		/obj/item/clothing/head/helmet/gladiator = 1,
		/obj/item/clothing/under/rank/command/captain/suit = 1,
		/obj/item/clothing/under/rank/command/captain/suit/skirt = 1,
		/obj/item/clothing/head/flatcap = 1,
		/obj/item/clothing/suit/toggle/labcoat/mad = 1,
		/obj/item/clothing/shoes/jackboots = 1,
		/obj/item/clothing/under/costume/schoolgirl = 1,
		/obj/item/clothing/under/costume/schoolgirl/red = 1,
		/obj/item/clothing/under/costume/schoolgirl/green = 1,
		/obj/item/clothing/under/costume/schoolgirl/orange = 1,
		/obj/item/clothing/head/kitty = 1,
		/obj/item/clothing/under/dress/skirt/color = 1,
		/obj/item/clothing/head/beret = 1,
		/obj/item/clothing/head/cowboy = 1, //WS - Yee Haw
		/obj/item/clothing/accessory/waistcoat = 1,
		/obj/item/clothing/under/suit/black = 1,
		/obj/item/clothing/head/that = 1,
		/obj/item/clothing/under/costume/kilt = 1,
		/obj/item/clothing/head/beret = 1,
		/obj/item/clothing/accessory/waistcoat = 1,
		/obj/item/cane = 1,
		/obj/item/clothing/under/suit/sl = 1,
		/obj/item/clothing/mask/fakemoustache = 1,
		/obj/item/clothing/suit/bio_suit/plaguedoctorsuit = 1,
		/obj/item/clothing/mask/gas/plaguedoctor = 1,
		/obj/item/clothing/suit/toggle/owlwings = 1,
		/obj/item/clothing/under/costume/owl = 1,
		/obj/item/clothing/mask/gas/owl_mask = 1,
		/obj/item/clothing/suit/toggle/owlwings/griffinwings = 1,
		/obj/item/clothing/suit/apron = 1,
		/obj/item/clothing/under/suit/waiter = 1,
		/obj/item/clothing/suit/jacket/miljacket = 1,
		/obj/item/clothing/under/costume/pirate = 1,
		/obj/item/clothing/suit/pirate = 1,
		/obj/item/clothing/head/pirate = 1,
		/obj/item/clothing/head/bandana = 1,
		/obj/item/clothing/head/bandana = 1,
		/obj/item/clothing/head/trapper = 1,
		/obj/item/clothing/mask/gas/cyborg = 1,
		/obj/item/clothing/under/dress/sundress = 1,
		/obj/item/staff/broom = 1,
		/obj/item/staff = 3,
		/obj/item/clothing/mask/rat/bat = 1,
		/obj/item/clothing/mask/rat/bee = 1,
		/obj/item/clothing/mask/rat/bear = 1,
		/obj/item/clothing/mask/rat/raven = 1,
		/obj/item/clothing/mask/rat/jackal = 1,
		/obj/item/clothing/mask/rat/fox = 1,
		/obj/item/clothing/mask/frog = 1,
		/obj/item/clothing/mask/rat/tribal = 1,
		/obj/item/clothing/mask/rat = 1,
		/obj/item/clothing/under/overalls = 2,
		/obj/item/clothing/under/overalls/black = 2,
		/obj/item/clothing/under/overalls/olive = 2,
		/obj/item/clothing/under/overalls/brown = 2,
		/obj/item/clothing/head/maidheadband = 1,
		/obj/item/clothing/under/costume/maid = 1,
		/obj/item/clothing/gloves/maid = 1,
		/obj/item/clothing/neck/maid = 1,
		/obj/item/clothing/under/rank/civilian/janitor/maid = 1,
		/obj/item/clothing/glasses/cold=1,
		/obj/item/clothing/glasses/heat=1,
		/obj/item/clothing/suit/hooded/carp_costume = 1,
		/obj/item/clothing/suit/snowman = 1,
		/obj/item/clothing/head/snowman = 1,
		/obj/item/clothing/mask/joy = 1,
		/obj/item/clothing/under/suit/white_on_white = 1,
		/obj/item/clothing/under/costume/sailor = 1,
		/obj/item/clothing/head/wig/random = 3,
		/obj/item/gohei = 1,
		/obj/item/clothing/suit/judgerobe = 1,
		/obj/item/clothing/glasses/blindfold = 1,
		/obj/item/clothing/mask/muzzle = 2)
	premium = list(
		/obj/item/clothing/suit/pirate/captain = 2,
		/obj/item/clothing/head/pirate/captain = 2,
		/obj/item/clothing/head/helmet/roman/fake = 1,
		/obj/item/clothing/head/helmet/roman/legionnaire/fake = 1,
		/obj/item/clothing/under/costume/roman = 1,
		/obj/item/shield/riot/roman/fake = 1,
		/obj/item/skub = 1)
	refill_canister = /obj/item/vending_refill/autodrobe
	default_price = 90
	extra_price = 180
	light_mask="theater-light-mask"

/obj/machinery/vending/autodrobe/canLoadItem(obj/item/I,mob/user)
	return (I.type in products)

/obj/machinery/vending/autodrobe/all_access
	desc = "A vending machine for costumes. This model appears to have no access restrictions."
	req_access = null

/obj/item/vending_refill/autodrobe
	machine_name = "AutoDrobe"
	icon_state = "refill_costume"
