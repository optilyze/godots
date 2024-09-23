class_name HitBox extends Area2D


signal damaged(amount: int)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func take_damage(amount: int) -> void:
	print("Took damage ", amount)
	damaged.emit(amount)
