from pathlib import Path
from itertools import accumulate
from operator import add


class Day2:
    def __init__(self, input_file: Path) -> None:
        self.input_file = input_file
        self.input_file_contents = self.input_file.open("r").read().splitlines()

    def part1(self) -> None:
        return sum(
            map(
                lambda l: int(l.split(" ")[1]),
                filter(lambda l: "forward" in l, self.input_file_contents),
            )
        ) * sum(
            map(
                lambda l: int(l.split(" ")[1])
                if "down" in l
                else -int(l.split(" ")[1]),
                filter(lambda l: "up" in l or "down" in l, self.input_file_contents),
            )
        )

    def part2(self) -> None:
        a = tuple(
            accumulate(
                map(
                    lambda l: int(l.split(" ")[1])
                    if "down" in l
                    else -int(l.split(" ")[1])
                    if "up" in l
                    else 0,
                    self.input_file_contents,
                ),
                func=add,
                initial=0,
            )
        )
        f = tuple(
            map(
                lambda l: int(l.split(" ")[1]) if "forward" in l else 0,
                self.input_file_contents,
            )
        )
        return sum(f) * sum(map(lambda x: x[0] * x[1], zip(a, f)))


print(Day2(Path(__file__).with_name("2.input")).part1())
print(Day2(Path(__file__).with_name("2.input")).part2())
