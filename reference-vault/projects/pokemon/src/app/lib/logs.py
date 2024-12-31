from functools import wraps


def show_log(function):
    @wraps(function)
    def wrapper(*args, **kwargs):
        str = function(*args, **kwargs)
        print(str)

    return wrapper


@show_log
def show_winner(player_name: str) -> str:
    return f"{player_name} wins"


@show_log
def choose_action(player_name: str) -> str:
    return f"{player_name}'s turn:\n" + "\t1. Attack\n" + "\t2. Heal\n"


@show_log
def invalid_action() -> str:
    return "Please select 1 or 2"
