extends State

func _ready():
	print('move enter');
	pass;

func _process(delta):
	.getAnimation().play('walk');
	pass;
