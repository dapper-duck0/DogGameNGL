extends AudioStreamPlayer

@export var room_sounds: Array[AudioStream]   # drag your .wav files in, in room order

func _ready():
	var room_num = get_parent().roomNumber
	stream = room_sounds[room_num - 1]
	play()
