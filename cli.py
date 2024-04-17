import sys

PR_SECTION_HEADER = "## Pull Request Branches"


def main():
    lines = [line.strip() for line in sys.stdin.readlines() if line.strip()]
    pr_section = lines[lines.index(PR_SECTION_HEADER) :]
    print(pr_section)


if __name__ == "__main__":
    main()
