FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

ENV PORT=8080

CMD [
  "gunicorn",
  "app:app",
  "-k", "uvicorn.workers.UvicornWorker",
  "-w", "1",
  "--timeout", "600",
  "--graceful-timeout", "600",
  "--keep-alive", "5",
  "-b", ":8080"
]
