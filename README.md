# restream study

[![Build Status](https://travis-ci.org/Restream/study.svg?branch=master)](https://travis-ci.org/Restream/study)

## Запуск проекта

```
docker-compose build
docker-compose run --rm ruby bash -c 'bundle install'
```

## Запуск тестов

```
docker-compose run --rm ruby bash -c 'bundle exec rake test'
```

## Запуск линтера

```
docker-compose run --rm ruby bash -c 'bundle exec rubocop'
```

## Задача

1. Сделать форк проекта к себе в аккаунт.

2. В дирректории с вашим именем есть задачи, каждая в отдельной поддиректории.

  По умолчанию все тесты во всех задачах пропускаются. Чтобы начать работу нужно удалить `skip` из тесткейса.

  Далее для каждой из задач реализовать недостающие методы так, чтобы все тесты проходили. Дополнительную информацию можно найти в комментарии к тесту.

  Проверять можно запуская `bundle exec rake test`

3. После того как все тесты проходят, нужно создать pull request в основной репозиторий.
