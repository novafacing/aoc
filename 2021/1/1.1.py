"""Advent of code 2021 Day 1.1"""

from pathlib import Path
from functools import reduce

class Day1_1:
    def __init__(self, input_file: Path) -> None:
        self.input_file = input_file
        self.data = list(map(int, input_file.open("r").read().splitlines()))
    
    def solution_1(self) -> int:
        return sum(
            map(
                lambda i: 1 if (
                    self.data[i-1] < self.data[i]
                ) else 0,
                range(1, len(self.data))
            )
        )

    def solution_2(self) -> int:
        return sum(
            map(
                lambda i: 1 if (
                    sum(self.data[i-4:i-1]) < sum(self.data[i-3:i])
                ) else 0,
                range(3, len(self.data))
            )
        )

print(Day1_1(Path(__file__).with_name("1.1.input")).solution_1())
print(Day1_1(Path(__file__).with_name("1.1.input")).solution_2())