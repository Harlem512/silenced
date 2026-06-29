// enable debug post-credits
global.can_debug = true

self.silenced = []

var names = [
	"] carol",
	"] charlie",
	"] joey",
	"] alex",
	"] jackie",
	"] lily",
	"] ken",
	"] tuesday",
	"] ester",
	"] brett",
	"] steve",
	"] yonda",
]
var rank = [
	"pacifist",
	"woopsie",
	"unlucky",
	"mistake",
	"hot mess",
	"problematic",
	"dangerous",
	"killer",
	"murderer",
	"monster",
	"disaster",
	"missed one",
	"slaughter",
]

self.skills = [
	"graphics",
	"sound effects",
	"music",
	"concept art",
	"advertising",
	"physics",
	"u.i.",
	"playtesting",
	"i.t.",
	"code",
	"social media",
	"designer",
	"vram eater",
	"catering",
	"localization",
	"scriptwriter",
	"stunt double",
	"editor",
	"casting",
	"director",
	"f3 presser",
]

var silenced_count = 0
for (var i = 0; i < array_length(names); i++) {
	var name = names[i]
	var name_id = global.npc_ids[i]
	
	// track total silenced (for rank)
	var did_silence = global.silenced[$ name_id]
	if did_silence {
		silenced_count += 1
	}
	
	var inst = instance_create_depth(0, 0, 0, par_noise_machine)
	inst.duration = random_range(50,70)
	inst.period_short = -1
	inst.sound = "[" + (did_silence ? "x" : " ") + name
	inst.font_size = 1.5
	array_push(self.silenced, inst)
}

// game title
self.title = instance_create_depth(0, 0, 0, par_noise_machine)
self.title.duration = random_range(150, 200)
self.title.period_short = -1
self.title.sound = "silenced"
self.title.font_size = 2

// timer
self.timer = instance_create_depth(0, 0, 0, par_noise_machine)
self.timer.duration = random_range(50,70)
self.timer.period_short = -1
var run_time = get_timer() / 1000000
self.timer.sound = "[ " + string(floor(run_time / 60)) + "m " + string(floor(run_time % 60)) + "s ]"
self.timer.font_size = 1.5

// rank
self.rank = instance_create_depth(0, 0, 0, par_noise_machine)
self.rank.duration = random_range(50,70)
self.rank.period_short = -1
self.rank.sound = rank[silenced_count]
self.rank.font_size = 1.5

// thanks
self.thanks = instance_create_depth(0, 0, 0, par_noise_machine)
self.thanks.duration = random_range(50,70)
self.thanks.period_short = -1
self.thanks.sound = "thanks for playing {3\n\ni hope you had fun"
self.thanks.font_size = 0.5

// credits noises
event_inherited()
self.sound = "by harlem512"
self.duration = 360
self.font_size = 1.5
self.period_short = -1
