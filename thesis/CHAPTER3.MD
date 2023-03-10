# Работа с базой данных #

## Добавление базы ##

В открытом DB Browser выберите пункт Open Database (Открыть базу данных). Откроется диалоговое окно Choose a Database
File (Выбрать файл базы данных). Перейдите в папку, в которую вы загрузили учебную базу данных sTunes, и нажмите кнопку
Open (Открыть).

## Структура базы данных ##

При открытии файла на вкладке Database Structure (Структура базы данных) отображаются таблицы из базы данных.
Теперь, мы можем исследовать структуру базы данных, мы получим намного больше информации о нашей вымышленной
компании sTunes. Прежде чем мы начнем писать SQL-запросы, рекомендуется посмотреть, какие типы данных нам доступны.
Прежде всего база данных sTunes состоит из тринадцати таблиц. Если нажать на стрелку, расположенную слева от имени
таблицы, отобразятся поля, содержащиеся в каждой таблице. В таблице albums это поля AlbumId, Title и ArtistId.
Поле AlbumId — целочисленный тип данных. Это означает, что поле содержит числовые данные (числа).
Поле Title — символьный тип данных (известный как NVARCHAR). Это означает, что поле содержит символы, или нечисловые
данные. Поле ArtistId — также целочисленный тип данных.

## Просмотр индивидуальных записей ## 

Вкладку Browse Data (Просмотр данных) можно использовать для просмотра записей в каждой таблице. Чтобы переключаться
между таблицами и просматривать данные, можно использовать раскрывающийся список. На вкладке Database Structure
(Структура базы данных) отображаются столбцы.

## Вкладка Execute SQL ##

На вкладке Execute SQL (Выполнить SQL-запрос) мы пишем операторы SQL. Вкладка содержит три панели окон основных
компонентов: панель запросов (Query Pane), панель результатов (Results Pane) и панель сообщений (Messages Pane).
Рассмотрим назначение этих трех панелей с помощью следующего кода SQL на панели запросов.

```sqlite
SELECT *
FROM albums;
```

Данный пример задает выборку всех полей (символ * обозначает «все поля») из таблицы albums.
Нажмите кнопку выполнения, расположенную над панелью запросов, и ниже, на панели результатов, отобразятся поля и данные
этих полей. Также есть панель сообщений, в которой отображается информация о нашем запросе.

- Количество строк, возвращаемых нашим оператором SQL.
- Время, необходимое на выполнение нашего запроса или оператора SQL.
- Сообщения об ошибках, если наш оператор SQL содержит ошибки

Панель сообщений — место, где также будут отображаться сообщения об ошибках. Если ваш запрос не выполняется корректно,
необходимо проверить панель сообщений.


