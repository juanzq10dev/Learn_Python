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
            print(f"{self.player2.name} wins")
            return True
        
        if self.player2.hp <= 0:
            print(f"{self.player1.name} wins")
            return True
        
        return False
    
    def action(self):
        print(f"{self.players_turn.name} turn:")
        print("\t1. Attack")
        print("\t2. Heal")
        
        user_input = input("Select action:")
        
        if user_input.isdigit():
            user_input = int(user_input)
        else:
            print("Please select 1 or 2.")
            self.action()
        
        match user_input:
            case 1:
                self.players_turn.attack(self.not_players_turn)
            case 2:
                self.players_turn.heal()
            case _:
                print("Please select 1 or 2.")
                self.action()
