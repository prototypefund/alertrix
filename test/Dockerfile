ARG PYTHON_VERSION=3.12.2
FROM python:${PYTHON_VERSION} AS base

# Prevents Python from writing pyc files.
ENV PYTHONDONTWRITEBYTECODE=1

# Keeps Python from buffering stdout and stderr to avoid situations where
# the application crashes without emitting any logs due to buffering.
ENV PYTHONUNBUFFERED=1

WORKDIR /app

# Create a non-privileged user that the app will run under.
# See https://docs.docker.com/go/dockerfile-user-best-practices/
ARG UID=1000
RUN adduser \
    --disabled-password \
    --gecos "" \
    --home "/home" \
    --shell "/sbin/nologin" \
    --no-create-home \
    --uid "${UID}" \
    alertrix

RUN mkdir /var/www/static/ -p
RUN chown alertrix:alertrix /var/www/static
RUN chown alertrix:alertrix /home
RUN chown alertrix:alertrix /app

# Download dependencies as a separate step to take advantage of Docker's caching.
# Leverage a cache mount to /root/.cache/pip to speed up subsequent builds.
# Leverage a bind mount to requirements.txt to avoid having to copy them into
# into this layer.
RUN --mount=type=cache,target=/root/.cache/pip \
    --mount=type=bind,source=requirements.txt,target=requirements.txt \
    python -m pip install -r requirements.txt
RUN python -m pip install coverage

COPY ./test/entrypoint.sh .
RUN chmod +x entrypoint.sh
RUN chown -R alertrix:alertrix /usr/local/lib

# Switch to the non-privileged user to run the application.
USER alertrix

# Copy the source code into the container.
COPY ./src .

RUN python manage.py collectstatic --noinput

# Expose the port that the application listens on.
EXPOSE 8000

# Run the application.
CMD ["./entrypoint.sh"]
