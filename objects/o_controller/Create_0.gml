// debug options
global.can_debug = false
global.debug = global.can_debug
global.light = false
global.deb_msg = []

// rendering stuff
global.touch_surf = undefined
global.touch_buff = undefined
surface_depth_disable(true)

// create font
global.font = font_add_sprite_ext(s_font, " !.,-:[]{}0123456789abcdefghijklmnopqrstuvwxyz", true, 2)
draw_set_font(global.font)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)

// player movement stuff
global.has_moved = false
global.is_scraping = false

// transition data
global.trans_x = 0
global.trans_y = 0
global.trans_blackout_x = 0
global.trans_blackout_y = 0

// npc id array, for the credits
global.npc_ids = [
	Npc_Names.Carol,
	Npc_Names.Charlie,
	Npc_Names.Joey,
	Npc_Names.Alex,
	Npc_Names.Jackie,
	Npc_Names.Lily,
	Npc_Names.Chuck,
	Npc_Names.Thursday,
	Npc_Names.Sylvester,
	Npc_Names.Brett,
	Npc_Names.Steve,
	Npc_Names.Yonda,
]

// silence tracker
global.silenced = {}
for (var i = 0; i < array_length(global.npc_ids); i++) {
	global.silenced[$ global.npc_ids[i]] = false
}
