import sys

import json


def main():
    print(json.dumps({"hello": "world"}))
    print(json.loads(sys.argv[1]))


if __name__ == "__main__":
    main()
