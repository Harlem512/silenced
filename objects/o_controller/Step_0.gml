// debug options
if !global.can_debug { return }

if keyboard_check_pressed(vk_f3) {
	global.debug = !global.debug
}

if !global.debug { return }

if keyboard_check_pressed(vk_f1) {
	global.light = !global.light
}

if mouse_check_button(mb_left) {
	o_player.x = mouse_x
	o_player.y = mouse_y
}

if keyboard_check_pressed(ord("1")) {
	room_goto(r_1)
}
if keyboard_check_pressed(ord("2")) {
	room_goto(r_2)
}
if keyboard_check_pressed(ord("3")) {
	room_goto(r_3)
}
if keyboard_check_pressed(ord("4")) {
	room_goto(r_4)
}
if keyboard_check_pressed(ord("5")) {
	room_goto(r_5)
}
if keyboard_check_pressed(ord("6")) {
	room_goto(r_6)
}
if keyboard_check_pressed(ord("7")) {
	room_goto(r_7)
}
if keyboard_check_pressed(ord("8")) {
	room_goto(r_9)
}
