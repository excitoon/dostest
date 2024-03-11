FROM testbox

WORKDIR /app
COPY example/run .
ENV PATH /app:${PATH}

WORKDIR /test
COPY example/application .
COPY example/images images

CMD run
