#please work
from pathlib import Path
import duckdb

DB = Path("db/warehouse.duckdb"); DB.parent.mkdir(exist_ok=True)
OUT = Path("outputs"); OUT.mkdir(exist_ok=True)
con = duckdb.connect(DB.as_posix())

# build & load
con.execute(Path("sql/create_tables.sql").read_text())
con.execute("DELETE FROM drivers; DELETE FROM riders; DELETE FROM trips; DELETE FROM payments;")
con.execute(Path("sql/load_data.sql").read_text())

# run KPI and save
df = con.execute(Path("sql/kpi_daily_trips.sql").read_text()).fetchdf()
df.to_csv(OUT / "kpi_daily_trips.csv", index=False)
print("Saved outputs/kpi_daily_trips.csv with", len(df), "rows")
