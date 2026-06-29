if self.period_short == -1 {
	alarm_set(1, random_range(self.period_long * 0.9, self.period_long * 1.1))
} else {
	alarm_set(1, random_range(self.period_short, self.period_long))
}