extends Area2D



func _on_burger_body_entered(body: Node) -> void:
	#see if it is the player
	if body.name == "player":
		#change the start position variable
		body.start_position = global_position
		#delete it with queue_free()?
