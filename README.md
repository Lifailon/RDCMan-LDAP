# RDCMan-LDAP
**Модуль для автоматического создания списка rdg всех компьютеров в AD и формированию их в группы по наименованию OU текущего месторасположения в доменной структуре.** Не требуется установки модуля и участия пользователя в процессе создания, для получения данных скрипт использует протокол LDAP, имя домена берется из переменной окружения.

Скрипт разбит на три части, будет полезен для инвентаризации, а так же наглядной визуализации списка всех комьютеров и их текущего месторасположения в OU в формате таблицы (Out-GridView).

Протестировано для версии RDCMan 2.92.
На формирование списка из 630 компьютеров и 65 уникальных путей OU (имен групп) составило 1 минута 30 секунд (3550 строк).
