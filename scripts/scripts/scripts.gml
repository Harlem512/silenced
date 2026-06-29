/// @param {String} sound
/// @param {Real} duration
/// @param {Integer} font_size
/// @param {Real} x
/// @param {Real} y
function noise (sound, duration, font_size = 1, x = self.x, y = self.y) {
	return instance_create_depth(x, y, 0, o_noise, {
		sound,
		duration,
		font_size,
	})
}

function log(msg) {
	array_push(global.deb_msg, msg)
}
