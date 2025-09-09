from fastapi import FastAPI
from fastapi.responses import PlainTextResponse
import os

app = FastAPI(title="pong-service")

@app.get("/health")
def health():
    return {"status": "UP"}

@app.get("/api/pong", response_class=PlainTextResponse)
def pong():
    env = os.getenv("ENVIRONMENT", "unknown")
    return f"pong-{env}"
