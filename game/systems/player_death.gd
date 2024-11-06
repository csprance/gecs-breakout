## Any Entity can contain a PlayerDeath component to indicate that the player has died.
class_name PlayerDeathSystem
extends System

func query(q: QueryBuilder) -> QueryBuilder:
	return q.with_all([PlayerDeath])


func process(entity: Entity, delta: float):
	var game_state = GameStateUtils.get_game_state()
	game_state.lives -= 1
	
	Loggie.debug("PlayerDeathSystem", "Player died. Lives remaining: " + str(game_state.lives))
	entity.remove_component(PlayerDeath)
