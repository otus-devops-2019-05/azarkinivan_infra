## Выполнено ДЗ №11

 - Основное ДЗ

## В процессе сделано:

 - Установлен VirtualBox и Vagrant
 - Сконфигурирован Vagrant, созданы 2 ВМ
 - Доработаны роли app и db. Произведен провижининг
 - Установлена Molecule. Проведено тестирование роли

## Как запустить проект:
```
ansible-playbook site.yml
```
## Как проверить работоспособность:
По ссылке:
```
https://travis-ci.com/otus-devops-2019-05/azarkinivan_infra/
```
## PR checklist
Выставил label - ansible и ansible-4


## Выполнено ДЗ №10

 - Основное ДЗ

## В процессе сделано:

 - Перенесли текущие playbooks в роли (ansible-galaxy)
 - Описали окружения stage и prod
 - Использовали коммьюнити роль nginx для настройки проксирования
 - Использовали vault для шифрования секретов окружений

## Как запустить проект:
```
ansible-playbook site.yml
```
## Как проверить работоспособность:
По ссылке:
```
https://travis-ci.com/otus-devops-2019-05/azarkinivan_infra/
```
## PR checklist
Выставил label - ansible и ansible-3


## Выполнено ДЗ №9

 - Основное ДЗ

## В процессе сделано:

 - Создали шаблоны
 - Создали один playbook много задач
 - Создали один playbook несколько сценариев
 - Создали один playbook для запуска дургих playbook-ов
 - Заменили shell-provisioning в Packer на ansible playbook

## Как запустить проект:
```
ansible-playbook site.yml
```
## Как проверить работоспособность:
По ссылке:
```
https://travis-ci.com/otus-devops-2019-05/azarkinivan_infra/
```
## PR checklist
Выставил label - ansible-2


## Выполнено ДЗ №8

 - Основное ДЗ

## В процессе сделано:

- Установлен easy_install
- Установлен ansible, requirements.txt не сработал - установилась версия 2.8.x
- Выполнил ручную установку ansible 2.4.x
- Добавлены различные конфиги: inventory, ansible.cfg, inventory.yml
- Проведены эксперименты с командами, различными модулями (ex.: command, shell...)
- Создан playbook clone.yml, выполнены команды:
```
ansible-playbook clone.yml
ansible app -m command -a 'rm -rf ~/reddit'
ansible-playbook clone.yml
После выполнения такой последовательности был создан, затем удален склонированный репозиторий reddit, а далее снова добавлен, как новый. 
Поэтому статус changed=1.
```

## Как запустить проект:
```
ansible-playbook clone.yml
```
## Как проверить работоспособность:
По ссылке:
```
https://travis-ci.com/otus-devops-2019-05/azarkinivan_infra/
```
## PR checklist
Выставил label - ansible-1 и ansible

## Выполнено ДЗ №7

 - Основное ДЗ
 
## В процессе сделано:
 
- Проведен импорт существующий инфр-ры из GCP + ssh
- Взаимосвязь ресурсов. Сконфигурировали неявную зависимость
- Структуризация ресурсов. Разделили конф. файлы
- Создали локальные модули
- Воспользовались сторонним модулем storage-bucket
- Отформатированы конфигурационные файлы terraform
 
## Как запустить проект:
```
Для создания Prod инфраструктуры, перейти в terraform/prod
Выполнить: /usr/local/bin/terraform apply -auto-approve=true
Аналогично для Stage      
```
## Как проверить работоспособность:
По ссылке:
```
https://travis-ci.com/otus-devops-2019-05/azarkinivan_infra/
```
## PR checklist
Выставил label - terraform-2 и Terraform
 
## Выполнено ДЗ №6

 - Основное ДЗ

## В процессе сделано:

- Проверен образ, созданный с помощью packer в HW-5
- Установлен и инициализирован terraform
- Создан шаблон main.tf и заполнен секциями reosurse и provisioners, согласно слайдам
- Добавлены скрипты для провижининга
- Выполнена параметризация
- Отформатированы конфигурационные файлы terraform

## Как запустить проект:
```
/usr/local/bin/terraform init
/usr/local/bin/terraform plan
/usr/local/bin/terraform apply -auto-approve=true
```
## Как проверить работоспособность:
По ссылке:
```
https://travis-ci.com/otus-devops-2019-05/azarkinivan_infra/
```
## PR checklist
Выставил label - terraform и terraform-1

## Выполнено ДЗ №5

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
