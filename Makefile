AWS_REGION      = us-east-1
BUILD_UID       = $(shell id -u)
BUILD_GID       = $(shell id -g)
BUILD_USERNAME  = $(shell whoami)

apply:
	@terraform init
	@export AWS_DEFAULT_REGION="$(AWS_REGION)" && \
	terraform plan && terraform apply -auto-approve

destroy:
	@export AWS_DEFAULT_REGION="$(AWS_REGION)" && \
	terraform destroy -auto-approve

precommit:
	@echo 'USERNAME:x:USERID:GROUPID::/app:/sbin/nologin' > passwd
	@sed -i 's/USERNAME/'$(BUILD_USERNAME)'/g' passwd
	@sed -i 's/USERID/'$(BUILD_UID)'/g' passwd 
	@sed -i 's/GROUPID/'$(BUILD_GID)'/g' passwd
	docker run --rm --network host -u $(BUILD_UID):$(BUILD_GID) -v $(PWD)/passwd:/etc/passwd:ro -v $(PWD):/app punkerside/container-precommit:latest