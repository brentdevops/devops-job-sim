# Builder stage: install deps and prepare wheel cache
FROM python:3.11-slim AS builder
WORKDIR /app
COPY src/requirements.txt .
RUN python -m pip install --upgrade pip setuptools wheel \
 && python -m pip install --no-cache-dir --prefix=/install -r requirements.txt

# Final stage: minimal runtime image
FROM python:3.11-slim
WORKDIR /app
# copy installed packages from builder
COPY --from=builder /install /usr/local
# copy application code
COPY src /app
ENV APP_VERSION="v0.1"
# expose port used by Uvicorn
EXPOSE 8080
# default command to run the app
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080", "--loop", "uvloop", "--workers", "1"]
