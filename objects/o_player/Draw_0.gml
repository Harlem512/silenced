if global.touch_surf == undefined {
	// triggered on entry to new room
	global.touch_surf = surface_create(room_width, room_height, surface_r8unorm)
	
	// room transition, copy and clear buffer
	if buffer_exists(global.touch_buff) {
		var old_surface = surface_create(room_width, room_height, surface_r8unorm)

		// black out the surface
		buffer_set_surface(global.touch_buff, old_surface, 0)
		surface_set_target(old_surface)
		draw_set_color(c_black)
		// top bar
		draw_rectangle(0, 0, room_width, global.trans_blackout_y - 150, false)
		// bottom bar
		draw_rectangle(0, global.trans_blackout_y + 150, room_width, room_height, false)
		// left bar
		draw_rectangle(0, global.trans_blackout_y - 150, global.trans_blackout_x - 150, global.trans_blackout_y + 150, false)
		// right bar
		draw_rectangle(global.trans_blackout_x + 150, global.trans_blackout_y - 150, room_width, global.trans_blackout_y + 150, false)
		surface_reset_target()

		// render old surface to new surface
		surface_set_target(global.touch_surf)
		draw_clear_alpha(c_black, 0)
		draw_surface(old_surface, global.trans_x, global.trans_y)
		
				
		// apply blackout objects
		with o_blackout {
			draw_rectangle(self.bbox_left, self.bbox_top, self.bbox_right, self.bbox_bottom, false)
			instance_destroy(self)
		}
		
		// clean up old buffer
		buffer_delete(global.touch_buff)
		
		// reset color
		draw_set_color(c_white)
	} else {
		surface_set_target(global.touch_surf);
		draw_clear_alpha(c_black, 0)
	}
	global.touch_buff = buffer_create(room_width * room_height * 4, buffer_fixed, 1);
} else if !surface_exists(global.touch_surf) {
	// load surface from buffer
	global.touch_surf = surface_create(room_width, room_height, surface_r8unorm)
	buffer_set_surface(global.touch_buff, global.touch_surf, 0)
	surface_set_target(global.touch_surf)
} else {
	surface_set_target(global.touch_surf)
}

// draw player touch circle
draw_circle(self.x, self.y, TOUCH_SIZE, false)

// backup drawing
buffer_get_surface(global.touch_buff, global.touch_surf, 0)

surface_reset_target()

// draw mask
if !global.light {
	gpu_set_blendmode(bm_min)
}
draw_surface(global.touch_surf, 0, 0)
gpu_set_blendmode(bm_normal)
