import app.lib.logs as logs

class Pokemon:
    def __init__(self, name: str, hp: int):
        self.name = name
        self.hp = hp
        self.max_hp = hp
        self.status = None

    def attack(self, target: "Pokemon"):
        target.hp -= 10
        logs.attack(self.name)
    
    
    def heal(self):
        self.hp += 10
        if self.hp > self.max_hp:
            self.max_hp
