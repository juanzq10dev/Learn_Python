from functools import wraps
from tqdm import tqdm
from app.lib.pokemon import Pokemon


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
