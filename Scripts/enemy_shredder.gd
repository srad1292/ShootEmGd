extends Node2D

signal enemy_escaped


func _on_area_2d_area_entered(area):
	enemy_escaped.emit()
