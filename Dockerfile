FROM python:3.8

COPY . /build
RUN cd /build && pip install . && rm -rf /build

EXPOSE 8089 5557

RUN useradd --create-home locust
USER locust
WORKDIR /home/locust
ENTRYPOINT ["pacs_locust"]

# turn off python output buffering
ENV PYTHONUNBUFFERED=1
