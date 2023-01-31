# RDCMan-LDAP
**Модуль для автоматического создания rdg-списка всех компьютеров в AD и формированию их в группы по наименованию полного пути к OU текущего месторасположения в доменной структуре.** Не требует установки модуля RSAT и участия пользователя в процессе, для получения данных скрипт использует протокол LDAP (используется встроенный класс .NET: DirectoryServices.DirectorySearcher), имя домена берется из переменной окружения. Протестировано для версии RDCMan 2.92.

Скрипт разбит на три части, будет полезен для инвентаризации и визуализации списка всех комьютеров в формате таблицы (Out-GridView), по которой можно узнать Organizational Unit, в которой расположен компьютер.

1. Получаем данные, парсим вывод, формируем объект массива, упорядочиваем и сортируем путь OU к компьютеру:

**[Скачать (RDCMan-LDAP-0.1.ps1)](https://github.com/Lifailon/RDCMan-LDAP/blob/rsa/RDCMan-LDAP-0.1.ps1)**.

![Image alt](https://github.com/Lifailon/RDCMan-LDAP/blob/rsa/Screen/Out-GridView-0.1.jpg)

> Вывод можно конвертировать в csv или напрямую создать таблицу Excel.

2. Пересобираем коллекцию, исключаем повторяющиеся имена групп и добавляем севера в свои OU:

**[Скачать (RDCMan-LDAP-0.2.ps1)](https://github.com/Lifailon/RDCMan-LDAP/blob/rsa/RDCMan-LDAP-0.2.ps1)**.

![Image alt](https://github.com/Lifailon/RDCMan-LDAP/blob/rsa/Screen/Out-GridView-0.2.jpg)

3. Подставляем значения в синтаксис xml для формирования rdg-фала:

**[Скачать (RDCMan-LDAP.ps1)](https://github.com/Lifailon/RDCMan-LDAP/blob/rsa/RDCMan-LDAP.ps1)**.

![Image alt](https://github.com/Lifailon/RDCMan-LDAP/blob/rsa/Screen/RDCMan-List.jpg)

**На формирование списка из 630 компьютеров и 65 уникальных путей OU (имен групп) составило 1 минута 30 секунд (3550 строк).**

![Image alt](https://github.com/Lifailon/RDCMan-LDAP/blob/rsa/Screen/rdg-file.jpg)
