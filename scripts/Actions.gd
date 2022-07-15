extends Node2D

class_name Actions

var sneaking: bool = false;

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

func isMoving():
	return getMovement().length() > 0;

func isSneaking():
	if Input.is_action_just_pressed("game_shift"):
		sneaking = !sneaking;
	return sneaking;
