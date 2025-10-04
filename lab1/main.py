import math


def scan(*, label: str, default: float) -> float:
    scanned = input(f'Введіть значення "{label}" ({default} за замовчуванням): ')
    if scanned == "":
        return default
    return float(scanned)


def f(a: float, b: float, c: float, k: float, x: float) -> float:
    term1 = math.sqrt(math.fabs((math.cos(k**2) * x - b) / (a**2 + b**2)))
    term2 = (10**4) * math.exp(7)
    term3 = (math.tan(k**2 * x) + 5 ** (1 / 3)) / (a - math.sin(k**2 * x))
    term4 = c / k
    return term1 - term2 + term3 - term4


a = scan(label="a", default=-1.7)
b = scan(label="b", default=2.32)
c = scan(label="c", default=0.92)
k = scan(label="k", default=2)
x = scan(label="x", default=0.057)
print(f"a = {a}\nb = {b}\nc = {c}\nk = {k}\nx = {x}")

y = f(a, b, c, k, x)
print(f"y = {y}")
