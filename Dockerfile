FROM python:3.10-buster
RUN groupadd --gid 1000 app && \
    useradd --create-home --gid 1000 --uid 1000 app
RUN mkdir -p /home/app/src
WORKDIR /home/app/src
COPY ./ /home/app/src
RUN pip3 install --upgrade pip
RUN pip3 install -r requirements.txt
USER app
ENTRYPOINT ["gunicorn"]

CMD ["app:app"]
