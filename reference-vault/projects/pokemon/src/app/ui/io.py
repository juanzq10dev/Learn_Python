def read_input_int(message: str) -> int:
    user_input = input(message)

    if user_input.isdigit():
        return int(user_input)

    return None
