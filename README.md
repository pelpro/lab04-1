[![Build Status](https://travis-ci.com/nevstruevdmitriy/lab04.svg?branch=master)](https://travis-ci.com/nevstruevdmitriy/lab04) [![Build Status](https://ci.appveyor.com/api/projects/status/github/nevstruevdmitriy/lab04)](https://ci.appveyor.com/project/nevstruevdmitriy/lab04)

## Laboratory work IV

Данная лабораторная работа посвещена изучению систем непрерывной интеграции на примере сервиса **Travis CI**

```ShellSession
$ open https://travis-ci.org
```

## Tasks

- [x] 1. Авторизоваться на сервисе **Travis CI** с использованием **GitHub** аккаунта
- [x] 2. Создать публичный репозиторий с названием **lab04** на сервисе **GitHub**
- [x] 3. Ознакомиться со ссылками учебного материала
- [x] 4. Включить интеграцию сервиса **Travis CI** с созданным репозиторием
- [x] 5. Получить токен для **Travis CLI** с правами **repo** и **user**
- [x] 6. Получить фрагмент вставки значка сервиса **Travis CI** в формате **Markdown**
- [x] 7. Выполнить инструкцию учебного материала
- [x] 8. Составить отчет и отправить ссылку личным сообщением в **Slack**

## Tutorial

Переменные
```ShellSession
$ export GITHUB_USERNAME=<имя_пользователя>
$ export GITHUB_TOKEN=<полученный_токен>
```

рабочая папка
```ShellSession
$ cd ${GITHUB_USERNAME}/workspace
$ pushd .
$ source scripts/activate
```

устанавливаем утелиты rvm
```ShellSession
$ \curl -sSL https://get.rvm.io | bash -s -- --ignore-dotfiles
$ echo "source $HOME/.rvm/scripts/rvm" >> scripts/activate
$ . scripts/activate
$ rvm autolibs disable
$ rvm install ruby-2.4.2
$ rvm use 2.4.2 --default
$ gem install travis
```

новый реп
```ShellSession
$ git clone https://github.com/${GITHUB_USERNAME}/lab03 projects/lab04
$ cd projects/lab04
$ git remote remove origin
$ git remote add origin https://github.com/${GITHUB_USERNAME}/lab04
```

добавляем конфиг для travis - устанавливаем язык
```ShellSession
$ cat > .travis.yml <<EOF
language: cpp
EOF
```

прописываем сборку и компиляцию
```ShellSession
$ cat >> .travis.yml <<EOF

script:
- cmake -H. -B_build -DCMAKE_INSTALL_PREFIX=_install
- cmake --build _build
- cmake --build _build --target install
EOF
```

необходимые пакеты
```ShellSession
$ cat >> .travis.yml <<EOF

addons:
  apt:
    sources:
      - george-edison55-precise-backports
    packages:
      - cmake
      - cmake-data
EOF
```

входим в travis
```ShellSession
$ travis login --github-token ${GITHUB_TOKEN}
Successfully logged in as nevstruevdmitriy!
```

```ShellSession
$ travis lint
Hooray, .travis.yml looks valid :)

```

добавяем значёк
```ShellSession
$ ex -sc '1i|<фрагмент_вставки_значка>' -cx README.md
```

комитим изменение
```ShellSession
$ git add .travis.yml
$ git add README.md
$ git commit -m"added CI"
$ git push origin master
```

смотрим на вывод travis
```ShellSession
$ travis lint
Hooray, .travis.yml looks valid :)
$ travis accounts
nevstruevdmitriy (Nevstruev Dmitriy): subscribed, 35 repositories
robocupmipt (RoboCup MIPT): subscribed, 12 repositories
$ travis sync
synchronizing: . done
$ travis repos
... много репощиториев...
$ travis enable
nevstruevdmitriy/lab04: enabled :)
$ travis whatsup
nothing to show
$ travis branches
$ travis history
$ travis show
```

## Report

```ShellSession
$ popd
$ export LAB_NUMBER=04
$ git clone https://github.com/tp-labs/lab${LAB_NUMBER} tasks/lab${LAB_NUMBER}
$ mkdir reports/lab${LAB_NUMBER}
$ cp tasks/lab${LAB_NUMBER}/README.md reports/lab${LAB_NUMBER}/REPORT.md
$ cd reports/lab${LAB_NUMBER}
$ edit REPORT.md
$ gist REPORT.md
```

## Homework

Вы продолжаете проходить стажировку в "Formatter Inc." (см [подробности](https://github.com/tp-labs/lab03#Homework)).

В прошлый раз ваше задание заключалось в настройке автоматизированной системы **CMake**.

Сейчас вам требуется настроить систему непрерывной интеграции для библиотек и приложений, с которыми вы работали в [прошлый раз](https://github.com/tp-labs/lab03#Homework). Настройте сборочные процедуры на различных платформах:
* используйте [TravisCI](https://travis-ci.com/) для сборки на операционной системе **Linux** с использованием компиляторов **gcc** и **clang**;
* используйте [AppVeyor](https://www.appveyor.com/) для сборки на операционной системе **Windows**.

## Links

- [Travis Client](https://github.com/travis-ci/travis.rb)
- [AppVeyour](https://www.appveyor.com/)
- [GitLab CI](https://about.gitlab.com/gitlab-ci/)

```
Copyright (c) 2015-2019 The ISC Authors
```

