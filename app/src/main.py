from fastapi import FastAPI
import os

app = FastAPI()

@app.get("/")
async def root():
    return {"message": "hello from devops-job-sim"}

@app.get("/health")
async def health():
    return {"status": "ok"}

@app.get("/version")
async def version():
    ver = os.getenv("APP_VERSION", "v0.1")
    return {"version": ver}
