## Добавление вычислений к запросам ## 

Используя функцию `COUNT()`, можно произвести подсчет LastName и использовать псевдоним NameCount для возврата значения.
Добавим функцию к базовому оператору `SELECT`:

```sqlite
SELECT COUNT(LastName) AS [NameCount]
FROM customers
WHERE LastName LIKE 'B%'
```

## Типы функций в SQL ##

Функции в SQL — это специальные ключевые слова, которые принимают определенные параметры, выполняют определенные
операции (например, вычисление или изменение данных в поле) и возвращают результат в виде значения.

Наиболее распространенные и полезные.

**Строковые функции изменяют символьные и текстовые данные**

| Функция                                                                      | Возвращает тип          | Описание                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     | Пример                                           | Результат                                                                                                                                                     |
|------------------------------------------------------------------------------|-------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------|
| строка                                                                       || строка                  | text                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         | Соединение строк (конкатенация)                  | 'Post' || 'greSQL'                            | PostgreSQL |
| строка                                                                       || не-строка или не-строка || строка                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       | text           | Соединение (конкатенация) с одним нестроковым параметром                                                                                                                                 | 'Value: ' || 42                               | Value: 42  |
| `bit_length(строка)`                                                         | int                     | Количество бит в строке                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      | bit_length('jose')                               | 32                                                                                                                                                            |
| `char_length(string)` or `character_length(string)`                          | int                     | Количество символов в строке                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 | char_length('jose')                              | 4                                                                                                                                                             |
| `lower(string)`                                                              | text                    | Преобразует строку в нижний регистр                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          | lower('TOM')                                     | tom                                                                                                                                                           |
| `octet_length(string)`                                                       | int                     | Количество байт в строке                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     | octet_length('jose')                             | 4                                                                                                                                                             |
| `overlay(string placing string from int [for int])`                          | text                    | Заменяет подстроку                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           | overlay('Txxxxas' placing 'hom' from 2 for 4)    | Thomas                                                                                                                                                        |
| `position(substring in string)`                                              | int                     | Позиция заданной подстроки в заданной строке                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 | position('om' in 'Thomas')                       | 3                                                                                                                                                             |
| `substring(string [from int] [for int])`                                     | text                    | Извлекает подстроку из заданной строки                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       | substring('Thomas' from 2 for 3)                 | hom                                                                                                                                                           |
| `substring(string from _pattern_)`                                           | text                    | Извлекает подстроку, совпадающую с регулярным выражением (шаблоном) POSIX. Подробности о совпадении шаблонов см. в [Section 9.7](https://postgresql.men/manual/functions-matching.html).                                                                                                                                                                                                                                                                                                                                                                                                     | substring('Thomas' from '...$')                  | mas                                                                                                                                                           |
| `substring(string from _pattern_ for _escape_)`                              | text                    | Извлекает подстроку, совпадающую с регулярным выражением (шаблоном) SQL. Подробности о совпадении шаблонов см. в [Section 9.7](https://postgresql.men/manual/functions-matching.html).                                                                                                                                                                                                                                                                                                                                                                                                       | substring('Thomas' from '%#"o_a#"_' for '#')     | oma                                                                                                                                                           |
| `trim([leading                                                               | trailing                | both] [символы] from string)`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                | text                                             | Удаляет наиболее длинную подстроку, содержащую только заданные символы (по умолчанию пробелы) из start/end/both (начала/конца/с обеих сторон) заданной строки | trim(both 'x' from 'xTomxx')                  | Tom        |
| `upper(string)`                                                              | text                    | Преобразует строку в вверхний регистр                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        | upper('tom')                                     | TOM                                                                                                                                                           |
| `ascii(string)`                                                              | int                     | ASCII код первого символа заданной строки. Для UTF8 возвращает код Unicode данного символа. Для других многобайтовых кодировок, аргумент должен быть ASCII символом.                                                                                                                                                                                                                                                                                                                                                                                                                         | ascii('x')                                       | 120                                                                                                                                                           |
| `btrim(string text [, characters text])`                                     | text                    | Удаляет наиболее длинную подстроку, содержащую только заданные символы (по умолчанию, пробел) из начала и конца заданной строки                                                                                                                                                                                                                                                                                                                                                                                                                                                              | btrim('xyxtrimyyx', 'xy')                        | trim                                                                                                                                                          |
| `chr(int)`                                                                   | text                    | Символ с указанным кодом. Для UTF8 аргумент трактуется как код Unicode. Для других многобайтовых кодировок аргумент должен соответствовать какому-либо ASCII символу. Символ NULL (0) не разрешается, потому что текстовые типы данных не могут хранить такие символы.                                                                                                                                                                                                                                                                                                                       | chr(65)                                          | A                                                                                                                                                             |
| `concat(str "any" [, str "any" [, ...] ])`                                   | text                    | Concatenate all arguments. NULL arguments are ignored.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       | concat('abcde', 2, NULL, 22)                     | abcde222                                                                                                                                                      |
| `concat_ws(sep text, str "any" [, str "any" [, ...] ])`                      | text                    | Concatenate all but first arguments with separators. The first parameter is used as a separator. NULL arguments are ignored.                                                                                                                                                                                                                                                                                                                                                                                                                                                                 | concat_ws(',', 'abcde', 2, NULL, 22)             | abcde,2,22                                                                                                                                                    |
| `convert(string bytea, src_encoding name, dest_encoding name)`               | bytea                   | Преобразует строку в кодировку, заданную аргументом dest_encoding. Исходная кодировка задаётся аргументом src_encoding. Аргумент строка должен быть в исходной кодировке. Преобразование может быть задано с помощью CREATE CONVERSION. Также есть несколько предварительно определённых преобразований. См. доступные преобразования в [Table 9-7](https://postgresql.men/manual/functions-string.html#CONVERSION-NAMES).                                                                                                                                                                   | convert('text_in_utf8', 'UTF8', 'LATIN1')        | text_in_utf8, представленный в кодировке Latin-1 (ISO 8859-1)                                                                                                 |
| `convert_from(string bytea, src_encoding name)`                              | text                    | Преобразует строку в кодировку СУБД. Исходная кодировка задаётся аргументом src_encoding. Заданная строка должна быть и исходной кодировке.                                                                                                                                                                                                                                                                                                                                                                                                                                                  | convert_from('text_in_utf8', 'UTF8')             | text_in_utf8, представленный в текущей кодировке СУБД                                                                                                         |
| `convert_to(string text, dest_encoding name)`                                | bytea                   | Преобразует строку в кодировку dest_encoding.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                | convert_to('some text', 'UTF8')                  | some text, представленный в кодировке UTF8                                                                                                                    |
| `decode(string text, format text)`                                           | bytea                   | Декодирует бинарные данных из текстового представления в string. Опции для format такие же как в `encode`.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | decode('MTIzAAE=', 'base64')                     | \\x3132330001                                                                                                                                                 |
| `encode(data bytea, format text)`                                            | text                    | Кодирует бинарные данные в текстовое представление. Поддерживаются такие форматы как: base64, hex, escape. Escape просто выводит нулевые байты типа \\000 и двойную обратную косую черту.                                                                                                                                                                                                                                                                                                                                                                                                    | encode(E'123\\\\000\\\\001', 'base64')           | MTIzAAE=                                                                                                                                                      |
| `format`(formatstr text [, str "any" [, ...] ])                              | text                    | Format a string. This function is similar to the C function `sprintf`; but only the following conversion specifications are recognized: %s interpolates the corresponding argument as a string; %I escapes its argument as an SQL identifier; %L escapes its argument as an SQL literal; %% outputs a literal %. A conversion can reference an explicit parameter position by preceding the conversion specifier with _n_$, where _n_ is the argument position. See also [Example 39-1](https://postgresql.men/manual/plpgsql-statements.html#PLPGSQL-QUOTE-LITERAL-EXAMPLE).                | format('Hello %s, %1$s', 'World')                | Hello World, World                                                                                                                                            |
| `initcap(string)`                                                            | text                    | Преобразует первую букву каждого слова в верхний регистр и остаток слова в нижний. Слова являются алфавитно-цифровыми последовательностями, разделенными не алфавитно-цифровыми символами.                                                                                                                                                                                                                                                                                                                                                                                                   | initcap('hi THOMAS')                             | Hi Thomas                                                                                                                                                     |
| `left(str text, n int)`                                                      | text                    | Return first _n_ characters in the string. When _n_ is negative, return all but last                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         | _n_                                              | characters.                                                                                                                                                   | left('abcde', 2)                                 | ab                                                            |
| `length(string)`                                                             | int                     | Количество символов в заданной строке                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        | length('jose')                                   | 4                                                                                                                                                             |
| `length(stringbytea, encoding name )`                                        | int                     | Количество символов в заданной строке в указанной кодировке. Заданная строка должна быть в указанной кодировке.                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | length('jose', 'UTF8')                           | 4                                                                                                                                                             |
| `lpad(string text, длина int [, fill text])`                                 | text                    | Заполняет заданную строку до указанной длины символами, заданными параметром fill (по умолчанию, пробел). Если строка уже длиннее, чем длина, то она усекается (справа).                                                                                                                                                                                                                                                                                                                                                                                                                     | lpad('hi', 5, 'xy')                              | xyxhi                                                                                                                                                         |
| `ltrim(string text [, characters text])`                                     | text                    | Удаляет наиболее длинную подстроку, содержащую только заданные символы (по умолчанию, пробел) из начала заданной строки                                                                                                                                                                                                                                                                                                                                                                                                                                                                      | ltrim('zzzytrim', 'xyz')                         | trim                                                                                                                                                          |
| `md5(string)`                                                                | text                    | Вычисляет MD5 хэш заданной строки, возвращая резульат в шестнадцетеричном виде                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               | md5('abc')                                       | 900150983cd24fb0 d6963f7d28e17f72                                                                                                                             |
| `pg_client_encoding()`                                                       | name                    | Текущая кодировка клиента                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    | pg_client_encoding()                             | SQL_ASCII                                                                                                                                                     |
| `quote_ident(string text)`                                                   | text                    | Возвращает заданную строку, заключённую в кавычки должным образом так, чтобы её было можно использовать как идентификатор в операторах SQL, работающих со строками. Кавычки добавляются только если они необходимы (например, если строка содержит символы недопустимые в идентификаторах без кавычек или регистро-зависмые символы). Кавычки внутри строки соответственно дублируются. См. также [Example 39-1](https://postgresql.men/manual/plpgsql-statements.html#PLPGSQL-QUOTE-LITERAL-EXAMPLE).                                                                                       | quote_ident('Foo bar')                           | "Foo bar"                                                                                                                                                     |
| `quote_literal(string text)`                                                 | text                    | Возвращает заданную строку, заключённую в кавычки должным образом так, чтобы тобы её было можно использовать как строковый литерал в операторах SQL, работающих со строками. Одиночные кавычки и символы обратная косая черта внутри строки соответствующим образом дублируются. Обратите внимание, что функция `quote_literal` возвращает NULL при указании NULL в качестве параметра; если аргумент может быть NULL, часто более подходящей будет функция `quote_nullable`. См. также [Example 39-1](https://postgresql.men/manual/plpgsql-statements.html#PLPGSQL-QUOTE-LITERAL-EXAMPLE). | quote_literal(E'O\\'Reilly')                     | 'O''Reilly'                                                                                                                                                   |
| `quote_literal(value anyelement)`                                            | text                    | Принудительно приводит заданное значение к текстовому типу и затем заключает его в кавычки как литерал. Одиночные кавычки и символы обратная косая черта внутри строки соответственно дублируются.                                                                                                                                                                                                                                                                                                                                                                                           | quote_literal(42.5)                              | '42.5'                                                                                                                                                        |
| `quote_nullable(string text)`                                                | text                    | Возвращает заданную строку, заключённую в кавычки должным образом так, чтобы тобы её было можно использовать как строковый литерал в операторах SQL, работающих со строками; или если аргумент является NULL, возвращает return NULL. Одиночные кавычки и символы обратная косая черта внутри строки соответственно дублируются. См. также [Example 39-1](https://postgresql.men/manual/plpgsql-statements.html#PLPGSQL-QUOTE-LITERAL-EXAMPLE).                                                                                                                                              | quote_nullable(NULL)                             | NULL                                                                                                                                                          |
| `quote_nullable(value anyelement)`                                           | text                    | Принудительно приводит указанное значение к текстовому типу и заключает его в кавычки как литерал; или если аргумент это NULL, возвращает NULL. Одиночные кавычки и символы обратная косая черта внутри строки соответственно дублируются.                                                                                                                                                                                                                                                                                                                                                   | quote_nullable(42.5)                             | '42.5'                                                                                                                                                        |
| `regexp_matches(string text, pattern text [, flags text])`                   | setof text[]            | Возвращает все подстроки, полученные в результате совпадения заданной строки с регулярным выражением (шаблоном) POSIX Подробности см. в [Section 9.7.3](https://postgresql.men/manual/functions-matching.html#FUNCTIONS-POSIX-REGEXP).                                                                                                                                                                                                                                                                                                                                                       | regexp_matches('foobarbequebaz', '(bar)(beque)') | {bar,beque}                                                                                                                                                   |
| `regexp_replace(string text, pattern text, replacement text [, flags text])` | text                    | Заменяет подстроки, совпавшие с регулярным выражением (шаблоном) POSIX в заданной строке. Подробности см. в [Section 9.7.3](https://postgresql.men/manual/functions-matching.html#FUNCTIONS-POSIX-REGEXP).                                                                                                                                                                                                                                                                                                                                                                                   | regexp_replace('Thomas', '.[mN]a.', 'M')         | ThM                                                                                                                                                           |
| `regexp_split_to_array(string text, pattern text [, flags text ])`           | text[]                  | Разбивает заданную строку, используя регулярное выражение (шаблон) POSIX как разделитель. Подробности см. в [Section 9.7.3](https://postgresql.men/manual/functions-matching.html#FUNCTIONS-POSIX-REGEXP).                                                                                                                                                                                                                                                                                                                                                                                   | regexp_split_to_array('hello world', E'\\\\s+')  | {hello,world}                                                                                                                                                 |
| `egexp_split_to_table(string text, pattern text [, flags text])`             | setof text              | text	Разбивает заданную строку, используя регулярное выражение (шаблон) POSIX как разделитель. Подробности см. в [Section 9.7.3](https://postgresql.men/manual/functions-matching.html#FUNCTIONS-POSIX-REGEXP).                                                                                                                                                                                                                                                                                                                                                                              | regexp_split_to_table('hello world', E'\\s+')    | hello <br/>world<br/> (2 rows)                                                                                                                                |
| `repeat(string text, number int)`                                            | text                    | Повторяет заданную строку заданное количество раз                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            | repeat('Pg', 4)                                  | PgPgPgPg                                                                                                                                                      |
| `replace(string text, from text, to text)`                                   | text                    | Заменяет все вхождения в заданной строке подстроки from на подстроку to                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      | replace('abcdefabcdef', 'cd', 'XX')              | abXXefabXXef                                                                                                                                                  |
| `reverse(str)`                                                               | text                    | Return reversed string.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      | reverse('abcde')                                 | edcba                                                                                                                                                         |
| `right(str text, n int)`                                                     | text                    | Return last _n_ characters in the string. When _n_ is negative, return all but first                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         | _n_                                              | characters.                                                                                                                                                   | right('abcde', 2)                       | de           |
| `rpad(string text, длина int [, fill text])`                                 | text                    | Заполняет заданную строку на заданную длину, путём добавления символов, заданных в fill (по умолчанию, пробел). Если заданная строка уже длиннее, чем заданная длина, то она будет усечена.                                                                                                                                                                                                                                                                                                                                                                                                  | rpad('hi', 5, 'xy')                              | hixyx                                                                                                                                                         |
| `rtrim(string text [, characters text])`                                     | text                    | Удаляет наиболее длинную подстроку, содержащую заданные символы (по умолчанию, пробел) из конца заданной строки                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | rtrim('trimxxxx', 'x')                           | trim                                                                                                                                                          |
| `split_part(string text, delimiter text, field int)`                         | text                    | Разбивает заданную строку, используя заданный разделитель и возвращает указанное поле (нумерация начинается с единицы)                                                                                                                                                                                                                                                                                                                                                                                                                                                                       | split_part('abc~@~def~@~ghi', '~@~', 2)          | def                                                                                                                                                           |
| `strpos(string, substring)`                                                  | int                     | Положение заданной подстроки (тоже самое, что и функция position(подстрока in строка), но обратите внимание на обратный порядок аргументов)                                                                                                                                                                                                                                                                                                                                                                                                                                                  | strpos('high', 'ig')                             | 2                                                                                                                                                             |
| `substr(string, from [, count])`                                             | text                    | Извлекает подстроку (также как функция substring(строка from from for count))                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                | substr('alphabet', 3, 2)                         | ph                                                                                                                                                            |
| `to_ascii(string text [, encoding text])`                                    | text                    | Преобразует заданную строку в ASCII из другой кодировки (поддерживаются только преобразования из кодировок LATIN1, LATIN2, LATIN9 и WIN1250)                                                                                                                                                                                                                                                                                                                                                                                                                                                 | to_ascii('Karel')                                | Karel                                                                                                                                                         |
| `to_hex(number int or bigint)`                                               | text                    | Преобразует заданное число в его шестнадцетеричный эквивалент                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                | to_hex(2147483647)                               | 7fffffff                                                                                                                                                      |
| `translate(string text, from text, to text)`                                 | text                    | Любой символ из заданной строки, который совпадает с каким-либо символом в наборе символов from, заменяется на соответствующий символ в наборе символов to. Если параметр from длиннее чем to, дополнительные символы в from удаляются.                                                                                                                                                                                                                                                                                                                                                      | translate('12345', '143', 'ax')                  | a2x5                                                                                                                                                          |


Функции в SQL работают подобно функциям в программах для работы с электронными таблицами и в других языках
программирования.

**_ПРИМЕЧАНИЕ_**
_Часть функции в круглых скобках (X) называется аргументом функции. Некоторые функции могут содержать более одного
аргумента._

Практические задания

* Функция UPPER() принимает только один аргумент (X). Сколько аргументов
  принимает функция REPLACE()? (3)
  Пример:

```sqlite
SELECT REPLACE('SQL Tutorial', 'T', 'M');

-- RESULT
-- SQL Mutorial
```

## Управление текстовыми данными с помощью строковых функций ##

Строка — это еще одно название для текстовых данных. Строковые функции позволяют форматировать и изменять текст.

Для символьных данных фиксированной длины (например, почтовых индексов, содержащих буквы) можно использовать другой тип
данных — с фиксированной длиной.

Допустим, нас попросили создать список рассылки по клиентам из США. Для этого необходимо получить имена и адреса
клиентов. Используем оператор `SELECT`

```sqlite
SELECT FirstName,
       LastName,
       Address
FROM customers
WHERE Country = 'USA';
```

Однако возникают некоторые проблемы. Данные адреса разбиты на части. Просто запросить поле адреса недостаточно. Нам
также необходимо выбрать поля City, State и PostalCode. Другая проблема: все эти данные содержатся в отдельных полях.
Если необходимо создать простой список рассылки, где каждая строка представляет собой полное имя и адрес клиента, то для
этой цели полученный шаблон не годится. Для манипулирования текстовыми строками существует несколько отличных
инструментов, так что мы можем получить результат в удобном для нас виде. Рассмотрим первый из этих инструментов —
конкатенацию

### Конкатенация строк ###

Конкатенация — объединение двух или более строк. Для слияния двух полей вместе используется символ ||. Например,
следующий код выполняет объединение полей FirstName и LastName.

```sqlite
SELECT FirstName || LastName
FROM customers
WHERE CustomerId = 1;
```

Оператор конкатенации || просто соединил оба поля вместе без пробелов. Для удобства чтения мы можем последовательно
использовать две конкатенации и заключить пробел в одинарные кавычки. Тогда запрос будет выглядеть следующим образом:

```sqlite
SELECT FirstName,
       LastName,
       FirstName || ' ' || LastName AS [Full Name]
FROM customers
WHERE Country = 'USA';
```

_В других реализациях SQL существует функция CONCAT() или используется символ +. Синтаксис может отличаться в
зависимости от того, какую РСУБД вы используете, но эффект будет одинаковым_

Рассмотрим следующий пример, где для создания в одной строке имени и адреса клиента используется множественная
конкатенация.

```sqlite
SELECT FirstName || ' ' || LastName || ' ' || Address || ', ' || City || ', ' || State || ' ' || PostalCode
           AS [MailingAddress]
FROM customers
WHERE Country = 'USA';
```

_Пробелы между символами || не обязательны. В предыдущем примере, чтобы получить желаемый формат, мы использовали
запятую, а затем пробел. Вы можете добавить любой текст, поместив его в кавычки._

### Обрезка строки ###

Символы в каждой строке нумеруются, начиная с 1. Это важно при работе со строками, так как позволяет указать фрагмент
строки, используя порядковый номер символа.

Мы используем функцию `LENGTH()` в таком поле, как `PostalCode` (таблица `customers`), и видим, что длина каждого кода
может
быть вычислена.

```sqlite
SELECT PostalCode,
       length(PostalCode) AS [Posatal Code Length]
FROM customers
WHERE Country = 'USA';
```

Анализируя результаты, мы видим, что почтовые индексы различаются размером строк. Минимальная необходимая длина
почтового индекса США — пять цифр. С помощью функции _SUBSTR()_ удалим всю информацию после пятой позиции в строке.

Существует два вида функции` SUBSTR()`: `SUBSTR(X, Y)` и` SUBSTR(X, Y, Z)`.

Если для удаления дополнительных данных из почтовых индексов США мы используем функцию SUBSTR (X, Y, Z), аргумент X
будет соответствовать полю PostalCode, а аргумент Y — начальной позиции строки. В данном случае мы хотим, чтобы первые
пять чисел остались, поэтому выберем 1. Аргумент Z указывает количество символов, которые функция вернет из начальной
позиции, в нашем случае оно равно 5. Если мы выберем только адреса США, а затем добавим функцию SUBSTR (X, Y, Z) с
псевдонимом, мы получим следующее:

```sqlite
SELECT PostalCode,
       substr(PostalCode, 1, 5) AS [Five Digit Postal Code],
       CASE
           WHEN length(substr(PostalCode, 1, 4)) >= '4' THEN substr(PostalCode, 7, 1)
           end                  AS [ZIP + 4 Code]
FROM customers
WHERE Country = 'USA';
```

Мы также можем разделить данные, используя функцию `SUBSTR()`. Обратите внимание, что версия функции `SUBSTR()`,
принимающей
два аргумента, возвращает все символы до конца строки, начиная с позиции Y. Если позиция Y не начинается с 1, мы можем
указать функции, чтобы она возвращала только символы, начиная с позиции Y и далее.

#### Дополнительные строковые функции ####

Функция UPPER(X) возвращает копию входной строки X, в которой все символы ASCII в нижнем регистре переведены в верхний
регистр. Функция LOWER() переводит все символы аргумента в нижний регистр. Рассмотрим пример использования этих функций:

```sqlite
SELECT FirstName                                  as [First name Unmodified],
       UPPER(FirstName)                           as [First Name in UPPERCASE],
       LOWER(FirstName)                           as [First Name in lowercase],
       UPPER(FirstName) || ' ' || UPPER(LastName) AS [Full Name in UPPERCASE]
FROM customers
```

В данном запросе в качестве аргумента функций UPPER() и LOWER() выступает поле FirstName. Также для обозначения
результата мы использовали псевдоним Full Name, чтобы показать, что вы можете объединить два поля после выполнения
функций. Функции UPPER() и LOWER() работают только с символами ASCII. Любые символы, изначально отформатированные в
Юникоде, остаются без изменен.

```markdown
* _Используйте функцию SUBSTR() вместе с функциями UPPER() и LOWER() и создайте список клиентов: фамилия должна быть
  выведена первой и всеми заглавными буквами, а от имени следует оставить только первую букву._
```

```sqlite
SELECT UPPER(FirstName) || ' ' || UPPER(LastName) || ' '
           || Address || ', ' || City || ', ' || State || ' '
           || SUBSTR(PostalCode, 1, 5) AS [MailingAddress]
FROM customers
WHERE Country = 'USA'
```

### Функции даты и времени ###

| Функция                                                                                                                                                                                                                             | Тип результата             | Описание                                                                                                                                                                                                                     | Пример                                                     | Результат                                             |
|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------|-------------------------------------------------------|
| ``` ``age(`timestamp`, `timestamp`)`` ```                                                                                                                                                                                           | `interval`                 | Вычитает аргументы и выдаёт «символический» результат с годами и месяцами, а не просто днями                                                                                                                                 | `age(timestamp '2001-04-10', timestamp '1957-06-13')`      | `43 years 9 mons 27 days (43 года 9 месяцев 27 дней)` |
| ``` ``age(`timestamp`)`` ```                                                                                                                                                                                                        | `interval`                 | Вычитает дату/время из `current_date` (полночь текущего дня)                                                                                                                                                                 | `age(timestamp '1957-06-13')`                              | `43 years 8 mons 3 days (43 года 8 месяцев 3 дня)`    |
| `` `clock_timestamp()` ``                                                                                                                                                                                                           | `timestamp with time zone` | Текущая дата и время (меняется в процессе выполнения операторов); см. [Подраздел 9.9.4](https://postgrespro.ru/docs/postgrespro/10/functions-datetime#FUNCTIONS-DATETIME-CURRENT "9.9.4. Текущая дата/время")                |                                                            |                                                       |
| `` `current_date` ``                                                                                                                                                                                                                | `date`                     | Текущая дата; см. [Подраздел 9.9.4](https://postgrespro.ru/docs/postgrespro/10/functions-datetime#FUNCTIONS-DATETIME-CURRENT "9.9.4. Текущая дата/время")                                                                    |                                                            |                                                       |
| `` `current_time` ``                                                                                                                                                                                                                | `time with time zone`      | Текущее время суток; см. [Подраздел 9.9.4](https://postgrespro.ru/docs/postgrespro/10/functions-datetime#FUNCTIONS-DATETIME-CURRENT "9.9.4. Текущая дата/время")                                                             |                                                            |                                                       |
| `` `current_timestamp` ``                                                                                                                                                                                                           | `timestamp with time zone` | Текущая дата и время (на момент начала транзакции); см. [Подраздел 9.9.4](https://postgrespro.ru/docs/postgrespro/10/functions-datetime#FUNCTIONS-DATETIME-CURRENT "9.9.4. Текущая дата/время")                              |                                                            |                                                       |
| ``` ``date_part(`text`, `timestamp`)`` ```                                                                                                                                                                                          | `double precision`         | Возвращает поле даты (равнозначно `extract`); см. [Подраздел 9.9.1](https://postgrespro.ru/docs/postgrespro/10/functions-datetime#FUNCTIONS-DATETIME-EXTRACT "9.9.1. EXTRACT, date_part")                                    | `date_part('hour', timestamp '2001-02-16 20:38:40')`       | `20`                                                  |
| ``` ``date_part(`text`, `interval`)`` ```                                                                                                                                                                                           | `double precision`         | Возвращает поле даты (равнозначно `extract`); см. [Подраздел 9.9.1](https://postgrespro.ru/docs/postgrespro/10/functions-datetime#FUNCTIONS-DATETIME-EXTRACT "9.9.1. EXTRACT, date_part")                                    | `date_part('month', interval '2 years 3 months')`          | `3`                                                   |
| ``` ``date_trunc(`text`, `timestamp`)`` ```                                                                                                                                                                                         | `timestamp`                | Отсекает компоненты даты до заданной точности; см. также [Подраздел 9.9.2](https://postgrespro.ru/docs/postgrespro/10/functions-datetime#FUNCTIONS-DATETIME-TRUNC "9.9.2. date_trunc")                                       | `date_trunc('hour', timestamp '2001-02-16 20:38:40')`      | `2001-02-16 20:00:00`                                 |
| ``` ``date_trunc(`text`, `interval`)`` ```                                                                                                                                                                                          | `interval`                 | Отсекает компоненты даты до заданной точности; см. также [Подраздел 9.9.2](https://postgrespro.ru/docs/postgrespro/10/functions-datetime#FUNCTIONS-DATETIME-TRUNC "9.9.2. date_trunc")                                       | `date_trunc('hour', interval '2 days 3 hours 40 minutes')` | `2 days 03:00:00`                                     |
| `` `extract`(_`field`_ from `timestamp`) ``                                                                                                                                                                                         | `double precision`         | Возвращает поле даты; см. [Подраздел 9.9.1](https://postgrespro.ru/docs/postgrespro/10/functions-datetime#FUNCTIONS-DATETIME-EXTRACT "9.9.1. EXTRACT, date_part")                                                            | `extract(hour from timestamp '2001-02-16 20:38:40')`       | `20`                                                  |
| `` `extract`(_`field`_ from `interval`) ``                                                                                                                                                                                          | `double precision`         | Возвращает поле даты; см. [Подраздел 9.9.1](https://postgrespro.ru/docs/postgrespro/10/functions-datetime#FUNCTIONS-DATETIME-EXTRACT "9.9.1. EXTRACT, date_part")                                                            | `extract(month from interval '2 years 3 months')`          | `3`                                                   |
| ``` ``isfinite(`date`)`` ```                                                                                                                                                                                                        | `boolean`                  | Проверяет конечность даты (её отличие от +/-бесконечности)                                                                                                                                                                   | `isfinite(date '2001-02-16')`                              | `true`                                                |
| ``` ``isfinite(`timestamp`)`` ```                                                                                                                                                                                                   | `boolean`                  | Проверяет конечность времени (его отличие от +/-бесконечности)                                                                                                                                                               | `isfinite(timestamp '2001-02-16 21:28:30')`                | `true`                                                |
| ``` ``isfinite(`interval`)`` ```                                                                                                                                                                                                    | `boolean`                  | Проверяет конечность интервала                                                                                                                                                                                               | `isfinite(interval '4 hours')`                             | `true`                                                |
| ``` ``justify_days(`interval`)`` ```                                                                                                                                                                                                | `interval`                 | Преобразует интервал так, что каждый 30-дневный период считается одним месяцем                                                                                                                                               | `justify_days(interval '35 days')`                         | `1 mon 5 days (1 месяц 5 дней)`                       |
| ``` ``justify_hours(`interval`)`` ```                                                                                                                                                                                               | `interval`                 | Преобразует интервал так, что каждый 24-часовой период считается одним днём                                                                                                                                                  | `justify_hours(interval '27 hours')`                       | `1 day 03:00:00 (1 день 03:00:00)`                    |
| ``` ``justify_interval(`interval`)`` ```                                                                                                                                                                                            | `interval`                 | Преобразует интервал с применением `justify_days` и `justify_hours` и дополнительно корректирует знаки                                                                                                                       | `justify_interval(interval '1 mon -1 hour')`               | `29 days 23:00:00 (29 дней 23:00:00)`                 |
| `` `localtime` ``                                                                                                                                                                                                                   | `time`                     | Текущее время суток; см. [Подраздел 9.9.4](https://postgrespro.ru/docs/postgrespro/10/functions-datetime#FUNCTIONS-DATETIME-CURRENT "9.9.4. Текущая дата/время")                                                             |                                                            |                                                       |
| `` `localtimestamp` ``                                                                                                                                                                                                              | `timestamp`                | Текущая дата и время (на момент начала транзакции); см. [Подраздел 9.9.4](https://postgrespro.ru/docs/postgrespro/10/functions-datetime#FUNCTIONS-DATETIME-CURRENT "9.9.4. Текущая дата/время")                              |                                                            |                                                       |
| ``` ``make_date(_`year`_ `int`, _`month`_ `int`, _`day`_ `int`)`` ```                                                                                                                                                               | `date`                     | Образует дату из полей: year (год), month (месяц) и day (день)                                                                                                                                                               | `make_date(2013, 7, 15)`                                   | `2013-07-15`                                          |
| ``` ``make_interval(_`years`_ `int` DEFAULT 0, _`months`_ `int` DEFAULT 0, _`weeks`_ `int` DEFAULT 0, _`days`_ `int` DEFAULT 0, _`hours`_ `int` DEFAULT 0, _`mins`_ `int` DEFAULT 0, _`secs`_ `double precision` DEFAULT 0.0)`` ``` | `interval`                 | Образует интервал из полей: years (годы), months (месяцы), weeks (недели), days (дни), hours (часы), minutes (минуты) и secs (секунды)                                                                                       | `make_interval(days => 10)`                                | `10 days`                                             |
| ``` ``make_time(_`hour`_ `int`, _`min`_ `int`, _`sec`_ `double precision`)`` ```                                                                                                                                                    | `time`                     | Образует время из полей: hour (час), minute (минута) и sec (секунда)                                                                                                                                                         | `make_time(8, 15, 23.5)`                                   | `08:15:23.5`                                          |
| ``` ``make_timestamp(_`year`_ `int`, _`month`_ `int`, _`day`_ `int`, _`hour`_ `int`, _`min`_ `int`, _`sec`_ `double precision`)`` ```                                                                                               | `timestamp`                | Образует дату и время из полей: year (год), month (месяц), day (день), hour (час), minute (минута) и sec (секунда)                                                                                                           | `make_timestamp(2013, 7, 15, 8, 15, 23.5)`                 | `2013-07-15 08:15:23.5`                               |
| ``` ``make_timestamptz(_`year`_ `int`, _`month`_ `int`, _`day`_ `int`, _`hour`_ `int`, _`min`_ `int`, _`sec`_ `double precision`, [_`timezone`_ `text`])`` ```                                                                      | `timestamp with time zone` | Образует дату и время с часовым поясом из полей: year (год), month (месяц), day (день), hour (час), minute (минута) и sec (секунда). Если параметр _`timezone`_ (часовой пояс) не указан, используется текущий часовой пояс. | `make_timestamptz(2013, 7, 15, 8, 15, 23.5)`               | `2013-07-15 08:15:23.5+01`                            |
| `` `now()` ``                                                                                                                                                                                                                       | `timestamp with time zone` | Текущая дата и время (на момент начала транзакции); см. [Подраздел 9.9.4](https://postgrespro.ru/docs/postgrespro/10/functions-datetime#FUNCTIONS-DATETIME-CURRENT "9.9.4. Текущая дата/время")                              |                                                            |                                                       |
| `` `statement_timestamp()` ``                                                                                                                                                                                                       | `timestamp with time zone` | Текущая дата и время (на момент начала текущего оператора); см. [Подраздел 9.9.4](https://postgrespro.ru/docs/postgrespro/10/functions-datetime#FUNCTIONS-DATETIME-CURRENT "9.9.4. Текущая дата/время")                      |                                                            |                                                       |
| `` `timeofday()` ``                                                                                                                                                                                                                 | `text`                     | Текущая дата и время (как `clock_timestamp`, но в виде строки типа `text`); см. [Подраздел 9.9.4](https://postgrespro.ru/docs/postgrespro/10/functions-datetime#FUNCTIONS-DATETIME-CURRENT "9.9.4. Текущая дата/время")      |                                                            |                                                       |
| `` `transaction_timestamp()` ``                                                                                                                                                                                                     | `timestamp with time zone` | Текущая дата и время (на момент начала транзакции); см. [Подраздел 9.9.4](https://postgrespro.ru/docs/postgrespro/10/functions-datetime#FUNCTIONS-DATETIME-CURRENT "9.9.4. Текущая дата/время")                              |                                                            |                                                       |
| ``` ``to_timestamp(`double precision`)`` ```                                                                                                                                                                                        | `timestamp with time zone` | Преобразует время эпохи Unix (число секунд с 1970-01-01 00:00:00+00) в стандартное время                                                                                                                                     | `to_timestamp(1284352323)`                                 | `2010-09-13 04:32:03+00`                              |


Функции даты и времени позволяют управлять данными, хранящимися в различных форматах даты и времени. В базе данных
sTunes информация о дате хранится в формате `DATETIME: YYYY-MM-DD HH:MM:SS.` Хотя формат позволяет вводить временной
код, он не используется в нашей базе данных — все временные коды пусты и отображают 00:00:00. Поэтому, чтобы убрать
временной код и оставить только информацию о дате, мы использовали функцию `DATE()`.

Поскольку в разных базах данных информация о дате может храниться по-разному, важно знать, как преобразовать один формат
в другой. С датами мы можем сделать гораздо больше, чем просто изменить их формат. Например, чтобы вычислить возраст
сотрудников, мы можем посчитать разницу между любой заданной и текущей датой, поскольку в таблице `employees` имеется
поле `BirthDate` (Дата рождения).

Чтобы рассчитать возраст сотрудников, рассмотрим функцию `STRFTIME()`, также известную
как функция времени в строковом формате. Она позволяет отформатировать информацию о времени и дате в виде текстовой
строки. Для корректной работы функции `STRFTIME()` требуется как минимум информация двух видов.
Необходимо указать желаемый формат (его называют спецификацией преобразования) и строку времени для форматирования.
Строку времени можно ввести вручную или использовать поле `DATETIME`. В качестве аргумента строка времени также может
использовать функцию `NOW`. Третий аргумент, модификатор, необязательный и может применяться для дискретного сдвига даты
вперед или назад и выполнения некоторых других функций.

Функцию `NOW` иногда называют недетерминированной функцией. Это означает, что результирующие данные, возвращаемые этой
функцией, будут разными при каждом ее вызове, поскольку дата и/или время будут разными при каждом вызове. Функция
`STRFTIME()` и большинство других функций, описанных в этой книге, — детерминированные. То есть они дают один и тот же
результат каждый раз, когда используются с одними и теми же аргументами. Функцию `NOW` необходимо постоянно обновлять,
чтобы она оставалась точной, и результат соответствовал времени вашего компьютера.

Функция `STRFTIME()` способна выполнять различные преобразования времени и дат. Если вы пока не совсем понимаете
значения
всех аргументов и выполняемых преобразований, не беспокойтесь. Главное то, что функция `STRFTIME()` принимает данные в
формате времени и даты и использует ключевые слова для возврата определенных пользователем фрагментов даты.

### АРГУМЕНТЫ ФУНКЦИИ STRFTIME ###

Операторы даты/времени

| Оператор | Пример                                                        | Результат                         |
|----------|---------------------------------------------------------------|-----------------------------------|
| `+`      | `date '2001-09-28' + integer '7'`                             | `date '2001-10-05'`               |
| `+`      | `date '2001-09-28' + interval '1 hour'`                       | `timestamp '2001-09-28 01:00:00'` |
| `+`      | `date '2001-09-28' + time '03:00'`                            | `timestamp '2001-09-28 03:00:00'` |
| `+`      | `interval '1 day' + interval '1 hour'`                        | `interval '1 day 01:00:00'`       |
| `+`      | `timestamp '2001-09-28 01:00' + interval '23 hours'`          | `timestamp '2001-09-29 00:00:00'` |
| `+`      | `time '01:00' + interval '3 hours'`                           | `time '04:00:00'`                 |
| `-`      | `- interval '23 hours'`                                       | `interval '-23:00:00'`            |
| `-`      | `date '2001-10-01' - date '2001-09-28'`                       | `integer '3'` (дня)               |
| `-`      | `date '2001-10-01' - integer '7'`                             | `date '2001-09-24'`               |
| `-`      | `date '2001-09-28' - interval '1 hour'`                       | `timestamp '2001-09-27 23:00:00'` |
| `-`      | `time '05:00' - time '03:00'`                                 | `interval '02:00:00'`             |
| `-`      | `time '05:00' - interval '2 hours'`                           | `time '03:00:00'`                 |
| `-`      | `timestamp '2001-09-28 23:00' - interval '23 hours'`          | `timestamp '2001-09-28 00:00:00'` |
| `-`      | `interval '1 day' - interval '1 hour'`                        | `interval '1 day -01:00:00'`      |
| `-`      | `timestamp '2001-09-29 03:00' - timestamp '2001-09-27 12:00'` | `interval '1 day 15:00:00'`       |
| `*`      | `900 * interval '1 second'`                                   | `interval '00:15:00'`             |
| `*`      | `21 * interval '1 day'`                                       | `interval '21 days'`              |
| `*`      | `double precision '3.5' * interval '1 hour'`                  | `interval '03:30:00'`             |
| `/`      | `interval '1 hour' / double precision '1.5'`                  | `interval '00:40:00'`             |




Можно использовать любые символы внутри одинарных кавычек при условии, что всю строку заключаем в кавычки

```sqlite
SELECT STRFTIME('TheYear is: %Y The Day is: %d The Month is %m', '2011-05-22') AS [Text with Conversion Specifications];
```

Спецификация в функции преобразования всегда начинается с символа `%`, за которым следует чувствительный к регистру
буквенный символ. Использование, например, `%M` (верхний регистр) вместо `%m` даст нам минуты вместо месяцев

Давайте рассмотрим работу функции `STRFTIME()` на примере вычисления возраста сотрудников. Первое, что необходимо
сделать, это указать необходимый формат. Поскольку `BirthDate` (Дата рождения) имеет тип данных `DATETIME`, а время в
нашей базе данных не указано, для простоты опустим временные коды.
Чтобы узнать возраст сотрудников, вычислим разницу во времени между датой рождения каждого сотрудника и текущей датой.
Текущую дату можно получить, используя функцию `NOW`

```sqlite
SELECT LastName,
       FirstName,
       STRFTIME('%Y-%m-%d', BirthDate)                               AS [Birthday No Timecode],
       STRFTIME('%Y-%m-%d', 'now') - STRFTIME('%Y-%m-%d', BirthDate) AS [Age]
FROM employees
ORDER BY Age
```

Мы можем использовать функцию `STRFTIME()` так же, как мы использовали функцию `DATE()` для удаления временных кодов.
Затем, чтобы узнать возраст сотрудников, необходимо получить разницу между двумя функциями strftime.

```markdown
* Компания sTunes отмечает дни рождения сотрудников первого числа каждого месяца. Создайте для отдела кадров таблицу,
  отображающую имена сотрудников, дни рождения и день празднования.

* Отдел кадров компании sTunes сообщил нам, что возраст сотрудников — это тема весьма деликатная. Перепишите этот
  запрос, чтобы в результате получить количество лет работы каждого сотрудника в компании.

* Какой сотрудник проработал в компании дольше всех?
```

```sqlite
SELECT LastName,
       FirstName,
       STRFTIME('%Y-%m-%d', 'now') - STRFTIME('%Y-%m-%d', HireDate) AS [Hire Age]
FROM employees
ORDER BY HireDate
```

### Агрегатные функции ###

**Агрегатные функции общего назначения**

| Функция                                        | Типы аргумента                                                                             | Тип результата                                                                                                                              | Частичный режим | Описание                                                                                                                                                                     |
|------------------------------------------------|--------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------|-----------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ``array_agg(_`выражение`_)``                   | любой тип не массива                                                                       | массив элементов с типом аргумента                                                                                                          | Нет             | входные значения, включая NULL, объединяются в массив                                                                                                                        |
| ``array_agg(_`выражение`_)``                   | любой тип массива                                                                          | тот же, что и тип аргумента                                                                                                                 | Нет             | входные массивы собираются в массив большей размерности (они должны иметь одну размерность и не могут быть пустыми или равны NULL)                                           |
| ``avg(_`выражение`_)``                         | `smallint`, `int`, `bigint`, `real`, `double precision`, `numeric` или `interval`          | `numeric` для любых целочисленных аргументов, `double precision` для аргументов с плавающей точкой, в противном случае тип данных аргумента | Да              | арифметическое среднее для всех входных значений, отличных от NULL                                                                                                           |
| ``bit_and(_`выражение`_)``                     | `smallint`, `int`, `bigint` или `bit`                                                      | тот же, что и тип аргумента                                                                                                                 | Да              | побитовое И для всех входных значений, не равных NULL, или NULL, если таких нет                                                                                              |
| ``bit_or(_`выражение`_)``                      | `smallint`, `int`, `bigint` или `bit`                                                      | тот же, что и тип аргумента                                                                                                                 | Да              | побитовое ИЛИ для всех входных значений, не равных NULL, или NULL, если таких нет                                                                                            |
| ``bool_and(_`выражение`_)``                    | `bool`                                                                                     | `bool`                                                                                                                                      | Да              | true, если все входные значения равны true, и false в противном случае                                                                                                       |
| ``bool_or(_`выражение`_)``                     | `bool`                                                                                     | `bool`                                                                                                                                      | Да              | true, если хотя бы одно входное значение равно true, и false в противном случае                                                                                              |
| `count(*)`                                     |                                                                                            | `bigint`                                                                                                                                    | Да              | количество входных строк                                                                                                                                                     |
| ``count(_`выражение`_)``                       | any                                                                                        | `bigint`                                                                                                                                    | Да              | количество входных строк, для которых значение _`выражения`_ не равно NULL                                                                                                   |
| ``every(_`выражение`_)``                       | `bool`                                                                                     | `bool`                                                                                                                                      | Да              | синоним `bool_and`                                                                                                                                                           |
| ``json_agg(_`выражение`_)``                    | `any`                                                                                      | `json`                                                                                                                                      | Нет             | агрегирует значения, включая NULL, в виде массива JSON                                                                                                                       |
| ``jsonb_agg(_`выражение`_)``                   | `any`                                                                                      | `jsonb`                                                                                                                                     | Нет             | агрегирует значения, включая NULL, в виде массива JSON                                                                                                                       |
| ``json_object_agg(_`имя`_, _`значение`_)``     | `(any, any)`                                                                               | `json`                                                                                                                                      | Нет             | агрегирует пары имя/значение в виде объекта JSON (NULL допускается в значениях, но не в именах)                                                                              |
| ``jsonb_object_agg(_`имя`_, _`значение`_)``    | `(any, any)`                                                                               | `jsonb`                                                                                                                                     | Нет             | агрегирует пары имя/значение в виде объекта JSON (NULL допускается в значениях, но не в именах)                                                                              |
| ``max(_`выражение`_)``                         | любой числовой, строковый, сетевой тип или тип даты/времени, либо массив этих типов        | тот же, что и тип аргумента                                                                                                                 | Да              | максимальное значение _`выражения`_ среди всех входных данных, отличных от NULL                                                                                              |
| ``min(_`выражение`_)``                         | любой числовой, строковый, сетевой тип или тип даты/времени, либо массив этих типов        | тот же, что и тип аргумента                                                                                                                 | Да              | минимальное значение _`выражения`_ среди всех входных данных, отличных от NULL                                                                                               |
| ``string_agg(_`выражение`_, _`разделитель`_)`` | (`text`, `text`) или (`bytea`, `bytea`)                                                    | тот же, что и типы аргументов                                                                                                               | Нет             | входные данные (исключая NULL) складываются в строку через заданный разделитель                                                                                              |
| ``sum(_`выражение`_)``                         | `smallint`, `int`, `bigint`, `real`, `double precision`, `numeric`, `interval` или `money` | `bigint` для аргументов `smallint` или `int`, `numeric` для аргументов `bigint`, и тип аргумента в остальных случаях                        | Да              | сумма значений _`выражения`_ по всем входным данным, отличным от NULL                                                                                                        |
| ``xmlagg(_`выражение`_)``                      | `xml`                                                                                      | `xml`                                                                                                                                       | Нет             | соединение XML-значений, отличных от NULL (см. также [Подраздел 9.14.1.7](https://postgrespro.ru/docs/postgrespro/10/functions-xml#FUNCTIONS-XML-XMLAGG "9.14.1.7. xmlagg")) |


**Агрегатные функции для статистических вычислений**

| Функция                          | Тип аргумента                                                         | Тип результата                                                                | Частичный режим | Описание                                                                                                       |
|----------------------------------|-----------------------------------------------------------------------|-------------------------------------------------------------------------------|-----------------|----------------------------------------------------------------------------------------------------------------|
| ``corr(_`Y`_, _`X`_)``           | `double precision`                                                    | `double precision`                                                            | Да              | коэффициент корреляции                                                                                         |
| ``covar_pop(_`Y`_, _`X`_)``      | `double precision`                                                    | `double precision`                                                            | Да              | ковариация совокупности                                                                                        |
| ``covar_samp(_`Y`_, _`X`_)``     | `double precision`                                                    | `double precision`                                                            | Да              | ковариация выборки                                                                                             |
| ``regr_avgx(_`Y`_, _`X`_)``      | `double precision`                                                    | `double precision`                                                            | Да              | среднее независимой переменной (``sum(_`X`_)/_`N`_``)                                                          |
| ``regr_avgy(_`Y`_, _`X`_)``      | `double precision`                                                    | `double precision`                                                            | Да              | среднее зависимой переменной (``sum(_`Y`_)/_`N`_``)                                                            |
| ``regr_count(_`Y`_, _`X`_)``     | `double precision`                                                    | `bigint`                                                                      | Да              | число входных строк, в которых оба выражения не NULL                                                           |
| ``regr_intercept(_`Y`_, _`X`_)`` | `double precision`                                                    | `double precision`                                                            | Да              | пересечение с осью OY линии, полученной методом наименьших квадратов по данным (_`X`_, _`Y`_)                  |
| ``regr_r2(_`Y`_, _`X`_)``        | `double precision`                                                    | `double precision`                                                            | Да              | квадрат коэффициента корреляции                                                                                |
| ``regr_slope(_`Y`_, _`X`_)``     | `double precision`                                                    | `double precision`                                                            | Да              | наклон линии, полученной методом наименьших квадратов по данным (_`X`_, _`Y`_)                                 |
| ``regr_sxx(_`Y`_, _`X`_)``       | `double precision`                                                    | `double precision`                                                            | Да              | ``sum(_`X`_^2) - sum(_`X`_)^2/_`N`_`` («сумма квадратов» независимой переменной)                               |
| ``regr_sxy(_`Y`_, _`X`_)``       | `double precision`                                                    | `double precision`                                                            | Да              | ``sum(_`X`_*_`Y`_) - sum(_`X`_) * sum(_`Y`_)/_`N`_`` («сумма произведений» независимых и зависимых переменных) |
| ``regr_syy(_`Y`_, _`X`_)``       | `double precision`                                                    | `double precision`                                                            | Да              | ``sum(_`Y`_^2) - sum(_`Y`_)^2/_`N`_`` («сумма квадратов» зависимой переменной)                                 |
| ``stddev(_`выражение`_)``        | `smallint`, `int`, `bigint`, `real`, `double precision` или `numeric` | `double precision` для аргументов с плавающей точкой, `numeric` для остальных | Да              | сохранившийся синоним `stddev_samp`                                                                            |
| ``stddev_pop(_`выражение`_)``    | `smallint`, `int`, `bigint`, `real`, `double precision` или `numeric` | `double precision` для аргументов с плавающей точкой, `numeric` для остальных | Да              | стандартное отклонение по генеральной совокупности входных значений                                            |
| ``stddev_samp(_`выражение`_)``   | `smallint`, `int`, `bigint`, `real`, `double precision` или `numeric` | `double precision` для аргументов с плавающей точкой, `numeric` для остальных | Да              | стандартное отклонение по выборке входных значений                                                             |
| `variance`(_`выражение`_)        | `smallint`, `int`, `bigint`, `real`, `double precision` или `numeric` | `double precision` для аргументов с плавающей точкой, `numeric` для остальных | Да              | сохранившийся синоним `var_samp`                                                                               |
| `var_pop`(_`выражение`_)         | `smallint`, `int`, `bigint`, `real`, `double precision` или `numeric` | `double precision` для аргументов с плавающей точкой, `numeric` для остальных | Да              | дисперсия для генеральной совокупности входных значений (квадрат стандартного отклонения)                      |
| `var_samp`(_`выражение`_)        | `smallint`, `int`, `bigint`, `real`, `double precision` или `numeric` | `double precision` для аргументов с плавающей точкой, `numeric` для остальных | Да              | дисперсия по выборке для входных значений (квадрат отклонения по выборке)                                      |

**Сортирующие агрегатные функции**

| Функция                                                                         | Тип непосредственного аргумента | Тип агрегированного аргумента     | Тип результата                     | Частичный режим | Описание                                                                                                                                                                                                        |
|---------------------------------------------------------------------------------|---------------------------------|-----------------------------------|------------------------------------|-----------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ``mode() WITHIN GROUP (ORDER BY _`выражение_сортировки`_)``                     |                                 | любой сортируемый тип             | тот же, что у выражения сортировки | Нет             | возвращает значение, наиболее часто встречающееся во входных данных (если одинаково часто встречаются несколько значений, произвольно выбирается первое из них)                                                 |
| ``percentile_cont(_`дробь`_) WITHIN GROUP (ORDER BY _`выражение_сортировки`_)`` | `double precision`              | `double precision` или `interval` | тот же, что у выражения сортировки | Нет             | непрерывный процентиль: возвращает значение, соответствующее заданной дроби по порядку, интерполируя соседние входные значения, если необходимо                                                                 |
| ``percentile_cont(_`дроби`_) WITHIN GROUP (ORDER BY _`выражение_сортировки`_)`` | `double precision[]`            | `double precision` или `interval` | массив типа выражения сортировки   | Нет             | множественный непрерывный процентиль: возвращает массив результатов, соответствующих форме параметра _`дроби`_ (для каждого элемента не NULL подставляется значение, соответствующее данному процентилю)        |
| ``percentile_disc(_`дробь`_) WITHIN GROUP (ORDER BY _`выражение_сортировки`_)`` | `double precision`              | любой сортируемый тип             | тот же, что у выражения сортировки | Нет             | дискретный процентиль: возвращает первое значение из входных данных, позиция которого по порядку равна или превосходит указанную дробь                                                                          |
| ``percentile_disc(_`дроби`_) WITHIN GROUP (ORDER BY _`выражение_сортировки`_)`` | `double precision[]`            | любой сортируемый тип             | массив типа выражения сортировки   | Нет             | множественный дискретный процентиль: возвращает массив результатов, соответствующих форме параметра _`дроби`_ (для каждого элемента не NULL подставляется входное значение, соответствующее данному процентилю) |

**Гипотезирующие агрегатные функции**

| Функция                                                                             | Тип непосредственного аргумента | Тип агрегированного аргумента | Тип результата     | Частичный режим | Описание                                                     |
|-------------------------------------------------------------------------------------|---------------------------------|-------------------------------|--------------------|-----------------|--------------------------------------------------------------|
| ``rank(_`аргументы`_) WITHIN GROUP (ORDER BY _`сортированные_аргументы`_)``         | `VARIADIC` `"any"`              | `VARIADIC` `"any"`            | `bigint`           | Нет             | ранг гипотетической строки, с пропусками повторяющихся строк |
| ``dense_rank(_`аргументы`_) WITHIN GROUP (ORDER BY _`сортированные_аргументы`_)``   | `VARIADIC` `"any"`              | `VARIADIC` `"any"`            | `bigint`           | Нет             | ранг гипотетической строки, без пропусков                    |
| ``percent_rank(_`аргументы`_) WITHIN GROUP (ORDER BY _`сортированные_аргументы`_)`` | `VARIADIC` `"any"`              | `VARIADIC` `"any"`            | `double precision` | Нет             | относительный ранг гипотетической строки, от 0 до 1          |
| ``cume_dist(_`аргументы`_) WITHIN GROUP (ORDER BY _`сортированные_аргументы`_)``    | `VARIADIC` `"any"`              | `VARIADIC` `"any"`            | `double precision` | Нет             | относительный ранг гипотетической строки, от 1/_`N`_ до 1    |

**Операции группировки**

| Функция                        | Тип результата | Описание                                                                                          |
|--------------------------------|----------------|---------------------------------------------------------------------------------------------------|
| ``GROUPING(_`аргументы...`_)`` | `integer`      | Целочисленная битовая маска, показывающая, какие аргументы не вошли в текущий набор группирования |



Агрегатные функции воздействуют на значения столбца, чтобы получить единое результирующее значение с помощью различных
математических операций. В начале этой главы, чтобы вычислить количество клиентов с фамилией, начинающейся с буквы B, мы
использовали функцию `COUNT()`. Существует множество практических способов использования агрегатных функций. Так,
используем функцию `SUM()` в таблице invoices для вычисления итоговой суммы всех счетов

```sqlite
SELECT SUM(Total) AS [Total Sales]
FROM invoices
```

Существует множество агрегатных функций, но здесь мы рассмотрим пять основных функций в SQL: `SUM()`, `AVG()`, `MIN()`,
`MAX()` и `COUNT()`.

| ФУНКЦИЯ   | ОПИСАНИЕ                                                  |
|-----------|-----------------------------------------------------------|
| `SUM()`   | Возвращает суммарное значение столбца таблицы базы данных |
| `AVG()`   | Возвращает среднее значение для столбца                   |
| `MIN()`   | Возвращает минимальное значение для столбца               |
| `MAX()`   | Возвращает максимальное значение для столбца              |
| `COUNT()` | Возвращает количество записей таблицы базы данны          |

**ПРИМЕР:**

```sqlite
SELECT SUM(Total) AS TotalSales,
       AVG(Total) AS AverageSales,
       MAX(Total) AS MaximumSale,
       MIN(Total) AS MinSale,
       COUNT(*)   AS SalesCount
FROM invoices
```

По умолчанию функция COUNT() возвращает только ненулевые значения. Однако если необходимо подсчитать все записи, даже
записи с ошибками или нулевыми значениями, рекомендуется использовать символ звездочки * или поле первичного ключа.
Символ звездочки * обозначает «вернуть все записи». Поэтому, используя ее с агрегатной функцией COUNT(), мы получим
количество всех записей в таблице invoices.

```markdown
Практические задания

* Сколько счетов содержится в таблице invoices?

* Какова средняя сумма счета?

* Какова сумма самого большого счета в таблице invoices?
```

```sqlite
------------------------------------------------------------------------------------------------------------------------
SELECT COUNT(Total) AS Total
FROM invoices;
------------------------------------------------------------------------------------------------------------------------
SELECT AVG(Total) AS TotalSales
FROM invoices;
------------------------------------------------------------------------------------------------------------------------
SELECT MAX(Total) AS TotalSales
FROM invoices;
------------------------------------------------------------------------------------------------------------------------
```

### Вложенные функции на примере ROUND() ###

Вложенная функция — это та, которая содержится в другой функции. Одна из целей использования вложенных функций —
модифицировать формат внутренней функции. Если мы проанализируем предыдущий пример, в котором мы использовали функцию
`AVG()`, то увидим, что `Average Sales` (средний объем продаж) содержит слишком много десятичных знаков. Такой формат
обычно не используется для денежных единиц. Функция `ROUND()`, хотя и не агрегатная, очень полезна при выполнении
каких-либо математических операций или если требуется привести в порядок результаты. Для этой цели функцию `AVG()` можно
поместить в функцию `ROUND()` (это и есть вложение) и указать количество десятичных знаков, до которого мы хотим
округлить результат.

| ФУНКЦИЯ    | ОПИСАНИЕ                                                                                                                              |
|------------|---------------------------------------------------------------------------------------------------------------------------------------|
| ROUND(X,Y) | Функция ROUND() округляет число X до указанного числа десятичных знаков Y. Если аргумент Y отсутствует, это означает, что он равен 0. |

```sqlite
SELECT AVG(Total)           AS [Average Sales],
       ROUND(AVG(Total), 2) AS [Rounded Average Sales]
FROM invoices;
```

При использовании функции ROUND() с денежными единицами будьте внимательны при округлении и изменении значениях в
промежуточных вычислениях. Обычно округление выполняется только на последнем шаге. Также вы можете добавить комментарии,
чтобы указать, что результаты округляются до двух знаков после запятой.

### Использование агрегатных функций и условия `GROUP BY` ####

Полезной особенностью агрегатных функций считается их способность вычислять промежуточные значения, или агрегаты, для
различных групп данных. Для таблицы `invoices` в базе данных **_sTunes_** мы можем легко получить среднюю сумму счета с
помощью
функции `AVG()`. Предположим, компании _**sTunes**_ необходимо рассчитать среднюю сумму счета для каждого города, где
его выставили.

ВНИМАНИЕ
Следующий запрос написан неправильно, чтобы показать, что происходит при сочетании в операторе **SELECT** агрегатных
функций
с неагрегатными полями. Этот запрос не вызывает ошибок, но он неправильно отображает запрашиваемую информацию.

```sqlite
SELECT BillingCity,
       AVG(Total)
FROM invoices
ORDER BY BillingCity;
```

Нам требовалось получить среднюю сумму счета из таблицы `invoices` для каждого города. Несмотря на то, что мы включили
город в оператор `SELECT`, запрос по-прежнему дает нам только глобальное среднее значение всех счетов. Почему наш запрос
не возвращает среднюю сумму для каждого города из таблицы `invoices`?

Чтобы решить эту задачу, давайте проанализируем запрос. Нам задали вопрос: какова средняя сумма счетов по городам?

Мы уже упоминали, что полезно разбивать запрос на компоненты, а также поразмыслить, какая таблица содержит нужную
информацию и как ее отобразить. Ответ на эти два вопроса поможет вам устранить недочеты, связанные с запросом, который
возвращает некорректную информацию.

В предыдущем (некорректном) запросе мы запросили у браузера SQL два вида информации из таблицы `invoices`. Сначала —
перечислить все города в поле `BillingCity`. Затем — вычислить среднее значение поля `Total`. Результат выполнения
первого
запроса — многострочный ответ, а результат второго — однострочный ответ. Другими словами, мы указываем браузеру
отображать одновременно как агрегатные, так и неагрегатные поля. Мы не получили необходимую информацию, так как
неправильно сформулировали вопрос.

Исправить эту проблему можно, добавив в запрос условие GROUP BY следующим образом:

```sqlite
SELECT BillingCity,
       AVG(Total)
FROM invoices
GROUP BY BillingCity
ORDER BY BillingCity
```

Анализируя выполнение запроса мы видим, что все города, где были выставлены счета, в нашем наборе результатов теперь
появляются один раз и для каждого города отображается среднее значение счета.

```markdown
Практическое задание

* В данный запрос добавьте функцию ROUND(), чтобы округлить средние значения до двух десятичных знаков.
```

```sqlite
SELECT BillingCity,
       AVG(Total),
       round(AVG(Total), 2)
FROM invoices
GROUP BY BillingCity
ORDER BY BillingCity
```

### Использование условий `WHERE` и `HAVING` со сгруппированными запросами ###

Добавление критериев в сгруппированный запрос работает так же, как и с другими, уже знакомыми нам запросами.
Использование условия `WHERE` позволяет нам добавлять новые критерии. В примере ниже критерии добавляются для
неагрегатного поля `BillingCity`.

```sqlite
SELECT BillingCity,
       AVG(Total)
FROM invoices
WHERE BillingCity LIKE 'L%'
GROUP BY BillingCity
ORDER BY BillingCity
```

Неагрегатное поле — это просто поле в условии SELECT, которое вызывается без агрегатной функции.

```markdown
Практическое задание

* Сколько городов, где были выставлены счета, начинаются с буквы L?

(3)
```

В последнем примере мы добавили критерии в неагрегатное поле. Может возникнуть необходимость использовать критерии для
агрегированных полей, например AVG(Total). Скажем, когда нам надо найти все средние значения, меньшие 20. Мы могли бы
попытаться ответить на этот вопрос с помощью условия WHERE, но существует одна проблема.

Следующий оператор SQL содержит ошибку. Но важно видеть, что критерии, созданные в условии WHERE, не работают с
агрегатными данными.

```sqlite
SELECT BillingCity,
       AVG(Total)
FROM Invoices
WHERE AVG(Total) > 5 < - (критерии, созданные в условии WHERE, не работают с агрегатными данными)
GROUP BY BillingCity
ORDER BY BillingCity
```

При выполнении запроса возникнет следующее сообщение об ошибке:

```commandline
Misuse of aggregate: AVG()
```

**(Неправильное использование агрегата: AVG())**

Это сообщение об ошибке информирует нас, что для создания условия на основе агрегатной функции (по крайней мере, в
данном случае) мы не можем использовать условие `WHERE`. В данном случае условие `WHERE` может указывать только, какую
информацию извлекать из полей, указанных в условии `SELECT`. Если необходима дополнительная фильтрация на основе
агрегатных функций, необходимо включить вторичную фильтрацию, известную как условие `HAVING`. Условие `HAVING` всегда
следует после условия `GROUP BY`. Измененный запрос теперь выглядит следующим образом:

```sqlite
SELECT BillingCity,
       AVG(Total)
FROM invoices
GROUP BY BillingCity
HAVING AVG(Total) > 5
ORDER BY BillingCity;
```

Условие `HAVING` позволяет фильтровать результат группировки, сделанной с помощью команды `GROUP BY`. Условие `HAVING`
фильтрует агрегированные данные. Если вы попытаетесь использовать `HAVING` без условия `GROUP BY`, то получите сообщение
об ошибке.

### Условия WHERE и HAVING ###

Если кратко, то разница между условиями `WHERE` и `HAVING` заключается в том, что `WHERE` предназначено для фильтрации
неагрегатных данных, а `HAVING` — для фильтрации результатов, содержащих агрегаты. Если более подробно, то два
типа фильтрации возникают, когда в запрос включены как условие `WHERE`, так и условие `HAVING`.
Условие `WHERE` указывает запросу, какую информацию следует исключить из таблицы, а затем, после фильтрации данных и
применения к полям агрегатных функций, условие `HAVING` действует как дополнительный фильтр для агрегатных данных.
Давайте повторим предыдущий запрос, но на этот раз выберем только города, начинающиеся с буквы `B`, а затем из этого
списка отфильтруем счета, среднее значение которых больше пяти.

```sqlite
SELECT BillingCity,
       AVG(Total)
FROM invoices
WHERE BillingCity LIKE 'B%'
GROUP BY BillingCity
HAVING AVG(Total) > 5
ORDER BY BillingCity
```

В запросе мы выполнили ту же задачу, но на этот раз добавили условие `WHERE` для фильтрации результатов только по
городам, начинающимся с буквы B. Данный этап фильтрации выполняется до обработки условий `HAVING` и `ORDER BY`. Так как
нам необходимо выполнить фильтрацию, прежде чем мы сможем группировать, то порядок условий фильтрации важен, а условие
WHERE всегда предшествует `HAVING`.

### Группировка по нескольким столбцам ###

В условиях GROUP BY можно одновременно указывать столько столбцов, сколько вам требуется. Предположим, необходимо
получить более подробную разбивку средних значений счетов. Мы можем написать запрос так, чтобы агрегированные данные
были сначала сгруппированы по странам, а затем по городам. В приведенном ниже примере мы добавим в условие GROUP BY еще
одно поле, BillingCountry. Давайте посмотрим, как работает запрос.

```sqlite
SELECT BillingCountry,
       BillingCity,
       AVG(Total)
FROM invoices
GROUP BY BillingCountry, BillingCity
ORDER BY BillingCountry
```

И мы видим, что у нас имеется несколько записей для одной страны выставления счета, а отдельные города указаны в
соседнем столбце. Группировка по нескольким столбцам может быть очень полезна, когда необходимо получить более детальную
информацию.

Файлы базы данных могут содержать орфографические и/или ошибки, связанные с регистром

### Несколько заключительных слов о функциях ###

Цель этой главы — познакомить вас с функциями. Мы описали возможности некоторых функций, их способность превращать
данные в информацию и решать практические задачи. Если бы пришлось рассматривать все функции в **SQLite**
и иллюстрировать работу каждой из них, то эту книгу мне никогда не удалось бы закончить. К счастью, в интернете можно
найти массу информации о функциях **SQL** и их использовании. Я всегда рекомендую студентам поискать информацию о
функциях в интернете, чтобы увидеть разные примеры их использования. Надеюсь, что вы продолжите обучение самостоятельно
и узнаете еще больше о том, как использовать эти мощные инструменты.

#### Контрольные вопросы

1. Создайте однострочный список рассылки для всех клиентов из США,
   включая полные имена, написанные заглавными буквами, и полные адреса
   с пятизначными почтовыми индексами, в следующем формате:
   FRANK HARRIS 1600 Amphitheatre Parkway, Mountain View, CA 94043
2. Каковы средние годовые продажи клиентам из США согласно имеющимся
   данным за все годы?
3. Каков общий объем продаж компании за все время?
4. Кто входит в десятку лучших клиентов с точки зрения совершенных ими
   покупок? Подсказка: чтобы ответить на этот вопрос, необходимо использовать соединение (глава 6).

Резюме

- Функции позволяют изменять, форматировать и выполнять вычисления с данными в таблицах.
- Запросы, содержащие числовые данные, можно обрабатывать с помощью различных арифметических операций и агрегатных
  функций.
- Запросы, содержащие текст, можно разделить, объединить, использовать для них заглавные буквы и т. д.
- После агрегирования данные можно дополнительно отсортировать с помощью условий GROUP BY и HAVING.
- Условие HAVING работает с агрегатными полями так же, как условие WHERE
  с неагрегатными.
- Условие HAVING можно использовать в запросе, только если имеется условие
  GROUP BY.
- Условие GROUP BY можно использовать с несколькими полями, чтобы еще
  больше детализировать агрегатные данные.
