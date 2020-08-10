AWS_REGION = us-east-1

apply:
	@terraform init
	@export AWS_DEFAULT_REGION="$(AWS_REGION)" && \
	terraform plan && terraform apply -auto-approve

destroy:
	@export AWS_DEFAULT_REGION="$(AWS_REGION)" && \
	terraform destroy -auto-approve