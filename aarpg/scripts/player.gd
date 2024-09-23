class_name Player extends CharacterBody2D


var direction: Vector2 = Vector2.ZERO
var current_state: String = "idle"
var direction_name: String = "down"
var left_right = 1
var current_animation_name: String = "idle_down"

@onready var animation_player : AnimationPlayer = $AnimationPlayer
@onready var sprite : Sprite2D = $Sprite2D
@onready var state_machine: PlayerStateMachine = $StateMachine
@onready var swoosh_animation_player: AnimationPlayer = $Sprite2D/SwooshAnimationPlayer
@onready var swoosh_sprite = $Sprite2D/SwooshSprite


func _ready():
	state_machine.init(self)
	animation_player.play("idle_down")
	swoosh_sprite.visible = false


func _process(delta):
	direction.x = Input.get_axis("left", "right")
	direction.y = Input.get_axis("up", "down")
	direction = direction.normalized()


func _physics_process(delta):
	move_and_slide()


func _make_animation_name(state_name) -> String:
	return state_name + "_" + direction_name


func update_animation(to: String = "") -> void:
	if to == "":
		to = current_state
	else:
		current_state = to
	animation_player.play(_make_animation_name(to))
	if to == "attack":
		swoosh_animation_player.play(_make_animation_name(to))
	
func _calc_direction_name() -> String:
	var d_name : String = direction_name
	if direction.length() == 0:
		return d_name
	if direction.y:
		if direction.y < 0:
			d_name = "up"
		else:
			d_name = "down"
	else:
		if direction.x < 0:
			d_name = "side"
		else:
			d_name = "side"
	return d_name
	
func should_update_direction_name() -> bool:
	var d_name = _calc_direction_name()
	return d_name != direction_name
	
func update_direction_name() -> void:
	direction_name = _calc_direction_name()
	update_animation()

func should_update_direction() -> bool:
	return direction_name == "side" and left_right * direction.x < 0

func update_direction() -> void:
	left_right = 1 if direction.x >= 0 or direction_name != "side" else -1
	sprite.scale = Vector2(left_right, 1)
	
