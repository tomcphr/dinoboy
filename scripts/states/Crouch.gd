extends State

func _ready():
	print('crouch enter');
	pass;

func _process(delta):
	.getAnimation().play('crouch');
	pass;
