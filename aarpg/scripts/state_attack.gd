extends State

@onready var animation_player = $"../../AnimationPlayer"
@onready var idle: State = $"../Idle"
@export var swoosh_sound: AudioStream
@onready var audio_stream_player: AudioStreamPlayer2D = $"../../AudioStreamPlayer2D"
var decelerate: float = 5.0

var attacking: bool = false


func process(_delta) -> State:
	return null

func physics_process(_delta) -> State:
	player.velocity.x = move_toward(player.velocity.x, 0.0, decelerate * _delta)
	player.velocity.y = move_toward(player.velocity.y, 0.0, decelerate * _delta)

	if not attacking:
		return idle
	return null
	
func handle_input(_event) -> State:
	return null
	
func on_enter() -> void:
	player.update_animation("attack")
	animation_player.animation_finished.connect(stop_attacking)
	audio_stream_player.stream = swoosh_sound
	audio_stream_player.pitch_scale = randf_range(0.9, 1.1)
	audio_stream_player.play()
	attacking = true
	
func on_exit() -> void:
	animation_player.animation_finished.disconnect(stop_attacking)

	
func stop_attacking(_anim_name: String) -> void:
	attacking = false
	
