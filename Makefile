CONTAINER_NAME = "deface"

build:
	docker build --tag $(CONTAINER_NAME) .

run:
	docker run -it \
		--name $(CONTAINER_NAME) \
		--privileged \
		--gpus=all \
		--rm \
		-v "./video:/video" \
		$(CONTAINER_NAME)

stop:
	docker stop $(CONTAINER_NAME)

enter:
	docker exec -it $(CONTAINER_NAME) /bin/bash
