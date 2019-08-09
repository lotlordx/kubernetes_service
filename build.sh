#!/bin/bash


ENVIROMENTPATH="$( cd "$(dirname "$0")" ; pwd -P )/venv"
BASEPATH="$( cd "$(dirname "$0")" ; pwd -P )"

if [ -d "$ENVIROMENTPATH" ]; then

     echo "Detecting Os type..."
    sleep 2
    osType=$(uname -s)

    case "$osType" in
    Linux*)

    # _______________________________Linux StartUp_____________________________

    cd ${BASEPATH}
    echo "Activating your virtual enviroment.."
    . venv/bin/activate

    echo "Launching Free Now Kubernetes Service Lotanna Amaechi...."
    python manage.py runserver 0.0.0.0:7534
    machine=Linux;;
    Darwin*)

    # __________________________Mac StartUp_____________________________

    cd ${BASEPATH}
    echo "Activating your virtual enviroment.."
    . venv/bin/activate

    echo "Launching Free Now Kubernetes Service Lotanna Amaechi...."
    python manage.py runserver 0.0.0.0:7534

    machine=Mac;;
    MINGW*)
    #  __________________________ Windows StartUp_____________________________

    cd ${BASEPATH}
    echo "Activating your virtual enviroment.."
    ./venv/Scripts/activate.bat

    echo "Launching Free Now Kubernetes Service Lotanna Amaechi...."
    python manage.py runserver 0.0.0.0:7534
    machine=MinGw;;
    CYGWIN*)

    machine=Cygwin;;
    *)
    machine="UNKNOWN:$osType"
    esac


else
    echo "This definitely looks like your first build, but not to worry.... Sip Some Cofee Trust Me This Won't take Long .... :)"
    sleep 4
#    if enviroment path does not exist
    echo "Detecting Os type..."
    sleep 2
    osType=$(uname -s)

    case "$osType" in
    Linux*)

    # _______________________________Linux Installation_____________________________

    echo "Installing virtualEnv for ${osType} .."
    sudo apt-get -y install python-virtualenv

    cd ${BASEPATH}
    echo "Activating your virtual enviroment.."
    virtualenv --no-site-packages --python=python3 venv
    . venv/bin/activate

    echo "Installing package Dependencies into your virtual enviroment..."
    pip install -r requirements.txt

    echo "Processing Django Migrations..."
    python manage.py makemigrations
    python manage.py migrate

    echo "Launching Free Now Kubernetes Service Lotanna Amaechi...."
    python manage.py runserver 0.0.0.0:7534
    machine=Linux;;
    Darwin*)

    # __________________________Mac Installation_____________________________

    echo "Installing virtualEnv for ${osType} .."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    export PATH="/usr/local/opt/python/libexec/bin:$PATH"
    brew install python
    sudo easy_install pip
    sudo pip install virtualenv

    cd ${BASEPATH}
    echo "Activating your virtual enviroment.."
    virtualenv --no-site-packages --python=python3 venv
    . venv/bin/activate

    echo "Installing package Dependencies into your virtual enviroment..."
    pip3 install -r requirements.txt

    echo "Processing Django Migrations..."
    python manage.py makemigrations
    python manage.py migrate

    echo "Launching Free Now Kubernetes Service Lotanna Amaechi...."
    python manage.py runserver 0.0.0.0:7534

    machine=Mac;;
    MINGW*)
    #  __________________________ Windows Installation_____________________________

    echo "Installing Pip"
    python -m pip install --upgrade pip

    echo "Installing virtualEnv for ${osType} .."
    pip install virtualenv

    cd ${BASEPATH}
    echo "Activating your virtual enviroment.."
    virtualenv --no-site-packages venv
    ./venv/Scripts/activate.bat

    echo "Installing package Dependencies into your virtual enviroment..."
    pip3 install -r requirements.txt

    echo "Processing Django Migrations..."
    python manage.py makemigrations
    python manage.py migrate

    echo "Launching Free Now Kubernetes Service Lotanna Amaechi...."
    python manage.py runserver 0.0.0.0:7534
    machine=MinGw;;
    CYGWIN*)

    machine=Cygwin;;
    *)
    machine="UNKNOWN:$osType"
    esac
    echo "Opps Something went wrong, Seems Like Python or one of its Dependencies isn't installed on your system..."

fi