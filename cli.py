import sys

PR_SECTION_HEADER = "## Pull Request Branches"


def main():
    lines = [line.strip() for line in sys.stdin.readlines() if line.strip()]
    branches = lines[lines.index(PR_SECTION_HEADER) + 1 :]
    print(f"Branches: {branches}")
    print([branch.replace("-", "", 1) for branch in branches])


if __name__ == "__main__":
    main()
