extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var move_speed = 100      # Movement speed in pixels / second


# Called when the node enters the scene tree for the first time.
func _ready():
	print("Hello, I'm the player!!")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var offset = Vector2(0, 0)
	if Input.is_action_pressed("move_left"):
		offset.x = -1
	if Input.is_action_pressed("move_right"):
		offset.x = 1
	if Input.is_action_pressed("move_up"):
		offset.y = -1
	if Input.is_action_pressed("move_down"):
		offset.y = 1
		
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
		
	# Make it so the HYPOTENUSE of the offset vector is always 1.0
	offset = offset.normalized()
	
	# Make the vector have a length move_speed * delta
	#offset = offset * (move_speed * delta)
	#translate(offset)
	
	# Instead of the above, use move_and_slide to move us AND
	#   not move through colliders
	offset = offset * move_speed
	move_and_slide(offset)
