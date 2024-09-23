extends Node2D

@onready var hit_box: HitBox = $HitBox

# Called when the node enters the scene tree for the first time.
func _ready():
	hit_box.damaged.connect(take_hit)
	
	
func take_hit(_amt) -> void:
	queue_free()



