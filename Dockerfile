FROM python:3
ENV PYTHONUNBUFFERED 1
WORKDIR /code/DjangoBlog/
RUN  apt-get install  default-libmysqlclient-dev -y && \
    ln -sf /usr/share/zoneinfo/Asia/Shanghai  /etc/localtime
ADD requirements.txt requirements.txt
RUN pip install -Ur requirements.txt  -i https://pypi.tuna.tsinghua.edu.cn/simple && \
        pip install gunicorn[gevent] -i https://pypi.tuna.tsinghua.edu.cn/simple
ADD . .
ENTRYPOINT ["/code/DjangoBlog/bin/docker_start.sh"]
