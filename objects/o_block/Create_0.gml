self.path = undefined

for (var i = instance_number(o_block_path) - 1; i >= 0; i--) {
	var inst = instance_find(o_block_path, i)
	if collision_rectangle(
		inst.bbox_left, inst.bbox_top, inst.bbox_right, inst.bbox_bottom,
		self, false, false
	) {
		self.path = inst
		break
	}
}

if self.path == undefined {
	self.sprite_index = s_block_immovable
	self.path_horizontal = false
} else {
	var path_width = self.path.bbox_right - self.path.bbox_left
	var path_height = self.path.bbox_bottom - self.path.bbox_top
	self.path_horizontal = path_width > path_height
}
