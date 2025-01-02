import random


def calculate_damage(pokemon_level: int, move_power: int) -> int:
    return int(
        (((2 * pokemon_level / 5) + 2) * move_power / 50 + 2)
        * (random.randint(217, 255) / 255)
    )
