FROM ubuntu@sha256:626ffe58f6e7566e00254b638eb7e0f3b11d4da9675088f4781a50ae288f3322

USER root
## update the system
apt-get update -y && apt-get upgrade -y

apt-get install -y apt-utils
