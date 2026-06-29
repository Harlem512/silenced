var sx = o_player.x - CAM_SIZE
var sy = o_player.y - CAM_SIZE

self.x = sx + 190
self.y = o_player.y + 90

for (var i = 0; i < array_length(self.silenced); i++) {
	var inst = self.silenced[i]
	inst.x = sx + 55
	inst.y = sy + 15 + i * 20
}

with self.title {
	self.x = sx + 200
	self.y = sy + 30
}

with self.rank {
	self.x = sx + 200
	self.y = sy + 60
}

with self.timer {
	self.x = sx + 210
	self.y = sy + 80
}

with self.thanks {
	self.x = sx + 200
	self.y = o_player.y
}
