import sys
from dataclasses import dataclass

PR_SECTION_HEADER = "## Pull Request Branches"


@dataclass
class PullRequestEnvBranch:
    app_name: str
    branch: str
    selected: bool


def main():
    lines = [line.strip() for line in sys.stdin.readlines() if line.strip()]
    branches = lines[lines.index(PR_SECTION_HEADER) + 1 :]
    print(f"Branches: {branches}")

    def parse_repo_and_branch_name(branch):
        app_name, branch = tuple(branch.replace("-", "", 1).strip().split(":"))
        selected, app_name = app_name.split()
        return PullRequestEnvBranch(app_name, branch, selected == "[x]".lower())

    print([parse_repo_and_branch_name(branch) for branch in branches])


if __name__ == "__main__":
    main()
