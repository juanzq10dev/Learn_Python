import app.ui.messages as display_message
import app.ui.io as io
from app.lib.pokemon import Pokemon
from app.game.trainer import Pokemon_Trainer


class Battle:
    def __init__(self, trainer1: Pokemon_Trainer, trainer2: Pokemon_Trainer):
        self.trainer1 = trainer1
        self.trainer2 = trainer2
        self.players_turn = self.trainer2
        self.not_players_turn = self.trainer1
        pass

    def change_turn(self):
        if self.players_turn == self.trainer1:
            self.players_turn = self.trainer2
            self.not_players_turn = self.trainer1
        else:
            self.players_turn = self.trainer1
            self.not_players_turn = self.trainer2

    def game_loop(self):
        game_finished = False
        while not game_finished:
            self.show_health_bars()
            self.action(self.players_turn, self.not_players_turn)
            game_finished = self.check_game_finished()
            self.change_turn()

        self.show_health_bars()

    def check_game_finished(self) -> bool:
        if self.trainer1.get_pokemon_in_battle().hp <= 0:
            display_message.show_winner(self.trainer2.name)
            return True

        if self.trainer2.get_pokemon_in_battle().hp <= 0:
            display_message.show_winner(self.trainer1.name)
            return True

        return False

    def action(self, attacker: Pokemon_Trainer, defender: Pokemon_Trainer):
        display_message.choose_action(attacker.name)

        user_input_int = io.read_input_int("Select action: ")

        if user_input_int is None:
            display_message.invalid_action()
            self.action()

        attacker_pokemon = attacker.get_pokemon_in_battle()
        defender_pokemon = defender.get_pokemon_in_battle()

        match user_input_int:
            case 1:
                display_message.choose_movement(attacker_pokemon.moves)
                attacker_pokemon.use_move(attacker.choose_attack(), defender_pokemon)
            case 2:
                attacker_pokemon.heal()
            case 3:
                attacker.choose_pokemon()
            case _:
                display_message.invalid_action()
                self.action()

        self.players_turn

    def show_health_bars(self):
        display_message.show_pokemon_healthbar(self.trainer1.get_pokemon_in_battle())
        display_message.show_pokemon_healthbar(self.trainer2.get_pokemon_in_battle())
