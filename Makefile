IMAGE_NAME := mojo-books
IMAGE_TAG  := dev
IMAGE      := $(IMAGE_NAME):$(IMAGE_TAG)

.PHONY: build rebuild run images clean up down logs restart sqitch-deploy sqitch-revert up-build db-seed

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
	docker compose up

up-build:
	docker compose up --build

down:
	docker compose down

logs:
	docker compose logs -f app

restart:
	docker compose restart app

sqitch-deploy:
	docker compose exec app sqitch --chdir sqitch deploy dev

sqitch-revert:
	docker compose exec app sqitch --chdir sqitch revert dev

db-seed:
	docker compose exec app bash -lc 'psql "$$DATABASE_URL" -f db/seeds/dev.sql'
