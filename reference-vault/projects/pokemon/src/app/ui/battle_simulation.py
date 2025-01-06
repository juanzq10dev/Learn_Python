from app.game_controller.battle_controller import BattleController
from app.game_logic.trainer import Pokemon_Trainer
import app.ui as ui


class PokemonBattleSimulation:
    """
    The main entry point of the battle simulation
    """

    def __init__(self, trainer1, trainer2):
        self.controller = BattleController(trainer1, trainer2)

    def start(self):
        while not self.controller.is_battle_over():
            pass
    
    def show_battle_status(self):
        pass
        
