from promptflow import tool

@tool
def main(pdf_url:str, question: str):
    return {
        "pdf_url": pdf_url,
        "question": question
    }