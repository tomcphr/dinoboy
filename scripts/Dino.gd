extends KinematicBody2D

export var moveSpeed: int = 100;

onready var animTree = $AnimationTree;
onready var stateMachine = animTree.get('parameters/playback');

onready var actions = load('res://scripts/Actions.gd').new();

#onready var screen_size = get_viewport_rect().size;
func _ready():
	#stateMachine.start('idle');
	#stateMachine.travel('walk');
	pass;

func _process(delta):
	var moving = actions.isMoving();
	var sneaking = actions.isSneaking();
	
	if Input.is_action_just_pressed("game_attack"):
		print('attack pressed');
		stateMachine.travel('kick');
		return;
	
	var state = 'idle';
	if sneaking:
		state = 'crouch';
	
	if moving:
		var movement = actions.getMovement();
		position += (movement.normalized() * moveSpeed) * delta;
		$Sprite.scale.x = movement.x;
		
		state = 'walk';
		if sneaking:
			state = 'sneak';
	
	stateMachine.travel(state);

	pass;
