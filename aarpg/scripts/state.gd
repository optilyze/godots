class_name State extends Node

static var player : Player 


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func init(with_player: Player) -> void:
	player = with_player

func on_enter() -> void:
	pass
	
func on_exit() -> void:
	pass
	
func physics_process(delta) -> State:
	return null

func process(delta) -> State:
	return null
	
func handle_input(event) -> State:
	return null
