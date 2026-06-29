function npc_advance() {
	self.state += 1
	
	// schedule next alarm
	var d = self.data[self.state]
	if d == undefined {
		// state machine done
		alarm_set(1, -1)
	} else if d.start_wait {
		// provided start wait
		alarm_set(1, d.start_wait)
	} else {
		// default start wait
		alarm_set(1, 1)
	}
	
	// update movement data
	if d.action == Npc_Action.MOVE {
		d.delta_x = (d.target_x - self.x) / d.duration
		d.delta_y = (d.target_y - self.y) / d.duration
		d.duration_rem = d.duration
	}
}