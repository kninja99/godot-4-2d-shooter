extends CharacterBody2D
const speed = 500

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	# get the input and movement
	var direction = Input.get_vector("left","right","up","down")
	velocity = direction * speed
	move_and_slide()
	
	# get laser shooting input
	if Input.is_action_pressed("primary action"):
		print("shoot laser")
	# grenade input
	if Input.is_action_just_pressed("secondary action"):
		print("shoot grenade")
	
