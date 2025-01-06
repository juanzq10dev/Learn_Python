import app.ui.messages as display_message
import app.lib.utils as utils
from app.lib.move import Pokemon_Move


class Pokemon:
    def __init__(self, name: str, hp: int):
        self.name = name
        self.hp = hp
        self.max_hp = hp
        self.status = None
        self.level = 50
        self.moves = [
            Pokemon_Move("Close Combat", 120),
            Pokemon_Move("Stone Edge", 100),
            Pokemon_Move("Ice Punch", 75),
            Pokemon_Move("Payback", 50),
        ]

    def use_move(self, move_index: int, target: "Pokemon"):
        if move_index > len(self.moves):
            raise Exception(f"Move index should be between 1 and {len(self.moves)}")

        move = self.moves[move_index]
        damage = utils.calculate_damage(self.level, move.damage)
        target.take_damage(damage)
        display_message.attack(self.name)

    def take_damage(self, damage) -> None:
        self.hp -= damage
        if self.hp < 0:
            self.hp = 0

    def heal(self):
        self.hp += 10
        if self.hp > self.max_hp:
            self.max_hp
