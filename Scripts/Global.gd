extends Node

var score = 0
var has_gem = false
var has_key = false

func increase_score(value: int):
	score += value
	
func clear_score():
	score = 0
	
func get_score() -> int:
	return score

func get_gem():
	return has_gem
	
func set_gem(gem: bool):
	has_gem = gem
	
func set_key(key: bool):
	has_key = key
	
func get_key():
	return has_key
