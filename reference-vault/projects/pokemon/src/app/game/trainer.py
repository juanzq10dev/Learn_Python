from app.lib.pokemon import Pokemon
from typing import List
import app.ui.messages as display_messages
import app.ui.io as io


class Pokemon_Trainer:
    def __init__(self, name: str, pokemon_team: List["Pokemon"]):
        self.name = name
        self.pokemon_team = pokemon_team
        self.pokemon_in_battle = pokemon_team[0]

    def choose_pokemon(self) -> "Pokemon":
        display_messages.select_pokemon(self.pokemon_team)
        user_input_int = io.read_input_int("Select action: ")

        if user_input_int < 0 or user_input_int > len(self.pokemon_team):
            self.choose_pokemon()

        return self.pokemon_team[user_input_int]
