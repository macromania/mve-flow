from promptflow import tool
from typing import List

@tool
def main(pdf_url:str, question: str):
    context: List[str] = []

    return {
        "context": context,
        "question": question
    }