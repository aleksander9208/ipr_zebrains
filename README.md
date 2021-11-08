# Как развернуть проект локально:

```
git clone --recursive -b develop ssh://git@bitbucket.zebrains.team:7999/sksog/vitrskid.git
cd vitrskid
make env
make run
```
## Tесты
На проекте используется phpunit, команда для запуска тестов
```
make phpunit
```

## Миграции
на проекте используется https://github.com/arrilot/bitrix-migrations

Таблица с миграциями может отсутствовать при первом запуске проекта создать ее можно командой `make migrator-install`

запуск миграции `make db-migrate`
откат `make db-rollback`
для создания миграции нужно выполнить команду `make mig-create name=<имя миграции>` (имя без скобок).

## Статический анализ

На проекте установлен [PHPSTAN](https://phpstan.org/)

Запуск статического анализа выполняется командой:

```
make stan
```

## Проверка стандартазации кода

На проекте установлен [CodeSniffer](https://github.com/squizlabs/PHP_CodeSniffer)

Запуск проверки кода выполняется командой:

```
make phpcs
```

Запуск автоматического исправление и приведения к стандартизации:

```
make phpcbf
```