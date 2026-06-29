var n = noise(self.sound, self.duration, self.font_size)

if self.count == 0 {
	instance_destroy(self)
} else {
	if self.count != -1 {
		self.count -= 1
	}

	if self.period_short == -1 {
		// noise after duration expires
		alarm_set(1, self.duration - n.fade_start / 2)
	} else {
		// schedule next noise
		alarm_set(1, random_range(self.period_short, self.period_long))
	}
}