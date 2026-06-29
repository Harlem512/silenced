switch self.name {
	// cowardly guard
	case Npc_Names.Carol:
		self.data = [
			{
				start_wait: 120,
				next: function () { return o_player.y < 220 },
				action: Npc_Action.IDLE,
				wait_over: function () {
					if global.is_scraping {
						noise("h", 20, 0.5)
						return irandom_range(80, 120)
					} else {
						noise("words", 30)
						return irandom_range(20, 60)
					}
				},
			},
			{
				start_wait: 0,
				next: undefined,
				action: Npc_Action.MOVE,
				target_x: 45,
				target_y: 85,
				duration: 100,
			},
			{
				start_wait: 0,
				next: undefined,
				action: Npc_Action.IDLE,
				wait_over: function () {
					noise("h", 20, 0.5)
					return irandom_range(80, 120)
				},
			},
		]
	break

	// guard
	case Npc_Names.Charlie:
		self.data = [
			{
				start_wait: 120,
				next: function () { return o_player.y < 220 },
				action: Npc_Action.IDLE,
				wait_over: function () {
					if global.is_scraping {
						noise("h", 20, 0.5)
						return irandom_range(120, 160)
					} else {
						noise("words", 30, 1.2)
						return irandom_range(40, 80)
					}
				},
			},
			{
				start_wait: 0,
				next: undefined,
				action: Npc_Action.IDLE,
				wait_over: function () {
					noise("words?", 30, 1)
					return -1
				},
			},
			{
				start_wait: 0,
				next: undefined,
				action: Npc_Action.MOVE,
				target_x: 160,
				target_y: 135,
				duration: 120,
			},
			{
				start_wait: 0,
				next: undefined,
				action: Npc_Action.IDLE,
				wait_over: function () {
					noise("words!", 40, 1.5)
					return -1
				},
			},
			{
				start_wait: 0,
				next: undefined,
				action: Npc_Action.MOVE,
				target_x: 55,
				target_y: 180,
				duration: 100,
			},
			{
				start_wait: 0,
				next: undefined,
				action: Npc_Action.IDLE,
				wait_over: function () {
					noise("h", 20, 0.5)
					return irandom_range(120, 160)
				},
			},
		]
	break

	// cleaner
	case Npc_Names.Joey:
		self.data = [
			{
				start_wait: 1,
				next: undefined,
				action: Npc_Action.IDLE,
				wait_over: function () {
					noise("words", 60, 1)
					return -1
				},
			},
			{
				start_wait: 0,
				next: undefined,
				action: Npc_Action.MOVE,
				target_x: 440,
				target_y: 205,
				duration: 60,
			},
			{
				start_wait: 0,
				next: undefined,
				action: Npc_Action.IDLE,
				wait_over: function () {
					if (global.is_scraping and o_player.x > 370) or (o_player.x > 390) {
						noise("words", 20, 1)
						return irandom_range(15, 25)
					} else {
						noise("h", 20, 1)
						return irandom_range(30, 40)
					}
				},
			},
		]
	break
	
	// young
	case Npc_Names.Alex:
		self.data = [
			{
				start_wait: 1,
				next: undefined,
				action: Npc_Action.IDLE,
				wait_over: function () {
					if global.is_scraping or global.silenced[$ Npc_Names.Jackie] {
						noise("aaa", 20, 1.5)
						return irandom_range(15, 25)
					} else {
						noise("h", 20, 0.5)
						return irandom_range(30, 40)
					}
				},
			}
		]
	break
	// old
	case Npc_Names.Jackie:
		self.data = [
			{
				start_wait: 1,
				next: undefined,
				action: Npc_Action.IDLE,
				wait_over: function () {
					if global.is_scraping {
						noise("words", 20, 0.5)
						return irandom_range(30, 50)
					} else if global.silenced[$ Npc_Names.Alex] {
						noise("h", 20, 1)
						return irandom_range(30, 40)
					} else {
						noise("h", 20, 0.5)
						return irandom_range(80, 100)
					}
				},
			}
		]
	break
	
	// fearful
	case Npc_Names.Lily:
		self.ammo = 5
		self.data = [
			{
				start_wait: 1,
				next: function () { return o_player.x > 390 },
				action: Npc_Action.IDLE,
				wait_over: function () {
					if global.is_scraping {
						noise("h", 20, 0.5)
						return irandom_range(80, 120)
					} else {
						noise("words", 30)
						return irandom_range(20, 60)
					}
				},
			},
			{
				start_wait: 1,
				next: function () { return o_player.y > 300 and o_player.x > 390 },
				action: Npc_Action.IDLE,
				wait_over: function () {
					// player returned to hallway
					if o_player.x < 385 {
						noise("h", 20, 0.5)
						self.ammo = 5
						return irandom_range(60, 80)
					}
					
					self.ammo -= 1
					if self.ammo <= 0 {
						self.ammo = 5
						// reload
						noise("click", 20, 0.5)
						return irandom_range(150, 200)
					} else {
						// fire
						noise("boom", 60, 2)
						return irandom_range(70, 90)
					}
				},
			},
			{
				start_wait: 0,
				next: undefined,
				action: Npc_Action.IDLE,
				wait_over: function () {
					noise("words", 30, 1)
					return -1
				},
			},
			{
				start_wait: 1,
				next: undefined,
				action: Npc_Action.MOVE,
				target_x: 400,
				target_y: 390,
				duration: 60,
			},
			{
				start_wait: 0,
				next: undefined,
				action: Npc_Action.IDLE,
				wait_over: function () {
					noise("words!", 30, 1)
					return -1
				},
			},
			{
				start_wait: 1,
				next: undefined,
				action: Npc_Action.MOVE,
				target_x: 470,
				target_y: 450,
				duration: 120,
			},
			{
				start_wait: 1,
				next: undefined,
				action: Npc_Action.IDLE,
				wait_over: function () {
					noise("hh", 40, 1)
					return irandom_range(30, 40)
				},
			},
		]
	break

	// stubborn
	case Npc_Names.Chuck:
		self.ammo = 40
		self.data = [
			{
				start_wait: 1,
				next: function () { return o_player.x > 390 },
				action: Npc_Action.IDLE,
				wait_over: function () {
					noise("h", 20, 0.5)
					return irandom_range(120, 160)
				},
			},
			{
				start_wait: 1,
				next: undefined,
				action: Npc_Action.IDLE,
				wait_over: function () {
					// player returned to hallway
					if o_player.x < 385 {
						noise("h", 20, 0.5)
						self.ammo = 40
						return irandom_range(120, 160)
					}
					
					self.ammo -= 1
					if self.ammo <= 0 {
						self.ammo = 40
						// reload
						noise("click", 20, 0.5)
						return irandom_range(100, 150)
					} else {
						// fire
						noise("at", 60, 2)
						return 10
					}
				},
			},
		]
	break
	
	// cowardly
	case Npc_Names.Thursday:
		self.ammo = 20
		self.data = [
			{
				start_wait: 1,
				next: function () { return o_player.x > 390 },
				action: Npc_Action.IDLE,
				wait_over: function () {
					if global.is_scraping {
						noise("h", 20, 0.5)
						return irandom_range(50, 60)
					} else {
						noise("words", 30)
						return irandom_range(60, 80)
					}
				},
			},
			{
				start_wait: 1,
				next: function () { return o_player.y > 300 and o_player.x > 390 },
				action: Npc_Action.IDLE,
				wait_over: function () {
					// player returned to hallway
					if o_player.x < 385 {
						noise("h", 20, 0.5)
						self.ammo = 5
						return irandom_range(30, 40)
					}
					
					self.ammo -= 1
					if self.ammo <= 0 {
						self.ammo = 20
						// reload
						noise("click", 20, 0.5)
						return irandom_range(50, 100)
					} else {
						// fire
						noise("bang", 60, 2)
						return irandom_range(30, 50)
					}
				},
			},
			{
				start_wait: 0,
				next: undefined,
				action: Npc_Action.IDLE,
				wait_over: function () {
					noise("words!", 30, 1)
					return -1
				},
			},
			{
				start_wait: 1,
				next: undefined,
				action: Npc_Action.MOVE,
				target_x: 470,
				target_y: 230,
				duration: 120,
			},
			{
				start_wait: 1,
				next: undefined,
				action: Npc_Action.IDLE,
				wait_over: function () {
					noise("hh", 40, 1)
					return irandom_range(20, 30)
				},
			},
		]
	break
	
	// executive
	case Npc_Names.Sylvester:
		self.data = [
			{
				start_wait: 1,
				next: function () { return o_player.x > 390 },
				action: Npc_Action.IDLE,
				wait_over: function () {
					if global.is_scraping {
						noise("words?", 30)
						return irandom_range(60, 120)
					} else {
						noise("words", 30)
						return irandom_range(120, 130)
					}
				},
			},
			{
				start_wait: 1,
				next: function () { return o_player.y > 300 and o_player.x > 390 },
				action: Npc_Action.IDLE,
				wait_over: function () {
					// player returned to hallway
					if o_player.x < 385 {
						noise("h", 20, 0.5)
						return irandom_range(20, 30)
					}
					
					noise("aaa", 60, 2)
					return irandom_range(30, 50)
				},
			},
			// defenses scattered
			{
				start_wait: 20,
				next: function () { return global.silenced[$ Npc_Names.Chuck] or (o_player.y > 390 and o_player.x > 390) },
				action: Npc_Action.IDLE,
				wait_over: function () {
					if global.silenced[$ Npc_Names.Chuck] {
						noise("hh", 20, 0.5)
						return irandom_range(20, 30)
					} else {
						noise("aaa", 60, 2)
						return irandom_range(30, 50)
					}
				},
			},
			// player close
			{
				start_wait: 1,
				next: undefined,
				action: Npc_Action.IDLE,
				wait_over: function () {
					noise("words", 30, 1)
					return irandom_range(20, 40)
				},
			},
		]
	break
	
	// maze of my mind
	case Npc_Names.Brett:
		self.data = [
			{
				start_wait: 1,
				next: undefined,
				action: Npc_Action.IDLE,
				wait_over: function () {
					if global.is_scraping and distance_to_object(o_player) > 50 {
						noise("words?", 30)
						return irandom_range(60, 120)
					} else {
						noise("h", 30, 0.5)
						return irandom_range(20, 30)
					}
				},
			},
		]
	break
	
	// fwend
	case Npc_Names.Steve:
		self.data = [
			{
				start_wait: 1,
				next: function () { return distance_to_object(o_player) < 100 },
				action: Npc_Action.IDLE,
				wait_over: function () {
					noise("h", 30, 0.5)
					return irandom_range(60, 80)
				},
			},
			{
				start_wait: 1,
				next: function () { return distance_to_object(o_player) < 50 },
				action: Npc_Action.IDLE,
				wait_over: function () {
					if (distance_to_object(o_player) > 100) { self.state -= 1 }
					
					noise("words?", 30, 1)
					return irandom_range(60, 80)
				},
			},
			{
				start_wait: 1,
				next: undefined,
				action: Npc_Action.IDLE,
				wait_over: function () {
					if (distance_to_object(o_player) > 50) { self.state -= 1 }
					
					noise("words", 30, 1)
					return irandom_range(40, 60)
				},
			},
		]
	break
	
	// hiding
	case Npc_Names.Yonda:
		self.data = [
			{
				start_wait: 1,
				next: undefined,
				action: Npc_Action.IDLE,
				wait_over: function () {
					if o_player.y < 60 {
						noise("hh", 30, 0.5)
						return irandom_range(80, 100)
					}
					
					if random(1) > 0.5 {
						noise("dr ip", 35, 1)
					} else {
						noise("h", 30, 0.5)
					}
					return irandom_range(120, 160)
				},
			},
		]
	break
}

// load first event
var d = self.data[0]
if d != undefined {
	alarm_set(1, d.start_wait)
}