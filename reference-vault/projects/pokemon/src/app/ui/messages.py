from functools import wraps
from tqdm import tqdm
from app.lib.pokemon import Pokemon
from app.lib.move import Pokemon_Move
from typing import List


def show_log(function):
    @wraps(function)
    def wrapper(*args, **kwargs):
        str = function(*args, **kwargs)
        print(str)

    return wrapper


@show_log
def show_winner(player_name: str) -> str:
    return f"{player_name} wins\n"


@show_log
def choose_action(player_name: str) -> str:
    return f"\n{player_name}'s turn:\n" + "\t1. Attack\n" + "\t2. Heal\n"


@show_log
def invalid_action() -> str:
    return "Please select 1 or 2"


@show_log
def attack(player_name: str) -> str:
    return f"{player_name} attacked!\n"


@show_log
def select_pokemon(pokemon_team: List["Pokemon"]):
    message = "Select a pokemon:\n"
    for i in range(len(pokemon_team)):
        message += f"{i}. {pokemon_team[i].name} \n"

    return message

@show_log
def choose_movement(moves: List["Pokemon_Move"]):
    message = "Choose a movement: \n"
    for i in range(len(moves)):
        message += f"{i}. {moves[i].name} \n"
    
    return message

@show_log
def use_movement(pokemon_name: str, move_name:str) -> str:
    return f"{pokemon_name} used {move_name}" 

def display_health_bar(name: str, health: int, max_health: int) -> None:
    bar = tqdm(
        total=max_health,
        desc=name,
        bar_format="{l_bar}{bar}| {n_fmt}/{total_fmt}",
        ncols=50,
    )
    bar.n = health
    bar.refresh()
    bar.close()


def show_pokemon_healthbar(pokemon: "Pokemon"):
    display_health_bar(pokemon.name, pokemon.hp, pokemon.max_hp)
