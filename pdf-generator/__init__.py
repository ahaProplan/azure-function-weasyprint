import logging
import azure.functions as func
from weasyprint import HTML


def main(req: func.HttpRequest) -> func.HttpResponse:
    pdf = HTML(string=req.get_body().decode('utf-8')).write_pdf(presentational_hints=true)
    return func.HttpResponse(pdf)
