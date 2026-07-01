if !global.debug { return }

if global.light {
	var lay_id = layer_get_id("Tiles_1");
	var map_id = layer_tilemap_get_id(lay_id);
	draw_tilemap(map_id, 0, 0)
}

log({mx: mouse_x, my: mouse_y})

with o_player {
	log({x: self.x, y: self.y})

	// collision size
	draw_rectangle_color(
		self.bbox_left, self.bbox_top, self.bbox_right, self.bbox_bottom,
		c_teal, c_teal, c_teal, c_teal,
		true
	)
	// touch size
	draw_circle_color(self.x, self.y, TOUCH_SIZE, c_white, c_navy, true)
}

with o_transition {
	draw_rectangle_color(
		self.bbox_left, self.bbox_top, self.bbox_right, self.bbox_bottom,
		c_purple, c_purple, c_purple, c_purple,
		true
	)
}

with o_spawn {
	draw_rectangle_color(
		self.bbox_left, self.bbox_top, self.bbox_right, self.bbox_bottom,
		c_purple, c_purple, c_purple, c_purple,
		true
	)
}

with o_npc {
	draw_rectangle_color(
		self.bbox_left, self.bbox_top, self.bbox_right, self.bbox_bottom,
		c_green, c_green, c_green, c_green,
		true
	)
	draw_text(self.x, self.y, self.state)
}

with o_block_path {
	draw_rectangle_color(
		self.bbox_left, self.bbox_top, self.bbox_right, self.bbox_bottom,
		c_orange, c_orange, c_orange, c_orange,
		true
	)
}

with o_block {
	draw_rectangle_color(
		self.bbox_left, self.bbox_top, self.bbox_right, self.bbox_bottom,
		c_yellow, c_yellow, c_yellow, c_yellow,
		true
	)
	if !self.path {
		draw_rectangle_color(
			self.x - 2, self.y - 2, self.x + 2, self.y + 2,
			c_yellow, c_yellow, c_yellow, c_yellow,
			true
		)
	}
}

draw_circle_color(mouse_x, mouse_y, 4, c_white, c_gray, true)
