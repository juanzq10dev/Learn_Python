import app.ui.messages as logs
import app.ui.io as io
from app.lib.pokemon import Pokemon
from app.game.trainer import Pokemon_Trainer


class Battle:
    def __init__(self):
        self.trainer1 = Pokemon_Trainer(
            "Player 1", [Pokemon("Pikachu", 100), Pokemon("Raychu", 200)]
        )
        self.trainer2 = Pokemon_Trainer(
            "Player 2", [Pokemon("Charizard", 100), Pokemon("Bulbasaur", 200)]
        )
        self.pokemon1 = self.trainer1.pokemon_team[0]
        self.pokemon2 = self.trainer2.pokemon_team[0]
        self.players_turn = self.pokemon2
        self.not_players_turn = self.pokemon1
        pass

    def change_turn(self):
        if self.players_turn == self.pokemon1:
            self.players_turn = self.pokemon2
            self.not_players_turn = self.pokemon1
        else:
            self.players_turn = self.pokemon1
            self.not_players_turn = self.pokemon2

    def game_loop(self):
        game_finished = False
        while not game_finished:
            self.show_health_bars()
            self.action()
            game_finished = self.check_game_finished()
            self.change_turn()

        self.show_health_bars()

    def check_game_finished(self) -> bool:
        if self.pokemon1.hp <= 0:
            logs.show_winner(self.pokemon2.name)
            return True

        if self.pokemon2.hp <= 0:
            logs.show_winner(self.pokemon1.name)
            return True

        return False

    def action(self):
        logs.choose_action(self.players_turn.name)

        user_input_int = io.read_input_int("Select action: ")

        if user_input_int is None:
            logs.invalid_action()
            self.action()

        match user_input_int:
            case 1:
                self.use_movement()
            case 2:
                self.players_turn.heal()
            case _:
                logs.invalid_action()
                self.action()

        self.players_turn

    def use_movement(self):
        logs.choose_movement(self.players_turn.moves)
        user_input_int = io.read_input_int("Select an option: ")
        self.players_turn.use_move(user_input_int, self.not_players_turn)

    def show_health_bars(self):
        logs.show_pokemon_healthbar(self.pokemon1)
        logs.show_pokemon_healthbar(self.pokemon2)
