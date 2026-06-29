self.x = lerp(self.x, self.target_x, 0.1)
self.y = lerp(self.y, self.target_y, 0.1)

draw_set_alpha(self.duration < self.fade_start ? self.duration / self.fade_start : 1)
draw_text_transformed(self.x, self.y, self.sound, self.font_size, self.font_size, self.image_angle)
draw_set_alpha(1)

// draw_text(self.x, self.y+20, string([self.duration, self.fade_start]))

self.duration -= 1
if self.duration <= 0 {
	instance_destroy(self)
}
