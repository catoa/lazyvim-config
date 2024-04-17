import sys
from dataclasses import dataclass


from typing import Self

PR_SECTION_HEADER = "## Pull Request Branches"


@dataclass
class PullRequestEnvBranch:
    app_name: str
    branch: str
    selected: bool

    @classmethod
    def from_line(cls, line) -> Self:
        app_name, branch = tuple(line.replace("-", "", 1).strip().split(":"))
        selected, app_name = app_name.split()
        return cls(app_name, branch.strip(), selected == "[x]".lower())


def main():
    lines = [line for line in map(lambda s: s.strip(), sys.stdin.readlines()) if line]
    branches = lines[lines.index(PR_SECTION_HEADER) + 1 :]
    print(f"Branches: {branches}")

    print([PullRequestEnvBranch.from_line(branch) for branch in branches])


if __name__ == "__main__":
    main()
