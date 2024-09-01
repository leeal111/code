import PyPDF2


def content_handle(string):
    """Process and return the string content."""
    string = string.strip().replace("\n", " ").replace("\r", " ")
    string = string[string.find(" ") + 1 :]
    string = string[string.find("　") + 1 :]
    return string


def get_row_table(pdf_path):
    """Extract the table of contents from a PDF file."""
    try:
        with open(pdf_path, "rb") as pdf_file:
            reader = PyPDF2.PdfReader(pdf_file)

            if reader.is_encrypted:
                print("The PDF has been encrypted.")
                return None

            outlines = reader.outline

            if not outlines:
                print("The PDF does not have an outline.")
                return None

            return outlines
    except FileNotFoundError:
        print(f"The file {pdf_path} does not exist.")
        return None
    except Exception as e:
        print(f"An error occurred: {e}")
        return None


def print_outline(item, level=0, file=None):
    """Recursively print the outline of the PDF to a file."""
    if isinstance(item, dict):
        title = item.get("/Title", "No Title")
        file.write("#" * (level + 1) + " " + content_handle(title) + "\n")
        file.write(3 * "\n")

    elif isinstance(item, list):
        for subitem in item:
            print_outline(subitem, level + 1, file)


def main(pdf_path, output_path):
    with open(output_path, "w", encoding="utf-8") as file:
        table = get_row_table(pdf_path)
        print(table[3])
        if table is not None:
            print_outline(table, file=file)


if __name__ == "__main__":
    pdf_path = "test.pdf"
    output_path = "res.txt"
    main(pdf_path, output_path)
