var dir = random_range(0, 360)
var len = random_range(self.font_size * 2, self.font_size * 4)

self.duration *= random_range(0.9, 1.1)
self.fade_start = self.duration < 20 ? 0 : max(self.duration / 4, 10)

self.target_x = self.x + lengthdir_x(len, dir)
self.target_y = self.y + lengthdir_y(len, dir)
self.image_angle = random_range(-8, 8)
