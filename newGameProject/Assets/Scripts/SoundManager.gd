extends Node

const NUM_PLAYERS = 8
var available = []  # The available stream players
var queue = []      # The queue of sounds to play

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

func _process(_delta: float) -> void:
	if not queue.is_empty() and not available.is_empty():
		var player = available.pop_front() as AudioStreamPlayer
		player.stream = load(queue.pop_front())
		player.play()
