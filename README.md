## Выполнено ДЗ №4

 - Основное ДЗ

## В процессе сделано:

 - Перенесены скрипты из HW-4 в новую папку config-scripts
 - Установлен packer согласно документации
 - Создан шаблон для packer - ubuntu16.json
 - Добавлен блок provisioners, перемещены скрипты из предыдущей HW-4
 - Произведена валидация итогового шаблона:
```
packer validate ./ubuntu16.json
```
 - Произведен деплой packer шаблона - получен образ
 - Из образа подготовлена и запущена VM
 - Задеплоено приложение аналогично HW-4, проверена его работоспособность
 - Произведена параметризация шаблона соогласно документации
 - Файл variables.json добавлен в .gitignore

## Как запустить проект:
```
packer build ./ubuntu16.json
```
## Как проверить работоспособность:
По ссылке:
```
https://travis-ci.com/otus-devops-2019-05/azarkinivan_infra/
```
## PR checklist
Выставил label - packer-base и Packer

## Выполнено ДЗ №4

 - Основное ДЗ

## В процессе сделано:
 - Установлен и инициализирован gcloud для CentOS
 - Из gcloud создана VM, согласно слайдам. Вновь сконфигурирован ssh-agent
 - Установлен ruby и bundler
 - Установлена mongodb
 - Выполнен деплой ранее склонированного приложения
 - Создано правило на FW для открытия порта puma-server
 - Созданы .sh скрипты для автоматизации установок

## Как запустить проект:
```
testapp_IP = 34.77.120.124
testapp_port = 9292
```
## Как проверить работоспособность:
По ссылке:
```
https://travis-ci.com/otus-devops-2019-05/azarkinivan_infra/
```
## PR checklist
Выставил label - GCP и cloud-testapp

## Выполнено ДЗ №3

 - Основное ДЗ

## В процессе сделано:
ud для CentOS
Из gcloud создана VM, согласно слайдам. Вновь сконфигурирован ssh-agent
Установлен ruby и bundler
Установлена mongodb
Выполнен деплой ранее склонированного приложения
Создано правило на FW для открытия порта puma-server
Созданы .sh скрипты для автоматизации установок
```
## Как запустить проект:
```
testapp_IP = 34.77.120.124
testapp_port = 9292
```
## Как проверить работоспособность:
```
По ссылке: https://travis-ci.com/otus-devops-2019-05/azarkinivan_infra/
```
## PR checklist
```
Выставил label - GCP и cloud-testapp
```


 - Создаем ветку  
```
    git checkout -b cloud-bastion
```
 - Регистрируем уз в GCP  
    https://cloud.google.com/free/
 - Создаем новый проект infra
 - Активируем GCE
 - Добавляем ssh-ключ:  
```
    ssh-keygen -t rsa -f ~/.ssh/appuser -C appuser -P ""
```
 - Копируем ключ appuser.pub и вставляем в метаданные GCP
 - Создаем VM bastion и конфигурируем сеть согласно слайдам
 - Проверяем из локальной консоли подключение к ВМ1:  
```
    ssh -i ~/.ssh/appuser appuser@35.210.130.169
```
 - Создаем VM someinternalhost и конфигурируем сеть согласно слайдам, без публичного адреса  
```
    ssh -i ~/.ssh/appuser appuser@35.210.130.169  
    ssh 10.132.0.3  
    Permission denied (publickey).
```
 - Настраиваем ssh forwarding
 - Запускаем ssh agent:
```
    eval `ssh-agent`  
    ssh-add -L  
    ssh-add ~/.ssh/appuser
```
 - Подлюкчаемся к bastion с включением ssh agent:  
```
    ssh -i ~/.ssh/appuser -A appuser@35.210.130.169  
    ssh 10.132.0.3  
    Успех!
```
 - Проверяем отсутсвеи приватных ключей на bastion:  
```
    ls -la ~/.ssh/
```
## Самостоятельная работа:  
```
    ssh -i ~/.ssh/appuser -A appuser@35.210.130.169 ssh 10.132.0.3
```
 - Добавляем ключ на bastion командой:  
```
    ssh someinternalhost
```
 - Далее с локальной машины:  
```
    ssh -i ~/.ssh/appuser -A appuser@35.210.130.169 ssh someinternalhost
```
 - Создаем VPN сервер Pritunl
 - На bastion в настройках ВМ разрешаем http/https трафик
 - На bastion выполняем:  
    https://gist.github.com/Nklya/df07e99e63e4043e6a699060a7e30b66  
```
    sudo bash setupvpn.sh
```
 - Переходим в Pritunl:  
    https://35.210.130.169/setup
 - Выполняем:  
```
    sudo pritunl setup-key  
    sudo pritunl default-password
```
 - Конфигугрируем согласно слайдам, добавляем орг., пользователя и сервер с привязкой к орг.
 - Запускаем сервер и запоминаем порт: 11124
 - Создаем правило брандмауэра: vpn-11124 согласно слайдам
 - Добавляем в теги сети правило vpn-11124
 - Устанавливаем openvpn client на домашний пк
 - Подкладываем *.ovpn конфиг, ранее скачанный с vpn-сервера
 - Осуществляем подключени используя уз:  
    test с PIN 621***  
    Успех!
 - Проверка подключения к внутреннему хосту someinternalhost:  
```
    ssh - ~/.ssh/appuser appuser@10.132.0.3
```
 - Копируем setupvpn.sh на локальный хост:  
```
    scp appuser@35.210.130.169:setupvpn.sh /home/iazarkin/otus/
```
 - Выполняем коммит изменений в ветку master

## Как запустить проект:
```
bastion_IP = 35.210.130.169  
someinternalhost_IP = 10.132.0.3
```
## Как проверить работоспособность:
 - Перейти по ссылке https://travis-ci.com/otus-devops-2019-05/azarkinivan_infra

## PR checklist
 - [ ] Выставил label с темой домашнего задания - cloud-bastion
