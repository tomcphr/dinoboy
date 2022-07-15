extends State

func _ready():
	print('attack enter');
	pass;

func _process(delta):
	.getAnimation().play('attack');
	pass;

func isEndCondition():
	yield (.getAnimation(), 'animation_finished');
