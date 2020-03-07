## Covid-19 basic charts

### Create
If you are ok with deps, just run `make` to get the lastest `covid-<date>.html` generated.

### Build from Docker container (Debian)
```
docker pull debian:latest
docker run -ti --name covid-19-basic-charts debian:latest bash
```

From newly created container: 
```
apt update
apt install git python3-pip
useradd -m -s /bin/bash covid
su - covid
pip3 install --upgrade pip
. .profile # refresh updated PATH including .local/bin
pip3 install jupyter nbconvert pandas matplotlib 
git clone https://github.com/andreaaizza/covid-19-basic-charts covid-19-basic-charts
cd covid-19-basic-charts
make
```
