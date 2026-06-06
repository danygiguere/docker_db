# Mailpit — local email catcher

Catches all outgoing emails from any local service. No configuration needed.

```bash
cp .env.example .env   # first time only — adjust ports if needed
docker compose up -d
```

- **SMTP:** `localhost:${MAILPIT_SMTP_PORT}` (default `1025`) — point any local app here instead of a real mail server
- **Web UI:** `http://localhost:${MAILPIT_UI_PORT}` (default `8025`) — view all captured emails
