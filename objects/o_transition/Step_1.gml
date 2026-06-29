//if instance_place(self.x, self.y, o_player) {
if collision_rectangle(self.bbox_left, self.bbox_top, self.bbox_right, self.bbox_bottom, o_player, false, false) {
	self.persistent = true
	room_goto_next()
	
	self.player_last_x = o_player.x
	self.player_last_y = o_player.y
}