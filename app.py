def calculate_total(price, quantity):
    if price < 0 or quantity < 0:
        raise ValueError("Values cannot be negative")
    return price * quantity


if __name__ == "__main__":
    print(calculate_total(25, 4))