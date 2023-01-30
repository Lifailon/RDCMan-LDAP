# RDCMan-LDAP
**Модуль для автоматического создания списка rdg всех компьютеров в AD и формированию их в группы по наименованию полного пути OU текущего месторасположения в доменной структуре.** Не требуется установки модуля и участия пользователя в процессе создания, для получения данных скрипт использует протокол LDAP, имя домена берется из переменной окружения. Протестировано для версии RDCMan 2.92.

Скрипт разбит на три части, будет полезен для инвентаризации и визуализации списка всех комьютеров в формате таблицы (Out-GridView), по которой можно инициализировать Organizational Unit, в которой расположен компьютер.

![Image alt](https://github.com/Lifailon/RDCMan-LDAP/blob/rsa/Screen/Out-GridView-0.1.jpg)

![Image alt](https://github.com/Lifailon/RDCMan-LDAP/blob/rsa/Screen/Out-GridView-0.2.jpg)

![Image alt](https://github.com/Lifailon/RDCMan-LDAP/blob/rsa/Screen/RDCMan-List.jpg)

**На формирование списка из 630 компьютеров и 65 уникальных путей OU (имен групп) составило 1 минута 30 секунд (3550 строк).**

![Image alt](https://github.com/Lifailon/RDCMan-LDAP/blob/rsa/Screen/rdg-file.jpg)
