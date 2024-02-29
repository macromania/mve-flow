from promptflow import tool

@tool
def main(pdf_url:str, question: str) -> dict[str, str]:
    return {
        "pdf_url": pdf_url,
        "question": question
    }