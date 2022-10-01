BUILD_UID  = $(shell id -u)
BUILD_GID  = $(shell id -g)
BUILD_USER = $(shell whoami)

precommit:
	@echo '${BUILD_USER}:x:${BUILD_UID}:${BUILD_GID}::/app:/sbin/nologin' > passwd
	@docker run --rm --network host -u $(BUILD_UID):$(BUILD_GID) -v $(PWD)/passwd:/etc/passwd:ro -v $(PWD):/app punkerside/container-precommit:latest