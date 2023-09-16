extends CharacterBody2D
const speed = 500

var can_laser: bool = true
var can_grenade: bool = true
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
	if Input.is_action_pressed("primary action") and can_laser:
		print("shoot laser")
		can_laser = false
		$LaserTimer.start()
	# grenade input
	if Input.is_action_just_pressed("secondary action") and can_grenade:
		print("shoot grenade")
		can_grenade = false
		$GrenadeTimer.start()
	


func _on_laser_timer_timeout():
	can_laser = true


func _on_grenade_timer_timeout():
	can_grenade = true
