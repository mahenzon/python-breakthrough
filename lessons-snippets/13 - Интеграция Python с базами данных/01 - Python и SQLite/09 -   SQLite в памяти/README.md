

## Прямая работа с SQLite из Python

В Python встроен модуль `sqlite3` для работы SQLite. Взаимодействие происходит на чистом SQL. Вам нужно вручную выполнять все действия: открывать соединение, создавать курсор, выполнять чистый SQL-запрос.

SQLite работает с файлом, все данные лежат внутри. Ниже пример создания таблицы `users`:

```python
import sqlite3

DB_FILENAME = "blog.db"

sql_create_users_table = """
create table if not exists users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    username VARCHAR(32) UNIQUE NOT NULL,
    email VARCHAR(150) UNIQUE,
    full_name VARCHAR(100) NOT NULL DEFAULT ''
);
"""
```
```python
def create_table_users() -> None:
    conn = sqlite3.connect(DB_FILENAME)
    cur = conn.cursor()
    cur.execute(sql_create_users_table)
    conn.close()
```

Выполняйте запросы через метод `execute`.

Получение результата запроса:

```python
def demo_select() -> None:
    conn = sqlite3.connect(DB_FILENAME)
    cur = conn.cursor()

    cur.execute("SELECT 1;")
    print("fetch one result:", cur.fetchone())

    cur.execute("SELECT 1, 2, 3;")
    print("fetch one result:", cur.fetchone())
    print("fetch one result:", cur.fetchone())  # None

    cur.execute("SELECT 2 + 3;")
    print("fetch sum result:", cur.fetchone())

    conn.close()
```  

В этом примере показан `fetchone()`, который возвращает одну строку результата. Если строк больше нет, следующий вызов уже ничего не вернёт - вы получите `None`. Если нужно получить несколько строк, используйте метод `fetchmany()`, а для получения всех значений пройдите в цикле по курсору, либо обратитесь к методу `fetchall()`.

Для вставки одной записи используйте тот же `execute()`, параметры (значения) передавайте отдельно. Для вставки нескольких строк используйте метод `executemany()`, параметры тоже передавайте отдельно:

```python
def insert_values() -> None:
    users_data = [
        # username, email, full_name
        ("bob", "bob@example.com", "Bob"),
        ("john", "john@example.com", "Johnathan"),
        ("alice", None, ""),
    ]
    conn = sqlite3.connect(DB_FILENAME)
    conn.executemany(
        "INSERT INTO users (username, email, full_name) VALUES (?, ?, ?)",
        users_data,
    )
    conn.commit()
    conn.close()
```

Такой способ подстановки нужен не только для удобства, но и для безопасности. Если подставлять значения в SQL как обычную строку через форматирование (процентное, `.format`, f-строки), то высок риск SQL-инъекции. Так злоумышленник может прокинуть исполняемый SQL-код. Передача значений отдельно позволяет избежать инъекции.

Для удобной работы с полученными данными можно подключить `row_factory`, чтобы обращаться к полям не только по индексам, но и по именам колонок:

```python
def show_values() -> None:
    conn = sqlite3.connect(DB_FILENAME)
    conn.row_factory = sqlite3.Row
    cur = conn.cursor()

    res = cur.execute("SELECT id, username, email, full_name FROM users order by id;")
    for row in res:
        print(row[0], row[1], row[2], row[3])
        print(row["id"], row["username"], row["email"], row["full_name"])

    conn.close()
```

Такой формат делает чтение результата более удобным. Если порядок колонок изменится, доступ по имени останется понятным и предсказуемым.
