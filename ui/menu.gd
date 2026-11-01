extends Control


func _on_button_pressed() -> void:
	GameState.move_to_main()


func _on_licenses_pressed() -> void:
	get_tree().change_scene_to_file("res://ui/licenses.tscn")
