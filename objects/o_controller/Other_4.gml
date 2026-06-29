if surface_exists(global.touch_surf) {
	surface_free(global.touch_surf)
}
global.touch_surf = undefined

switch room {
	case r_1:
		noise("silenced", 120, 4, o_player.x, o_player.y - 50)
	break
}