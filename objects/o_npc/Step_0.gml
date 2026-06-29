var d = self.data[self.state]
if d == undefined { return }

switch d.action {
	case Npc_Action.MOVE:
		self.x += d.delta_x
		self.y += d.delta_y
		d.duration_rem -= 1
		if d.duration_rem <= 0 {
			npc_advance()
			return
		}
	break
}

if d.next and script_execute(d.next) {
	npc_advance()
	return
}