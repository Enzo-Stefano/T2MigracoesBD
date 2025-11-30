CREATE TABLE IF NOT EXISTS teste4 (
  version text PRIMARY KEY,
  name text NOT NULL,
  applied_at timestamptz NOT NULL DEFAULT now()
);