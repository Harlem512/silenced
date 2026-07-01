if !global.debug { return }

draw_set_halign(fa_left)
draw_set_color(c_silver)

var i = 0
while i < array_length(global.deb_msg) {
	draw_text_transformed(
		0, i * 20 + 12, string(global.deb_msg[i]),
		2, 2, 0
	)
	i += 1
}
global.deb_msg = [
	"[f3 ] disable debug",
	"[1-8] room tp",
	"[mb1] teleport",
	"[f1 ] light",
]

draw_set_halign(fa_center)
draw_set_color(c_white)
