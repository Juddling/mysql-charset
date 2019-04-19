## MySQL Charset Covertor

Quick bash script to change the charset of a MySQL database.

It will ask you for the database password on execution.

It will output the SQL necessary for you to covert your database.

## Usage

Edit the variables at the top of the script, (database name, host...)

Then run:

```
./mysql-charset.sh
```

## Example output:

```sql
SET foreign_key_checks = 0;

# remove this
Enter password:

# remove this
ALTER TABLE table CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

ALTER TABLE db.example_table CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE db.example_table2 CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE db.example_table3 CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

SET foreign_key_checks = 1;
```

Note: make sure to remove: "Enter password:" and the first ALTER TABLE line from the output.

