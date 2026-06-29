var d = self.data[self.state]
if d == undefined { return }

switch d.action {
	case Npc_Action.IDLE:
		// script_execute so wait_over runs in the npc's scope
		var next_delay = script_execute(d.wait_over)
		if next_delay == -1 {
			// advance immediately
			npc_advance()
		} else {
			alarm_set(1, next_delay)
		}
	break
	case Npc_Action.MOVE:
		noise("tap", 25, 1)
		
		// schedule next step using MATH
		var delta = point_distance(0, 0, d.delta_x, d.delta_y)
		alarm_set(1, clamp(30 / delta, 15, 60))
	break
}
