import app.game.battle as battle
from app.lib.pokemon import Pokemon
from app.game.trainer import Pokemon_Trainer


def main() -> None:
    trainer1 = Pokemon_Trainer(
        "Player 1", [Pokemon("Pikachu", 100), Pokemon("Raychu", 200)]
    )
    trainer2 = Pokemon_Trainer(
        "Player 2", [Pokemon("Charizard", 100), Pokemon("Bulbasaur", 200)]
    )
    
    battle.Battle(trainer1, trainer2).game_loop()


if __name__ == "__main__":
    main()
