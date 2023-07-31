extends ActionLeaf



func tick(actor, blackboard):
	
	# SEMPRE ATUALIZANDO A DISTANCE ENTRE O PLAYER E O JACKAL BOSS ENQUANTO O ULTIMO ATACA:
	var distance_to_target = actor.enemyBody.get_global_position() - actor.get_child(0).get_global_position();
	actor.distance = distance_to_target;
	
	
	# SELECIONANDO ANIMACAO DE ATAQUE DE ACORDO COM A ULTIMA ANIMACAO DE MOVIMENTACAO:
	match blackboard.get("state"):
		actor.CurrentState.WALK_LEFT:
			actor.startAnimation("attack_left");
			
		actor.CurrentState.WALK_TOP:
			actor.startAnimation("attack_top");
		
		actor.CurrentState.WALK_DOWN:
			actor.startAnimation("attack_down");
			
		actor.CurrentState.WALK_RIGHT:
			actor.startAnimation("attack_right");


	return SUCCESS;
