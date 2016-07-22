#!/bin/bash


echo -n "Ввод каталога виртуального окружения: "
read venvname

echo "Вы ввели $venvname и созданный каталог будет находиться по пути $HOME/VIRTUALENV/$venvname"
mkdir $HOME/VIRTUALENV/$venvname

cd $HOME/VIRTUALENV/$venvname
virtualenv projectenv
source projectenv/bin/activate
pip install django pytz
echo -n "Введите название проекта: "
read projectname
django-admin.py startproject $projectname
cd $projectname
echo -n "Введите название приложения: "
read appname
python manage.py startapp $appname
python manage.py migrate
python manage.py createsuperuser
cd $appname
mkdir -v static
mkdir -pv templates/$appname
touch urls.py forms.py
cd static
curl -O http://foundation.zurb.com/sites/download.html/complete
unzip complete
rm complete
deactivate

echo "Виртуальное окружение создано, django и pytz установлены"
echo "суперпользователь создан."
echo "foundation скачан и распакован в папку static"