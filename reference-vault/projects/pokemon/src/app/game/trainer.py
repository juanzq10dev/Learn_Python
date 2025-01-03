from app.lib.pokemon import Pokemon
from typing import List
import app.ui.messages as messages
import app.ui.io as io


class Pokemon_Trainer:
    def __init__(self, name: str, pokemon_team: List["Pokemon"]):
        self.name = name
        self.pokemon_team = pokemon_team
        self.pokemon_in_battle = pokemon_team[0]
