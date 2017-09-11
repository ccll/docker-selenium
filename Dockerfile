FROM python:3.6.2

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - 
RUN apt-key add ./linux_signing_key.pub
RUN sh -c 'echo "deb https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
RUN apt-get update && apt-get install -y google-chrome-stable && rm -rf /var/lib/apt/lists/*
RUN pip install --no-cache-dir -r ./requirements.txt
