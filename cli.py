import sys


def main():

    if len(sys.argv) > 1:
        text = " ".join(sys.argv[1:])
        print("Input text:", text.split())
    else:
        print("No input text provided.")


if __name__ == "__main__":
    main()
