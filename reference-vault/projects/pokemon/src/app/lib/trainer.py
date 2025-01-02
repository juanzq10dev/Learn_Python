from app.lib.pokemon import Pokemon
from typing import List
import app.ui.messages as messages
import app.ui.io as io

class Pokemon_Trainer():
    def __init__(self, name: str, pokemon_team: List["Pokemon"]):
        self.name = name
        self.pokemon_team = pokemon_team
    
    
    def choose_action(self):
        messages.choose_action(self.name)
        user_input_int = io.read_input_int("Select action: ")

        if user_input_int is None:
            messages.invalid_action()
            self.action()
        
        return user_input_int

        # match user_input_int:
        #     case 1:
        #         self.players_turn.use_move(1, self.not_players_turn)
        #     case 2:
        #         self.players_turn.heal()
        #     case _:
        #         logs.invalid_action()
        #         self.action()
        
        
    