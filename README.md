<table>
<tr>
<td>
<a href= "https://www.dell.com/pt-br"><img src="docs/img/img_docs/Dell_Logo.svg.png" alt="Dell" border="0" width="20%"></a>
</td>
<td><a href= "https://www.inteli.edu.br/"><img src="https://github.com/2023M6T3-Inteli/Grupo-6/blob/main/docs/img/inteli-logo.png" alt="Inteli - Instituto de Tecnologia e Liderança" border="0" width="30%"></a>
</td>
</tr>
</table>

# Desenvolvimento de serviços em cloud computing

## Cumulonimbus

### Integrantes: 
<lu>
<li><a href="https://www.linkedin.com/in/alan-rozensztajn-schipper-0563701ba/">Alan Schipper</a>
<li><a href="https://www.linkedin.com/in/felipesilberberg/">Felipe Silberberg</a>
<li><a href="https://www.linkedin.com/in/erikfreundt/">Erik Freundt</a>
<li><a href="https://www.linkedin.com/in/mateus-neves-3b767123b/">Mateus Neves</a>
<li><a href="https://www.linkedin.com/in/priscila-falc%C3%A3o-3435a1244/">Priscila Falcão</a>
  <li><a href="https://www.linkedin.com/in/sofia-moreiras-pimazzoni/">Sofia Pimazzoni</a>
<li><a href="https://www.linkedin.com/in/victor-severiano-de-carvalho-b57a05237/">Victor Carvalho</a>. </lu>

## 💻 Projeto
<br><br>
O projeto trata-se de uma aplicação mobile, desenvolvida para sistema embarcado (executa localmente através de um arquivo com extensão .apk), com AI de sistema de recomendação, tendo integrado serviços da AWS no back-end e mensageria com o Kafka e o protocolo MQTT. 
<br>
Pensado para o engajamento dos colaboradores da Dell em compartilhamento de informações e conhecimento, além da participação de projetos internos na empresa.
<br><br>
<p align="center">
<img src="docs/img/img_docs/cloudets.png" alt="Cumulonimbus" border="0" width="50%">
<br>
<br>
</p>

## 💾 Estrutura de pastas
|📂[codigo](/codigo)<br>
&emsp;|📂[AI](/codigo/AI)<br>
      &emsp; &emsp;|📂[projeto](/codigo/AI/projeto)<br>
      &emsp; &emsp; &emsp;|📂[movie-lens-small-latest-dataset](codigo/AI/projeto/movie-lens-small-latest-dataset)<br>
&emsp;|📂[backend](/codigo/backend)<br>
 &emsp; &emsp;|📂[src](/codigo/backend/src)<br>
 &emsp; &emsp; &emsp;|📂[badge](/codigo/backend/src/badge)<br>
 &emsp; &emsp; &emsp;|📂[login](/codigo/backend/src/login)<br>
 &emsp; &emsp; &emsp;|📂[post](/codigo/backend/src/post)<br>
 &emsp; &emsp; &emsp;|📂[prisma](/codigo/backend/src/prisma)<br>
 &emsp; &emsp; &emsp;|📂[project](/codigo/backend/src/project)<br>
 &emsp; &emsp; &emsp;|📂[user](/codigo/backend/src/user)<br>
  &emsp;|📂 [frontend](/codigo/frontend)<br>
  &emsp; &emsp;|📂[src](/codigo/frontend/src)<br>
<br>
|📂 [docs](/docs)<br>
  &emsp;|📂[img](/docs/img)<br>
  &emsp; &emsp;|📂[src](/docs/img/img_docs)<br>
|📄[readme.md](/README.md)<br>


## 🛠 Instalação

1 - Clone do GitHub atual
<br>
2 - Para rodar localmente o projeto, é necessário:
&emsp 2.1 - Rodar no prompt de comando dentro da pasta ```backend/src o comando``` ```npm run start:dev``` ;
&emsp 2.2 - Fazer dowload do arquivo .apk dentro da pasta ```codigo```;
<br>
3 - O projeto já está pronto para teste local.
<br>

## 💻 Configuração para Aplicação

1 - Criação de VPC e subredes na AWS
<br>
2 - Criação de EC2 na AWS
<br>
3 - Criação de LoadBalancer na AWS
<br>
4 - Criação de RDS na AWS
<br>
5 - Configuração de variáveis de ambiente para a ligação com os serviços AWS


## 📄 Histórico de lançamentos

A cada atualização os detalhes devem ser lançados aqui.

* Sprint 1 - 10/02/2023
    * Wireframe
    * Arquitetura do sistema V1
    * Matriz SWOT
    * Value Proposition Canvas 
    * Diagrama de sequência do fluxo de dados
    * 5 Forças de Potter
    * Matriz de risco
    * Casos de uso
    * Especificação dos requisitos
* Sprint 2 - 24/02/2023
    * Desenvolvimento GitFlow
    * Definição da arquitetura de pastas
    * Produção de VPCs e subredes
    * Produção de instâncias na EC2
    * Produção de buckets no S3
    * Modelo lógico de dados
    * Modelo conceitual de dados
    * Endpoints TDD
    * Arquitetura da solução V2
    * Adaptação do wireframe para os requistos do cliente
* Sprint 3 - 10/03/2023
    * Back-end com enpoints funcionais
    * Documentação API
    * Front-end em React
    * Arquitetura da solução V3
    * Produção de banco de dados no RDS
* Sprint 4 - 24/03/2023
    * Mudança de ORM (TypeORM)
    * Parte da integração
* Sprint 5 - 07/04/2023
    * Finalização da integração
    * Ajuste de erros
    * Manual do usuário

## 🎓 Referências

Aqui estão as referências usadas no projeto.

1. <https://github.com/iuricode/readme-template>
2. <https://github.com/gabrieldejesus/readme-model>
3. <https://creativecommons.org/share-your-work/>
4. <https://freesound.org/>
5. Músicas por: <a href="https://freesound.org/people/DaveJf/sounds/616544/"> DaveJf </a> e <a href="https://freesound.org/people/DRFX/sounds/338986/"> DRFX </a> ambas com Licença CC 0.

