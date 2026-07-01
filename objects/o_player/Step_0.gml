// lerp camera to player position
self.cam_x = lerp(self.cam_x, self.x - CAM_SIZE, 0.05)
self.cam_y = lerp(self.cam_y, self.y - CAM_SIZE, 0.05)
camera_set_view_pos(view_camera[0], self.cam_x, self.cam_y)

// movement
var dx = 0
var dy = 0

if keyboard_check(ord("W")) or keyboard_check(vk_up) { dy -= PLR_SPEED }
if keyboard_check(ord("A")) or keyboard_check(vk_left) {dx -= PLR_SPEED }
if keyboard_check(ord("S")) or keyboard_check(vk_down) { dy += PLR_SPEED }
if keyboard_check(ord("D")) or keyboard_check(vk_right) { dx += PLR_SPEED }

var tilemap = layer_tilemap_get_id("Tiles_1");
var collisions = move_and_collide(
	dx, dy, [tilemap, o_npc, o_block],
	4, 0, 0,
	PLR_SPEED, PLR_SPEED
)
var did_collide = array_length(collisions)

for (var i = 0; i < did_collide; i++) {
	var collide = collisions[i]
	// could be a tilemap, skip
	if !instance_exists(collide) { continue }
	
	switch collide.object_index {
		case o_block:
			// move block by half movement along path
			with collide {
				// immovable block, skip
				if !self.path { continue }
				
				var dx1 = dx / 2
				var dy1 = dy / 2
				if self.path_horizontal {
					dy1 = 0
				} else {
					dx1 = 0
				}
				
				var block_collisions = move_and_collide(dx1, dy1, [tilemap, o_npc, o_player])
				for (var k = 0; k < array_length(block_collisions); k++) {
					var block_collide = block_collisions[k]
					// could be a tilemap, skip
					if !instance_exists(block_collide) { continue }
					
					// silence npc when block is pushed
					if block_collide.object_index == o_npc {
						instance_destroy(block_collide)
					}
				}
				
				// lock to track
				if self.path_horizontal {
					self.x = clamp(self.x, self.path.bbox_left, self.path.bbox_right)
				} else {
					self.y = clamp(self.y, self.path.bbox_top, self.path.bbox_bottom)
				}
			}
		break
		
		case o_npc:
			// silence npc on contact
			instance_destroy(collide)
		break
	}
}

// update global state
global.is_scraping = did_collide > 0 ? 60 : global.is_scraping - 1

self.collide_delay -= 1
if did_collide > 0 and self.collide_delay <= 0 {
	noise("rrr", 5)
	self.collide_delay = 5
}

var distance_to_npc = distance_to_object(o_npc)
if distance_to_npc < 60 {
	self.breath_delay -= 10 - (distance_to_npc div 6)
}

if dx != 0 or dy != 0 {
	global.has_moved = true
	self.walk_delay -= 1
	if self.walk_delay <= 0 and !did_collide {
		noise("tap", 20, 0.5)
		self.walk_delay = 30
	}
	self.breath_delay -= 3
} else {
	self.walk_delay = 0
	self.breath_delay -= 1
}

if self.breath_delay <= 0 {
	if global.has_moved {
		noise("hh", 60, 0.5)
	} else {
		noise("wasd", 120, 1.5)
	}
	
	self.breath_delay = random_range(300, 400)
}
