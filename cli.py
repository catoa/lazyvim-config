import sys


# @app.command()
def thistest():
    x = [line.strip() for line in sys.stdin.readlines() if line]
    # x = input()
    print(x)
    # pr_body = json.loads(pr_body)
    # typer.echo(f"Hello {pr_body['action']}")


if __name__ == "__main__":
    thistest()
