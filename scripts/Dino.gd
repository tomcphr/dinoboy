extends Node2D

export var moveSpeed: int = 100;

onready var stateMachine = load('res://scripts/StateMachine.gd').new($Anim);
onready var idleState = load('res://scripts/states/Idle.gd').new();
onready var moveState = load('res://scripts/states/Move.gd').new();
onready var crouchState = load('res://scripts/states/Crouch.gd').new();
onready var sneakState = load('res://scripts/states/Sneak.gd').new();
onready var attackState = load('res://scripts/states/Attack.gd').new();

onready var player = load('res://scripts/Player.gd').new();

#onready var screen_size = get_viewport_rect().size;

func _ready():
	stateMachine.setState(idleState);
	pass;

func _process(delta):
	#if (stateMachine.getState().isEndCondition()):
	#	stateMachine.setState(idleState);

	if player.pressedAttack():
		stateMachine.setState(attackState);
	
	print(stateMachine.getState().isEndCondition());
	if stateMachine.getState().isEndCondition():
		stateMachine.setState(idleState);

	#var moving = player.isMoving();
	#var sneaking = player.isSneaking();
	
	#var state = idleState;
	#if moving:
	#	state = moveState;

	#if sneaking:
	#	state = sneakState;
	#	if !moving:
	#		state = crouchState;
	
	#stateMachine.setState(state);
	
	#if moving:
	#	var movement = player.getMovement();
	#	position += (movement.normalized() * moveSpeed) * delta;
	#	$Anim.flip_h = movement.x < 0;
	
	stateMachine._process(delta);
	pass;
