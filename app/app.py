from typing import Dict

from fastapi import FastAPI

app = FastAPI()


@app.get("/")
def hello_world() -> Dict:
    return {"message": "Hello World"}
