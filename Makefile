CONTAINER_NAME = "deface"

build:
	docker build --tag $(CONTAINER_NAME) .

run:
	docker run -it \
		--privileged \
		--runtime=nvidia \
		--env=DISPLAY=$(DISPLAY) \
		--volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
		--env="QT_X11_NO_MITSHM=1" \
		--rm \
		-v "/$(pwd)/video:/video" \
		-v /etc/group:/etc/group:ro \
		-v /etc/passwd:/etc/passwd:ro \
		-v /etc/localtime:/etc/localtime:ro \
		-v /media:/media \
		-v /dev:/dev \
		--net host \
		$(CONTAINER_NAME)

deface: run
	deface $(INPUT)

stop:
	docker stop $(CONTAINER_NAME)

enter:
	docker exec -it $(CONTAINER_NAME) /bin/bash
