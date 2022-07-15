extends Node2D

class_name State

var charAnimation: AnimatedSprite;

func onEnter(anim: AnimatedSprite):
	charAnimation = anim;
	pass;
	
func isEndCondition(): 
	return false;

	
func onExit():
	pass;

func getAnimation():
	return charAnimation;
