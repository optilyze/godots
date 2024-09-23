extends State

@onready var walk : State = $"../Walk"
@onready var attack: State = $"../Attack"

func process(_delta) -> State:
	player.velocity = Vector2.ZERO	
	if player.direction != Vector2.ZERO:
		return walk
	return null

func physics_process(_delta) -> State:
	return null
	
func handle_input(event: InputEvent) -> State:
	if event.is_action_pressed("attack"):
		return attack
	return null
	
func on_enter() -> void:
	player.update_animation("idle")
	
func on_exit() -> void:
	pass
	
	
