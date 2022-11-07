# Curso DevOps Alura
Repositório das aulas da formação DevOps da Alura

## 1. Infra as a Code

### Terraform
https://developer.hashicorp.com/terraform/docs

1. Inicie o terraform: `terraform init`
2. Crie o plano: `terraform plan`
   1. Você pode salvar o plano com `terraform plan -out <nome>`
3. Aplique seu plano: `terraform apply`

### Ansible
https://docs.ansible.com/

`ansible-playbook <playbook> -u <username> --private-key <key-file> -i <hosts-file>`

## 2. Docker
https://docs.docker.com/

**Imagens**
- Imagens: `docker images` para ver todas baixadas, `docker inspect <image-id>` para ver uma imagem específica, `docker pull ...` para baixar, e `docker rmi ...` para deletar.
- Criar imagens: `docker create -t <usuario/imagem>[:tag] <diretorio>`

**Básico de containers**
- Containers: `docker ps` para ver os containers rodando e `docker ps -a` para ver todos os containers. `docker inspect <container-id>` para ver um container específico. `docker rm <container-id>` para deletar um container.
- Básicos: `docker run ...` `docker stop ...` `docker pause ...` `docker unpause ...`
- Rodar container em modo detached `docker run -d ...`
- Acessar o terminal de um container: `docker exec -it <container-id> bash` ou `docker run -it <image> bash`
- Parar todos os containers: `docker stop $(docker ps -q)`
- Criar um container definindo o nome: `docker run --name <name> ...`
- Criar um container definindo a rede: `docker run --network <network-name> ...`

**Portas**
- Rodar container mapeando portas: `docker run -P ...` para mapear automaticamente, ou `docker run -p <porta-local>:<porta-container> ...` para mapear manualmente
- Visulizar mapeamentos de porta: `docker port ...`

**Bind Mount**
- Bind mount (método deprecated): `docker run -v <local-mount>:<container-mount> ...`
- BInd mount (novo método): `sudo docker run --mount type=bind,source=<local-mount>,target=<container-mount> ...`

**Volumes**
Volumes são mais recomendados do que bind mounts.
- Volumes: `docker volume ls` para ver os volumes. `docker volume create ...` para criar um volume
- Criar container com volume: `docker run -v <volume-name>:<container-mount> ...` ou (método mais atual) `docker run --mount source=<volume-name>,target=<container-mount> ...`

**Network**
- Redes: `docker network ls`. Para criar uma rede: `docker network create ...`

## 3. CI: Testes automatizados e Github Actions
https://docs.github.com/pt/actions

