
extends Node

const NUM_PLAYERS = 8
var available = []
var queue = []

func _ready() -> void:
	# Create a pool of AudioStreamPlayers
	for i in NUM_PLAYERS:
		var p = AudioStreamPlayer.new()
		add_child(p)
		available.append(p)
		p.finished.connect(_on_stream_finished.bind(p))
		p.bus = "SFX"

func _on_stream_finished(stream: AudioStreamPlayer) -> void:
	available.append(stream)

func play(sound_path: String) -> void:
	queue.append(sound_path)

# Remove one sound from the queue
func remove_one(sound_path: String) -> void:
	var index = queue.find(sound_path)
	if index != -1:
		queue.remove_at(index)

# Remove all sounds from the queue
func remove_all() -> void:
	queue.clear()

# Stop all currently playing sounds
func stop_all() -> void:
	for player in get_children():
		if player is AudioStreamPlayer:
			player.stop()
			if not available.has(player):
				available.append(player)

func is_sound_playing(sound_path: String) -> bool:
	for player in get_children():
		if player is AudioStreamPlayer and player.playing:
			if player.stream and player.stream.resource_path == sound_path:
				return true

	return false

func _process(_delta: float) -> void:
	if not queue.is_empty() and not available.is_empty():
		var player = available.pop_front() as AudioStreamPlayer
		player.stream = load(queue.pop_front())
		player.play()
