import json
import sys


# @app.command()
def thistest():
    for line in sys.stdin:
        print(line)
    # x = input()
    # print(x.split())
    # pr_body = json.loads(pr_body)
    # typer.echo(f"Hello {pr_body['action']}")


if __name__ == "__main__":
    thistest()
