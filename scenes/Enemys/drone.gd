extends CharacterBody2D
const speed = 500

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	# get the input and movement
	var direction = Vector2(1,0)
	velocity = direction * speed
	move_and_slide()

