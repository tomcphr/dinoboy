extends Node2D

var currentState: State;
var charAnimation: AnimatedSprite;

func _init(anim: AnimatedSprite):
	charAnimation = anim;

func _process(delta):
	if currentState:
		currentState._process(delta);
		
func getState():
	return currentState;

func setState(state: State):
	if (state == currentState):
		return;
	
	if currentState:
		currentState.onExit();
	
	currentState = state;
	
	currentState.onEnter(charAnimation);
