if !self.persistent { return }

var dx = self.x - self.player_last_x
var dy = self.y - self.player_last_y

var target_x = o_spawn.x
var target_y = o_spawn.y

// spawn player including delta
var p = instance_create_depth(
	target_x - dx,
	target_y - dy,
	-9999, o_player
)

// lerp position back slightly (fixes collision issue when holding a direction and transitioning)
p.x = lerp(p.x, target_x, 0.1)
p.y = lerp(p.y, target_y, 0.1)

// set transition variables for copying the touch map
global.trans_x = target_x - self.x
global.trans_y = target_y - self.y

global.trans_blackout_x = self.x
global.trans_blackout_y = self.y

// destroy self (not needed)
instance_destroy(self)
