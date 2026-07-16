CREATE TABLE IF NOT EXISTS events
(
    id              INTEGER PRIMARY KEY,
    session_id      TEXT NOT NULL,
    object_id       TEXT DEFAULT 0,
    object_type     TEXT    DEFAULT 'zvit',
    event_type      TEXT NOT NULL,
    filename        TEXT,
    delivery_method TEXT,
    message         TEXT,
    created_at      TEXT    DEFAULT (datetime('now', 'localtime')) NOT NULL
);

CREATE INDEX IF NOT EXISTS idx_events_session ON events (session_id);
CREATE INDEX IF NOT EXISTS idx_events_object ON events (object_id, object_type);

CREATE TABLE IF NOT EXISTS sessions
(
    session_id TEXT PRIMARY KEY,
    operation  TEXT NOT NULL,
    status     TEXT          DEFAULT 'running',
    started_at TEXT NOT NULL DEFAULT (datetime('now', 'localtime')),
    ended_at   TEXT
);

PRAGMA user_version = 0;