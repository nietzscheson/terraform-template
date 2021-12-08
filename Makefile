.PHONY:
init: down up ps
down:
	docker-compose down --volumes --remove-orphans
pull:
	docker-compose pull
build:
	docker-compose build
up: pull build
	docker-compose up -d
ps:
	docker-compose ps
packer.validate:
	docker-compose run --rm infra packer validate packer.pkr.hcl
packer.build:
	docker-compose run --rm infra packer build packer.pkr.hcl
terraform.init:
	docker-compose run --rm infra terraform init
terraform.validate: terraform.init
	docker-compose run --rm infra terraform validate
terraform.plan: terraform.validate
	docker-compose run --rm infra terraform plan
terraform.apply: terraform.plan
	docker-compose run --rm infra terraform apply
ssh.aerio:
	docker-compose run --rm infra ssh aerio
ssh.aerio_dev:
	docker-compose run --rm infra ssh aerio_dev
ssh.keygen:
	docker-compose run --rm infra ssh aerio 'ssh-keygen -b 2048 -t rsa -f /home/ubuntu/.ssh/id_rsa -q -N ""'
ssh.keygen_dev:
	docker-compose run --rm infra ssh aerio_dev 'ssh-keygen -b 2048 -t rsa -f /home/ubuntu/.ssh/id_rsa -q -N ""'
