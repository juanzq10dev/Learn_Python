from app.lib.pokemon import Pokemon
from typing import List
import app.ui.messages as display_messages
import app.ui.io as io


class Pokemon_Trainer:
    def __init__(self, name: str, pokemon_team: List["Pokemon"]):
        self.name = name
        self.pokemon_team = pokemon_team
        self.pokemon_in_battle_index = 0

    def get_pokemon_in_battle(self) -> "Pokemon":
        return self.pokemon_team[self.pokemon_in_battle_index]

    def choose_attack(self) -> int:
        user_input_int = io.read_input_int("Select an option")
        if (
            user_input_int is None
            or user_input_int < 0
            or user_input_int >= len(self.get_pokemon_in_battle().moves)
        ):
            self.choose_attack()
        
        return user_input_int

    def choose_pokemon(self) -> None:
        display_messages.select_pokemon(self.pokemon_team)
        user_input_int = io.read_input_int("Select action: ")

        if (
            user_input_int is None
            or user_input_int < 0
            or user_input_int >= len(self.pokemon_team)
            or user_input_int == self.pokemon_in_battle_index
        ):
            self.choose_pokemon()

        self.pokemon_in_battle_index = user_input_int
