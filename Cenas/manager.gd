extends Node

signal hud_updated

var score: int = 0
var lives: int = 3

func add_points(points: int):
	score += points
	hud_updated.emit()

func add_life(amount: int = 1):
	lives += amount
	hud_updated.emit()

func lose_life():
	lives -= 1
	hud_updated.emit()

func reset_stats():
	score = 0
	lives = 3
	hud_updated.emit()
