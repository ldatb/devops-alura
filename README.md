# Curso DevOps Alura
Repositório das aulas da formação DevOps da Alura

## 1. Infra as a Code

### Terraform
1. Inicie o terraform: `terraform init`
2. Crie o plano: `terraform plan`
   1. Você pode salvar o plano com `terraform plan -out <nome>`
3. Aplique seu plano: `terraform apply`

### Ansible
`ansible-playbook <playbook> -u <username> --private-key <key-file> -i <hosts-file>`


## 2. Docer

### Comandos uteis

- Imagens: `docker images` para ver todas baixdas, `docker inspect <image-id>` para ver uma imagem específica, `docker pull ...` para baixar, e `docker rmi ...` para deletar.
- Criar imagens: `docker create -t <usuario/imagem>[:tag] <diretorio>`
- Containers: `docker ps` para ver os containers rodando e `docker ps -a` para ver todos os containers. `docker inspect <container-id>` para ver um container específico. `docker rm <container-id>` para deletar um container.
- Básicos: `docker run ...` `docker stop ...` `docker pause ...` `docker unpause ...`
- Rodar container em modo detached `docker run -d ...`
- Acessar o terminal de um container: `docker exec -it <container-id> bash` ou `docker run -it <image> bash`
- Parar todos os containers: `docker stop $(docker ps -q)`
- Rodar container mapeando portas: `docker run -P ...` para mapear automaticamente, ou `docker run -p <porta-local>:<porta-container> ...` para mapear manualmente
- Visulizar mapeamentos de porta: `docker port ...`
- 
