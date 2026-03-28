local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s(
    "pgcreate",
    t({
      "CREATE TABLE",
      "    ${1:IF NOT EXISTS} ${2:table_name} (",
      "        id serial PRIMARY KEY,",
      "        bool_value boolean,",
      "        char_value char(10),",
      "        varchar_value varchar(255),",
      "        text_value text,",
      "        smallint_value smallint,",
      "        int_value integer,",
      "        bigint_value bigint,",
      "        numeric_value numeric(10, 2), -- (number of digits, decimal digits)",
      "        real_value real,",
      "        double_value double precision,",
      "        date_value date,",
      "        time_value time,",
      "        interval_value interval,",
      "        uuid_value uuid,",
      "        fkey_name INTEGER REFERENCES reference_table_name(id) NOT NULL -- foreign key",
      "    );",
    })
  ),

  s("pgpkey", t("ALTER TABLE ${1:table_name} ADD PRIMARY KEY (${2:col_1}, ${3:col_2});")),

  s(
    "pgfkey",
    t({
      "ALTER TABLE ${1:table_name}",
      "	ADD CONSTRAINT ${2:constraint_name} FOREIGN KEY (${3:fkey_name}) ",
      "	REFERENCES ${4:referencing_table} (${5:referencing_col}) ",
      "	${6:ON DELETE CASCADE};",
    })
  ),

  s("pgdrop", t("DROP TABLE ${1:IF EXISTS } ${2:table_name} ${3:CASCADE};")),

  s(
    "pginsert",
    t({
      "INSERT INTO",
      "    ${1:table_name} ${2:(col1, col2, ...)} -- not needed when inserting all cols",
      "VALUES",
      "    ${3:(col1_val, col2_val, ...)},",
      "    ${4:(col1_val, col2_val, ...)};",
    })
  ),

  s(
    "pgdelete",
    t({
      "DELETE FROM ${1:table_name}",
      "WHERE ${2:(condition1 AND condition2) OR condition3};",
    })
  ),

  s(
    "pgupdate",
    t({
      "UPDATE ${1:table_name}",
      "	SET",
      "		${2:column1} = ${3:value1},",
      "		${4:column2 = value2 ...} ",
      "	${5:WHERE}",
      "		${6:(condition1 AND condition2) OR condition3};",
    })
  ),

  s(
    "pgupdatecase",
    t({
      "UPDATE ${1:table_name}",
      "SET ${2:column_name} = CASE",
      "  WHEN ${3:condition_1} THEN ${4:value_1}",
      "  WHEN ${4:condition_1} THEN ${5:value_1}",
      "  ${6:...}",
      "  ELSE ${7:default_value}",
      "END",
      "WHERE ${8:(condition1 AND condition2) OR condition3};",
    })
  ),

  s("pgaddcol", t("ALTER TABLE ${1:table_name} ADD COLUMN ${2:col_name} ${3:col_type} ${4:NOT NULL};")),

  s("pgrenamecol", t("ALTER TABLE ${1:table_name} RENAME COLUMN ${2:col_name} TO ${3:new_col_name};")),

  s("pgrenametable", t("ALTER TABLE ${1:table_name} RENAME TO ${3:new_table_name};")),

  s(
    "pgcheck",
    t({
      "ALTER TABLE ${1:table_name}",
      "	ADD CONSTRAINT ${2:constraint_name} CHECK (${3:condition});",
    })
  ),

  s("pgdefault", t("ALTER TABLE ${1:table_name} ALTER COLUMN ${2:col_name} SET DEFAULT ${3:default_val};")),

  s("pgnotnull", t("ALTER TABLE ${1:table_name} ALTER COLUMN ${2:col_name} SET NOT NULL;")),

  s("pgselect", t("SELECT ${1:*} FROM ${2:table_name} ${3:WHERE} ${4:conditions};")),
}
