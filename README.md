# Kubernetes Deployment Count Endpoint
This is a simple Python Application that gets running pods on your kube instance

## Unit Testing

Test driven development (TDD) was implemented in the development of this service . To intiate the test kindly run the
following command in the folder path on your terminal with your venv activated.
```bash
python manage.py test
```    
sample response

```bash
Creating test database for alias 'default'...
System check identified no issues (0 silenced).
..
----------------------------------------------------------------------
Ran 2 tests in 0.122s

OK
Destroying test database for alias 'default'...

```

## How to Build and Run the application

This service assumes that you have Python 3 >  duely installed on your system preferably on a Linux or mac Os, Windows is also greatly acceptable too,
provided you have the Python [installer](https://www.python.org/ftp/python/3.5.1/python-3.5.1-amd64.exe) installed, making sure you check the Add Python 3.5 to ENVIROMENT PATH checkbox. In cmd.exe run.

Building and Running the application is seamless :) trust me..
The service was ought to be a containerized application but I didn't want to have the image online  due to the instructions
given.

Thus i decided to write a bash script to automate your build..  



#### Flow One (Building and running the Service (Automated))
######Steps
1. open up the project path in your terminal (linux/Mac) or Command shell (git bash prefered) (Windows)
eg: user@ubuntu:~/path_to_project$ 

2. Then type ```sh build.sh``` in your terminal (Works Best on a Linux / MacOs)

And that's all

if all goes well you should see
```
System check identified no issues (0 silenced).
July 07, 2019 - 20:20:22
Django version 2.2.3, using settings 'free_now_api.settings'
Starting development server at http://0.0.0.0:7534/
Quit the server with CONTROL-C.

```
ctrl + click the link to access the api documentation


#### Flow Two (Building and running the Service (Manual))
Not my favorite...
######Steps
#####Mac Build
1. open up the project path in your terminal 
2. run the following commands on your terminal
    ```
    sudo easy_install pip
    sudo pip install virtualenv
    virtualenv --no-site-packages --python=python3 venv
    source venv/bin/activate
    ```
3. still on the project path , run the following commands to prepare migrations
    
    ```
    pip3 install -r requirements.txt
    python manage.py makemigrations
    python manage.py migrate
    ```
4. Finally lets run our application
    ```
    python manage.py runserver 0.0.0.0:7534
    
    ```

#####Linux (Ubuntu) Build
1. open up the project path in your terminal 
2. run the following commands on yout terminal
    ```
    sudo apt-get -y install python-virtualenv
    virtualenv --no-site-packages --python=python3 venv
    source venv/bin/activate
    ```
3. still on the project path , run the following commands to prepare migrations
    
    ```
    pip3 install -r requirements.txt
    python manage.py makemigrations
    python manage.py migrate
    ```
4. Finally lets run our application
    ```
    python manage.py runserver 0.0.0.0:7534
    
    ```

#####Windows Build
1. open up the project path in your terminal 
2. Download Python [installer](https://www.python.org/ftp/python/3.5.1/python-3.5.1-amd64.exe) and install making sure you check the Add Python 3.5 to PATH checkbox. In cmd.exe run:
3. run the following commands on yout terminal
    ```
    python -m pip install --upgrade pip
    pip install virtualenv
    virtualenv --no-site-packages venv
    ./venv/Scripts/activate.bat
    ```
4. still on the project path , run the following commands to prepare migrations
    
    ```
    pip3 install -r requirements.txt
    python manage.py makemigrations
    python manage.py migrate
    ```
5. Finally lets run our application
    ```
    python manage.py runserver 0.0.0.0:7534
    
    ```
    

### 1. Sample One Response 

Add an endpoint to the service that exposes all pods running in the cluster in namespace `default`:

```
GET `/services`
[

    {
        "applicationGroup": "beta",
        "name": "blissful-goodall-deployment",
        "runningPodsCount": 3
    },
    {
        "applicationGroup": "beta",
        "name": "confident-cartwright-deployment",
        "runningPodsCount": 1
    },
    {
        "applicationGroup": null,
        "name": "happy-colden-deployment",
        "runningPodsCount": 5
    },
    {
        "applicationGroup": "gamma",
        "name": "quirky-raman-deployment",
        "runningPodsCount": 2
    },
    {
        "applicationGroup": "alpha",
        "name": "stoic-sammet-deployment",
        "runningPodsCount": 1
    }

]
```

### 2. Sample two Response 

Create an endpoint in your service that exposes the pods in the cluster in namespace `default` that are part of the same `applicationGroup`:

```
GET `/services/{applicationGroup}`
[
    {
        "name": "blissful-goodall-deployment",
        "runningPodsCount": 3,
        "applicationGroup": "beta"
    },
    {
        "name": "confident-cartwright-deployment",
        "runningPodsCount": 1,
        "applicationGroup": "beta"
    }
]
```

