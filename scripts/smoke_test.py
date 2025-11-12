from pathlib import Path
import duckdb

db = Path("db/warehouse.duckdb"); db.parent.mkdir(exist_ok=True)
con = duckdb.connect(str(db))

con.execute("CREATE TABLE IF NOT EXISTS hello(x INT);")
con.execute("DELETE FROM hello; INSERT INTO hello VALUES (1),(2),(3);")
print(con.execute("SELECT COUNT(*) FROM hello;").fetchall())
print("OK DB at:", db.resolve())

