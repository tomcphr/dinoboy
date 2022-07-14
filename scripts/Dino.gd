extends Node2D

# Declare member variables here. Examples:
export var movementSpeed = 100;

var screen_size;

func _ready():
	screen_size = get_viewport_rect().size
	pass;

func _process(delta):
	var velocity = Vector2.ZERO;
	if Input.is_action_pressed("game_right"):
		velocity.x += 1;
	if Input.is_action_pressed("game_left"):
		velocity.x -= 1;
	if Input.is_action_pressed("game_down"):
		velocity.y += 1;
	if Input.is_action_pressed("game_up"):
		velocity.y -= 1;

	if velocity.length() > 0:
		velocity = velocity.normalized() * movementSpeed;
		$Anim.play('walk');
		$Anim.flip_h = velocity.x < 0;
	else:
		$Anim.play('idle');
	
	position += velocity * delta;
	position.x = clamp(position.x, 0, screen_size.x);
	position.y = clamp(position.y, 0, screen_size.y);
	
	pass;
