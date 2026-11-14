extends Sprite2D

var tex_up = preload("res://Assets/Walking Sprites/Pixel-Art Character Sprite Sheet-4.png")
var tex_left = preload("res://Assets/Walking Sprites/Pixel-Art Character Sprite Sheet-8(1).png")
var tex_right = preload("res://Assets/Walking Sprites/Pixel-Art Character Sprite Sheet-10.png")
var tex_down = preload("res://Assets/Walking Sprites/Pixel-Art Character Sprite Sheet-3.png")

# Change BASE_SCALE to resize everything. Change SMALL_RATIO only if
# up/down stops matching left/right.
const BASE_SCALE := 0.75
const SMALL_RATIO := 0.75

const NORMAL_SCALE := Vector2(BASE_SCALE, BASE_SCALE)
const SMALL_SCALE := Vector2(BASE_SCALE * SMALL_RATIO, BASE_SCALE * SMALL_RATIO)

# Nudge if the feet shift when you turn (x, y in pixels).
const NORMAL_OFFSET := Vector2.ZERO
const SMALL_OFFSET := Vector2.ZERO

func _process(_delta: float) -> void:
	var dir := Vector2.ZERO
	if Input.is_key_pressed(KEY_W): dir.y -= 1
	if Input.is_key_pressed(KEY_S): dir.y += 1
	if Input.is_key_pressed(KEY_A): dir.x -= 1
	if Input.is_key_pressed(KEY_D): dir.x += 1

	if dir == Vector2.ZERO:
		return   # standing still: keep the last facing

	# Left/right wins on diagonals
	if dir.x < 0:
		_face(tex_left, NORMAL_SCALE, NORMAL_OFFSET)
	elif dir.x > 0:
		_face(tex_right, NORMAL_SCALE, NORMAL_OFFSET)
	elif dir.y < 0:
		_face(tex_up, SMALL_SCALE, SMALL_OFFSET)
	else:
		_face(tex_down, SMALL_SCALE, SMALL_OFFSET)

func _face(tex: Texture2D, new_scale: Vector2, new_offset: Vector2) -> void:
	texture = tex
	scale = new_scale
	offset = new_offset
