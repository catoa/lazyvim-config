import json
import sys


# @app.command()
def thistest():
    x = sys.stdin.readlines()
    # x = input()
    print(x)
    # pr_body = json.loads(pr_body)
    # typer.echo(f"Hello {pr_body['action']}")


if __name__ == "__main__":
    thistest()
