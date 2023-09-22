from fastapi import FastAPI

app = FastAPI()


@app.get("/")
def hello_world() -> dict:
    return {"message": "Hello World"}
