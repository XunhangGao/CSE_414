.mode csv
PRAGMA foreign_keys=ON;

.import carriers.csv CARRIERS
.import months.csv MONTHS
.import weekdays.csv WEEKDAYS
.import flights-small.csv FLIGHTS