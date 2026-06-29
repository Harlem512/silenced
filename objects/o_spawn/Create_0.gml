if room == r_1 or instance_number(o_transition) < 2 {
	// low depth so touch draw happens after normal draws
	instance_create_depth(self.x, self.y, -9999, o_player)
}