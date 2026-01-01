IMAGE_NAME := mojo-books
IMAGE_TAG  := dev
IMAGE      := $(IMAGE_NAME):$(IMAGE_TAG)

.PHONY: build rebuild run images clean up down logs restart

build:
	docker build --load -t $(IMAGE) .

rebuild:
	docker build --no-cache --load -t $(IMAGE) .

run:
	docker run --rm -p 3000:3000 \
		-e MOJO_MODE=development \
		-e MOJO_LISTEN=http://0.0.0.0:3000 \
		$(IMAGE)

images:
	docker images | grep $(IMAGE_NAME) || true

clean:
	docker rmi $(IMAGE) || true

up:
	docker compose up -d

up-build:
	docker compose up -d --build

down:
	docker compose down

logs:
	docker compose logs -f app

restart:
	docker compose restart app

