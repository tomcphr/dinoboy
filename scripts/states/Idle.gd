extends State

func _ready():
	print('idle enter');
	pass;

func _process(delta):
	.getAnimation().play('idle');
	pass;
