"""Advent of code 2021 Day 1.1"""

from pathlib import Path

class Day1_1:
    def __init__(self, input_file: Path) -> None:
        self.input_file = input_file
        self.data = list(map(int, input_file.open("r").read().splitlines()))
    
    def solution_1(self) -> int:
        incs = 0
        for i, dp in enumerate(self.data):
            if i > 0 and dp > self.data[i-1]:
                incs += 1
        return incs

    def solution_2(self) -> int:
        incs = 0
        for i in range(3, len(self.data)):
            l = self.data[i-4:i-1]
            r = self.data[i-3:i]
            if sum(l) < sum(r):
                incs += 1
        return incs



print(Day1_1(Path(__file__).with_name("1.1.input")).solution_1())
print(Day1_1(Path(__file__).with_name("1.1.input")).solution_2())