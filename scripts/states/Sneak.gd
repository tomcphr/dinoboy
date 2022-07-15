extends State

func _ready():
	print('sneak enter');
	pass;

func _process(delta):
	.getAnimation().play('sneak');
	pass;
