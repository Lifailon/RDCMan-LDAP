# RDCMan-LDAP
**Модуль для автоматического создания списка rdg всех компьютеров в AD и формированию их в группы по наименованию OU текущего местанохождения в доменной структуре.** Не требуется установки модуля и участия пользователя в процессе создания, для получения данных скрипт использует протокол LDAP, домен берется из переменной окружения env, из под которого запущен скрипт. 

Скрипт разбит на три части, будет полезен для инвентаризации, а так же наглядной визуализации списка всех комьютеров и их текущего месторасположения в OU в формате Excel.
