import os
from fastapi import FastAPI

app = FastAPI()

# Lấy biến môi trường TARGET_ENV (được set lúc deploy Cloud Run)
current_env = os.getenv("TARGET_ENV", "Local")

@app.get("/")
def read_root():
    return {
        "message": f"Hello from {current_env} Environment! (App 1)",
        "status": "running",
        "service": "app1",
        "version": os.getenv("K_REVISION", "local-dev") # Revision ID của Cloud Run
    }

@app.get("/health")
def health_check():
    return {"status": "ok"}