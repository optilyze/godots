extends State

@export var walk_speed : float = 100.0
@onready var idle : State = $"../Idle"
@onready var attack: State = $"../Attack"

func _ready():
	pass # Replace with function body.

func init(with_player: Player) -> void:
	player = with_player

func on_enter() -> void:
	player.update_animation("walk")
	
func on_exit() -> void:
	pass
	
func process(_delta) -> State:
	player.velocity = walk_speed * player.direction
	if player.should_update_direction():
		player.update_direction()
	if player.should_update_direction_name():
		player.update_direction_name()
	if player.direction == Vector2.ZERO:
		return idle
	return null

func physics_process(_delta) -> State:
	return null

func handle_input(event: InputEvent) -> State:
	if event.is_action_pressed("attack"):
		return attack
	return null
