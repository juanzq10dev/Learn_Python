import app.lib.logs as logs
from app.lib.move import Pokemon_Move


class Pokemon:
    def __init__(self, name: str, hp: int):
        self.name = name
        self.hp = hp
        self.max_hp = hp
        self.status = None
        self.moves = [
            Pokemon_Move("Close Combat", 120),
            Pokemon_Move("Stone Edge", 100),
            Pokemon_Move("Ice Punch", 75),
            Pokemon_Move("Payback", 50),
        ]

    def attack(self, target: "Pokemon"):
        target.hp -= 10
        logs.attack(self.name)

    def choose_attack(self):
        print("Choose attack")
        for i in range(len(self.moves)):
            print(f"{i}: {self.moves[i].name}")

    def heal(self):
        self.hp += 10
        if self.hp > self.max_hp:
            self.max_hp
