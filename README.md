# RDCMan-LDAP
**Скрипт для автоматического создания rdg-файла со списком всех компьютеров в AD и их в групп по наименованию полного пути к OU текущего месторасположения в доменной структуре.** Не требует установки модуля RSAT и участия пользователя в процессе, для получения данных скрипт использует протокол LDAP (встроенный класс .NET: DirectoryServices.DirectorySearcher), имя домена берется из переменной окружения. Протестировано для версии RDCMan 2.92.

Скрипт разбит на три части, будет полезен для инвентаризации и визуализации списка всех комьютеров в формате таблицы (Out-GridView), по которой можно узнать Organizational Unit, в которой расположен компьютер.

### 1. Получаем данные, парсим вывод, формируем объект массива, упорядочиваем и сортируем путь OU к компьютеру для создания имен групп:

**[RDCMan-LDAP-0.1.ps1](https://github.com/Lifailon/RDCMan-LDAP/blob/rsa/RDCMan-LDAP-0.1.ps1)**.

> Вывод можно импортировать в формат csv или напрямую создать таблицу Excel.

![Image alt](https://github.com/Lifailon/RDCMan-LDAP/blob/rsa/Screen/Out-GridView-0.1.jpg)

### 2. Пересобираем коллекцию, исключаем повторяющиеся имена групп и добавляем комьютеры в свои OU:

**[RDCMan-LDAP-0.2.ps1](https://github.com/Lifailon/RDCMan-LDAP/blob/rsa/RDCMan-LDAP-0.2.ps1)**.

![Image alt](https://github.com/Lifailon/RDCMan-LDAP/blob/rsa/Screen/Out-GridView-0.2.jpg)

### 3. Подставляем значения в синтаксис xml для формирования rdg-фала:

**[RDCMan-LDAP.ps1](https://github.com/Lifailon/RDCMan-LDAP/blob/rsa/RDCMan-LDAP.ps1)**.

![Image alt](https://github.com/Lifailon/RDCMan-LDAP/blob/rsa/Screen/RDCMan-List.jpg)

**На формирование списка из 630 компьютеров и 65 уникальных путей OU (имен групп) составило 1 минута 30 секунд (3550 строк).**

![Image alt](https://github.com/Lifailon/RDCMan-LDAP/blob/rsa/Screen/rdg-file.jpg)

> По аналогии, можно формировать список из групп подсетей, добавляя компьютеры, которые отвечают на icmp пакеты и производится resolve имени в DNS, для фильтрации хостов с ОС Windows, можно использовать rpc/winrm запросы.
