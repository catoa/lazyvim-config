import sys

import json
import dataclasses
import os

from typing import Self

PR_DESCRIPTION = os.getenv("PR_DESCRIPTION")
PR_SECTION_HEADER = "## Pull Request Branches"
REPO_BRANCH_SEP = ":"

ALLOWED_REPOS = [
    "leaflogix",
    "back-office",
    "armageddon",
    "dutchiepay",
    "dutchie",
]


@dataclasses.dataclass
class PullRequestEnvBranch:
    repo_name: str
    selected: bool
    branch: str = "develop"

    @classmethod
    def from_line(cls, line) -> Self:
        repo_name, branch = tuple(
            line.replace("-", "", 1).strip().split(REPO_BRANCH_SEP)
        )
        selection, repo_name = repo_name.split()
        selected = selection == "[x]".lower()
        return cls(repo_name, selected, branch.strip())

    def to_dict(self):
        return {self.repo_name: {"selected": self.selected, "branch": self.branch}}


def main():
    if PR_DESCRIPTION is None:
        print("No PR description found")
        sys.exit(1)
    pr_desc_lines = [
        line for line in map(lambda s: s.strip(), PR_DESCRIPTION.split("\n")) if line
    ]
    branches = pr_desc_lines[pr_desc_lines.index(PR_SECTION_HEADER) + 1 :]
    pr_branches = [PullRequestEnvBranch.from_line(branch) for branch in branches]
    result = {}
    for pr_branch in pr_branches:
        if pr_branch.repo_name in ALLOWED_REPOS:
            result.update({pr_branch.repo_name: pr_branch.branch})
        else:
            print(f"Repo {pr_branch.repo_name} not allowed")
            sys.exit(1)
    print(
        json.dumps(
            result,
        )
    )


if __name__ == "__main__":
    main()
