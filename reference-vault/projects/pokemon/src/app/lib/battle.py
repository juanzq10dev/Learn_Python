import app.lib.logs as logs
from app.lib.pokemon import Pokemon


class Battle:
    def __init__(self):
        self.player1 = Pokemon("Player1", 100)
        self.player2 = Pokemon("Player2", 100)
        self.players_turn = self.player2
        self.not_players_turn = self.player1
        pass

    def change_turn(self):
        if self.players_turn == self.player1:
            self.players_turn = self.player2
            self.not_players_turn = self.player1
        else:
            self.players_turn = self.player1
            self.not_players_turn = self.player2

    def game_loop(self):
        game_finished = False
        while not game_finished:
            self.action()
            game_finished = self.check_game_finished()
            self.change_turn()

    def check_game_finished(self) -> bool:
        if self.player1.hp <= 0:
            logs.show_winner(self.player2.name)
            return True

        if self.player2.hp <= 0:
            logs.show_winner(self.player1.name)
            return True

        return False

    def action(self):
        logs.choose_action(self.players_turn.name)

        user_input = input("Select action:")

        if user_input.isdigit():
            user_input = int(user_input)
        else:
            logs.invalid_action()
            self.action()

        match user_input:
            case 1:
                self.players_turn.attack(self.not_players_turn)
            case 2:
                self.players_turn.heal()
            case _:
                logs.invalid_action()
                self.action()
