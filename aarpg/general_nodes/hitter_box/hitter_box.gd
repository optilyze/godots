class_name HitterBox extends Area2D

@export var damage: int = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	area_entered.connect(maybe_damage)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func maybe_damage(a: Area2D) -> void:
	if a is HitBox:
		a.take_damage(damage)
