class_name PlayerStateMachine extends Node

var states : Array[ State ]
var prev_state : State
var current_state : State

# Called when the node enters the scene tree for the first time.
func _ready():
	process_mode = Node.PROCESS_MODE_DISABLED


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	change_state(current_state.process(delta))

func _physics_process(delta):
	change_state(current_state.physics_process(delta))
			
func _unhandled_input(event):
	change_state(current_state.handle_input(event))	
		
func change_state(state: State) -> void:
	if state == null or state == current_state:
		return
	if current_state:
		current_state.on_exit()
	prev_state = current_state
	current_state = state
	current_state.on_enter()

func init(player: Player):
	for item in get_children():
		if item is State:
			item.init(player)
			states.append(item)
	if states.size() > 0:
		change_state(states[0])
	process_mode = Node.PROCESS_MODE_INHERIT
			
