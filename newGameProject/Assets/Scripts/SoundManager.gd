
extends Node

var sounds = {
	"Walk": preload("res://Assets/SoundEffects/freesound_community-single-bark-of-a-dog-38780.mp3"),
	##"growl": preload("res://Audio/Dog/growl.wav"),
	
}

var music_player: AudioStreamPlayer

func _ready():
	music_player = AudioStreamPlayer.new()
	add_child(music_player)
	music_player.bus = "Music"


func play_sfx(sound_name: String):
	if not sounds.has(sound_name):
		print("Sound not found: ", sound_name)
		return

	var player = AudioStreamPlayer.new()
	add_child(player)

	player.stream = sounds[sound_name]
	player.bus = "SFX"
	player.pitch_scale = randf_range(0.95, 1.05)

	player.finished.connect(player.queue_free)
	player.play()


func play_music(music: AudioStream):
	if music_player.stream == music and music_player.playing:
		return

	music_player.stream = music
	music_player.play()


func stop_music():
	music_player.stop()
