extends KinematicBody2D

export var moveSpeed: int = 100;

var sneaking: bool = false;

onready var animTree = $AnimationTree;
onready var stateMachine = animTree.get('parameters/playback');
onready var screenSize = get_viewport_rect().size;

func _physics_process(delta):
	if Input.is_action_just_pressed("game_attack"):
		stateMachine.travel('punch');
		return;
	
	var movement = getMovement();
	if movement.length() == 0:
		stateMachine.travel('idle');
	else:
		stateMachine.travel('walk');
		if movement.x != 0:
			$Sprite.scale.x = movement.x;
	
	move_and_slide(movement.normalized() * moveSpeed);
	
	# Limit the movement to the screen
	position.x = clamp(position.x, 0, screenSize.x);
	position.y = clamp(position.y, 0, screenSize.y);

	pass;

func getMovement():
	var movement = Vector2.ZERO;
	if Input.is_action_pressed("game_right"):
		movement.x += 1;
	if Input.is_action_pressed("game_left"):
		movement.x -= 1;
	if Input.is_action_pressed("game_down"):
		movement.y += 1;
	if Input.is_action_pressed("game_up"):
		movement.y -= 1;
	return movement;

func hurt(damage: int):
	stateMachine.travel('hurt');
	pass;
