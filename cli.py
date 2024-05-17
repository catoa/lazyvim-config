import sys
import json
import dataclasses


from typing import Self

PR_SECTION_HEADER = "## Pull Request Branches"
REPO_BRANCH_SEP = ":"

ALLOWED_REPOS = [
    "leaflogix",
    "back-office",
    "Armageddon",
    "DutchiePay",
    "Dutchie",
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
        return cls(repo_name, branch.strip(), selected)


def main():
    pr_desc_lines = [
        line for line in map(lambda s: s.strip(), sys.stdin.readlines()) if line
    ]
    branches = pr_desc_lines[pr_desc_lines.index(PR_SECTION_HEADER) + 1 :]
    pr_branches = [PullRequestEnvBranch.from_line(branch) for branch in branches]
    print(json.dumps([dataclasses.asdict(pr_branch) for pr_branch in pr_branches]))


if __name__ == "__main__":
    main()
