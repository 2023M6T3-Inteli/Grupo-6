<table>
<tr>
<table>
<tr>
<td>
<a href= "dell.com/pt-br"><img src="../docs/img/img_docs/Dell_Logo.svg.png" alt="DELL" border="0" width="30%"></a>
</td>
<td><a href= "https://www.inteli.edu.br/"><img src="../docs/img/inteli-logo.png" alt="Inteli - Instituto de Tecnologia e Liderança" border="0" width="30%"></a>
</td>
</tr>
</table>


# DOCUMENTAÇÃO OFICIAL

<ul>
  <li>Nome do Projeto: Elaboração de aplicação para dispositivos móveis</li>
  <li>Nome do Parceiro: DELL</li>
  <li>Nome do Grupo: Cloudets</li>
  <li>Integrantes do grupo:</li>
  <ul>
  <li>Alan Rozensztajn Schipper</li>
  <li>Erik Freundt</li>
  <li>Felipe Silberberg</li>
  <li>Mateus Neves</li>
  <li>Priscila Falcão</li>
  <li>Sofia Pimazzoni</li>
  <li>Victor Carvalho</li>
  </ul>
<ul>

<font size="+12"><center>
Template do Documento do Projeto
Módulo 6 - Engenharia de Software
Solução de otimização de corte de bobinas de papel
</center></font>

>*Observação 1: A estrutura inicial deste documento é só um exemplo. O seu grupo deverá alterar esta estrutura de acordo com o que está sendo solicitado nos artefatos.*

>*Observação 2: O índice abaixo não precisa ser editado se você utilizar o Visual Studio Code com a extensão **Markdown All in One**. Essa extensão atualiza o índice automaticamente quando o arquivo é salvo.*

**Conteúdo**

- [Visão Geral do Projeto](#visão-geral-do-projeto)
  - [Parceiro de Negócios](#parceiro-de-negócios)
  - [Problema](#problema)
    - [Análise do Problema](#análise-do-problema)
    - [Matriz de avaliação de valor Oceano Azul](#matriz-de-avaliação-de-valor-oceano-azul)
    - [Proposta de Valor e Value Proposition Canvas](#proposta-de-valor-e-value-proposition-canvas)
    - [Matriz de Risco](#matriz-de-risco)
    - [Análise financeira do projeto](#análise-financeira-do-projeto)
  - [Mapeamento do processo](#mapeamento-do-processo)
  - [Descritivo da Solução](#descritivo-da-solução)
    - [Objetivos](#objetivos)
      - [Objetivos gerais](#objetivos-gerais)
      - [Objetivos específicos](#objetivos-específicos)
    - [Justificativa](#justificativa)
  - [Partes Interessadas](#partes-interessadas)
- [Requisitos](#requisitos)
  - [Requisitos Funcionais](#requisitos-funcionais)
  - [Requisitos não Funcionais](#requisitos-não-funcionais)
  - [Perfis de Usuários](#perfis-de-usuários)
  - [Casos de Uso](#casos-de-uso)
- [Arquitetura do Sistema](#arquitetura-do-sistema)
- [UX e UI Design](#ux-e-ui-design)
  - [Wireframes](#wireframes)
  - [Design de Interface - Guia de Estilos](#design-de-interface---guia-de-estilos)
- [Projeto de Banco de Dados](#projeto-de-banco-de-dados)
  - [Modelo Conceitual](#modelo-conceitual)
  - [Modelo Lógico](#modelo-lógico)
- [Testes de Software](#testes-de-software)
  - [Teste Unitário](#teste-unitário)
  - [Teste de Integração](#teste-de-integração)
  - [Teste de Regressão](#teste-de-regressão)
  - [Teste de Usabilidade](#teste-de-usabilidade)
  - [Teste de Funcionalidade](#teste-de-funcionalidade)
  - [Teste de API](#teste-de-api)
- [Documentação da API](#documentação-da-api)
- [Manual do Usuário](#manual-do-usuário)
- [Referências](#referências)
- [Apêndice](#apêndice)


# Visão Geral do Projeto
	


## Parceiro de Negócios

Breve descrição da instituição representada pelo parceiro de negócios, porte, onde atua, área de mercado que atua e posicionamento no mercado.


## Problema

Descrever o problema ou a oportunidade de negócio.


### Análise do Problema

Nesta seção, serão apresentados os problemas identificados e as necessidades do usuário, bem como uma avaliação da situação atual e as possíveis soluções para cada questão. Além disso, serão identificados os obstáculos e limitações do projeto, a fim de assegurar que todas as preocupações sejam abordadas antes do início da implementação. A Análise do Problema é essencial para garantir que a solução do software seja eficaz e atenda às necessidades dos usuários. É importante que seja realizada uma pesquisa exaustiva e que todas as perspectivas sejam consideradas para garantir que a solução seja bem-sucedida.


### Matriz de avaliação de valor Oceano Azul

A matriz de oceano azul é uma ferramenta de análise estratégica que ajuda a identificar oportunidades de mercado inexploradas e a criar novas demandas. Ela é usada para definir a posição competitiva de uma empresa em relação aos concorrentes e criar um plano de ação para diferenciar a oferta da empresa e criar um novo mercado. A matriz ajuda as empresas a encontrar novas oportunidades de crescimento, reduzir a concorrência e aumentar a lucratividade.

<img src="../docs/img/img_docs/oceano-azul.png" alt="Matriz de avaliação de valor Oceano Azul" border="0" width="100%" display="flex" justify-content="center">

Projetos (10): a solução desenvolvida pelo Inteli será a única do mercado a oferecer a oportunidade de participar de projetos, se comparado as plataformas já existentes no mercado.

Analytics (10): mesmo as concorrentes já oferecendo informações de controle (dashboards, dados etc), a solução desenvolvida pelo Inteli oferecerá ferramentas completas de Analytics, que auxiliarão os Product Owners e criadores de conteúdo a terem controle total de dados referentes a projetos e conteúdos, respectivamente.

Experiência do Usuário (10): o mercado oferece soluções que apresentam uma experiência decente como a Udemy. Porém, nenhuma plataforma já existente oferece uma experiência fluida e visualmente atrativa como a desenvolvida pelo Inteli.

Produtividade (10): a solução desenvolvida pelo Inteli proporciona uma navegação limpa, bem como conteúdos de qualidade para o usuário. Ademais, estes atributos, juntamente com a oportunidade de projetos, acarretam em uma maior produtividade por parte do usuário.

Oportunidades (10): na aplicação desenvolvida pelo Inteli, além de aprender através de conteúdos (podcasts, artigos, vídeos etc), os usuários também poderão aplicar o conhecimento adquirido em projetos reais, tendo a oportunidade de aumentar se networking e reputação na empresa.

Personalização (10): algumas soluções existentes no mercado como o site dev.to oferecem uma pequena personalização à experiência do usuário. Todavia, a solução desenvolvida pelo Inteli proporciona tanto conteúdos como projetos baseados na atividade do usuário. Dessa forma, haverá uma otimização de tempo na utilização da plataforma, além do aumento da produtividade e satisfação do cliente.

Receita (0): a plataforma desenvolvida pelo Inteli não terá nenhuma forma de ganhar dinheiro, uma vez que seu obejtivo está ligado, exclusivamente, ao aprendizado e aumento do engajamento de seus funcionários.

IA (10): a solução desenvolvida pelo Inteli contará com a atuação de uma Inteligência Artificial de qualidade no que tange a personalização da experiência do funcionário, analisando seu comportamento enquanto usuário e oferecendo conteúdos e projetos de acordo com seus interesses. Tal tecnologia pode ser encontrada em outras soluções, mas com qualidade inferior. 

### Proposta de Valor e Value Proposition Canvas

Value Proposition Canvas é um template de negócios que ajuda a entender o valor da sua solução para a empresa, englobando seus pontos fortes e principalmente, como esses ajudam a resolver dores do cliente. É possível visualizar a proposta de valor na imagem a seguir: 

<img src="../docs/img/img_docs/value-proposition.png" alt="Value Proposition Canvas" border="0" width="100%" display="flex" justify-content="center">


### Matriz de Risco
Também chamada de matriz de probabilidade e impacto, a matriz mapeia os riscos do projeto, sejam eles tanto riscos de ameaças quanto de oportunidades. Por ser uma ferramenta útil para gerenciar os riscos operacionais existentes em um projeto, foi elaborado uma Matriz de Riscos com base na proposta de solução elaborada pelo time de desenvolvimento, que pode ser visualizada na Figura x.


<img src="../docs/img/img_docs/matriz%20de%20risco.png" alt="Matriz de risco" border="0" width="100%" display="flex" justify-content="center">


### Análise financeira do projeto

 Para manter o site em funcionamento e fornecer as ferramentas necessárias, a empresa terá alguns custos contínuos, como hospedagem, desenvolvimento, suporte técnico, atualização e manutenção. Embora o site não seja uma fonte direta de lucro para a Dell, ele é visto como uma despesa operacional para aprimorar a equipe de funcionários e melhorar a eficiência e a produtividade da empresa. É importante investir nesses custos para garantir que o site esteja funcionando corretamente e fornecendo novas ferramentas e recursos aos funcionários.



## Mapeamento do processo

Apresentar a modelagem do processo "to be", representando em alto nível o fluxo de trabalho a ser realizado dentro da solução.


## Descritivo da Solução

Descrição da solução a ser desenvolvida (o que é, quais principais funcionalidades, como usar) . Caso ainda não esteja definida a solução na Sprint 1, o faça assim que possível.


### Objetivos

Descrever o objetivo geral e os objetivos específicos.


#### Objetivos gerais



#### Objetivos específicos



### Justificativa

Descrever o tipo de arquitetura escolhida, sua justificativa, como deverá ser utilizada e quais os benefícios que ela proporciona.


## Partes Interessadas 

Dell Technologies: gerar entreteinimento fora do trabalho para seus funcionários a partir do MVP entregue. A empresa deve fornecer suporte por meio de materiais e documentos que explicitem os problemas, as necessidades e as expectativas da interessada com o projeto. Além disso, é esperado que a Dell consiga acompanhar as entregas do projeto a cada sprint, para que possa dar feedbacks aos alunos com relação ao desenvolvimento que está sendo feito, para que os alunos sempre tenham a oportunidade de melhorar a entrega.
	
Instituto de Tecnologia e Liderança (INTELI): ter a primeira experiência de continuar um projeto real com a mesma empresa parceira e ver como seus alunos vão ter evoluido. Além disso, espera-se que o orientador possa mediar o contato com a empresa, para que os alunos estejam sempre atualizados sobre as expectativas do projeto, já que isso contriubi para uma entrega de melhor qualidade.
	
Alunos responsáveis pelo projeto: interesse em aprender novos conteúdos focados em mobile, que é muito pensado atualmente ao desenvolver uma aplicação, além de se aprofundar mais em Cloud Computing, tópico que está bem requisitado ultimamente. Ademais, os alunos terão a experiência de continuar um projeto passado feito com uma empresa parceira, situação que muitas vezes acontece no mundo coorporativo.


# Requisitos

Esta seção é importante porque permite que os desenvolvedores entendam claramente o que é esperado do software e quais serão as restrições e desafios enfrentados durante o desenvolvimento. Além disso, permite que os usuários finais saibam se o software atende às suas expectativas e se está adequado ao seu ambiente de trabalho.

A seção de requisitos do sistema é atualizada constantemente durante o ciclo de desenvolvimento do software, garantindo que todas as necessidades e especificações estejam sempre atualizadas.


## Requisitos Funcionais
Sabendo que se define por “Requisitos Funcionais“ aqueles que incluem informações sobre as funcionalidades esperadas do software, além de as restrições e limitações do sistema. São compostos por duas partes: função (que se refere ao que o sistema faz) e comportamento (que refere-se como o sistema faz isso) (VISURE, 2023). Dessa forma, viu-se a necessidade de elencar esses, de acordo com a solução.

01 - Gamificação: A plataforma deve incluir um sistema de recompensas, como badges e rankings, para incentivar o engajamento dos usuários. <br>
02 - Compartilhamento de conteúdo: Os usuários devem ser capazes de compartilhar facilmente conteúdos (projetos e documentários) com colegas, como, por exemplo, projetos interessantes.<br>
03 - Relatórios e análises: A plataforma deve oferecer ferramentas para gerar relatórios e análises sobre o uso, engajamento e eficácia dos projetos.<br>
04 - Autenticação de usuário: A plataforma deve permitir que os usuários se autentiquem usando suas credenciais corporativas, como o login com email da DELL.<br>
05 - Filtro de conteúdo: A plataforma deve oferecer opções de filtro para ajudar os usuários a encontrar projetos e documentários relevantes, como por exemplo um projeto com uma linguagem especifica como REACT, Javascript.<br>
06 - Recomendações personalizadas de conteúdo: A plataforma deve fornecer recomendações personalizadas com base no histórico e nas preferências de cada usuário.<br>
07 - Importação/exportação de dados: A plataforma deve permitir que os usuários importem e exportem dados, como conteúdo de projetos e históricos de projetos participados.<br>
08 - Gerenciamento de moderadores: A plataforma deve permitir que os moderadores aprovem, editem ou excluam conteúdos, bem como gerenciem usuários que violem as políticas da plataforma.<br>
09 - Avaliação e feedback: Os usuários devem ser poder, avaliar e dar feedback sobre os projetos que participaram na plataforma.<br>
10 - Notificações: A plataforma deve mandar notificações para os usuários sobre novos conteúdos, projetos e interações relevantes.<br>
11 - Ter réplicas em diversas AZ's em cloud: a fim de garantir a disponibilidade da aplicação, essa deve estar alocada em diferentes zonas da AWS.<br>
12 - Feedbacks instantâneos: para cada interação do usuário com a plataforma, essa deverá conter um feedback durante o uso. <br>
13 - Os conteúdos devem conter tags: os conteúdo publicados na plataforma devem ser separados pr tags de acordo com o tema abordado, de forma que seja possíel linkar esses com os projetos de mesmo tema.<br>
14 - Sistema de match: a plataforma deve conter inteligência artificial embutida para que ocorra "match" entre um usuário e um projeto, baseado nos conteúdos consumidos por este usuário.<br>
15 - Perfil: a aplicação deverá ter a opção de acessar o perfil do usuário, onde será possível visualizar suas soft e hard skills, além de projetos que esse colaborador já tenha participado.<br>
16 - Barra de pesquisa: a aplicação deve conter uma barra de pesquisa para que seja possível pesquisar por conteúdos específicos, para além dos que foram recomendados.<br>
17 - Submissão em um projeto: a plataforma deve permitir que o usuário consiga se submeter em um projeto, seja ele recomendado ou não.<br>
18 - Modo escuro: a aplicação poderá ter modo escuro como opção para os usuários. <br>
19 - <br> 
20 - 


## Requisitos não Funcionais

Descreve os recursos necessários para sua execução, os requisitos de segurança e privacidade.

01 - Escalabilidade : A aplicação deve ser capaz de lidar com muitos usuários simultâneos sem afetar o seu desempenho.<br>
02 - Segurança : A plataforma deve garantir a segurança das informações dos usuários e dos conteúdos armazenados, conforme as práticas de segurança e privacidade.<br>
03 - Disponibilidade : A plataforma deve estar disponível e acessível aos usuários em qualquer momento, garantindo um tempo mínimo de inatividade.<br>
04 - Integraçao : A plataforma deve ser capaz de se integrar com outros sistemas internos da empresa, como sistemas de gerenciamento de projetos, intranets e aplicativos de comunicação, garantindo assim uma infraestrutura melhor.<br>
05 - Usabilidade : A interface da plataforma deve ser intuitiva, facil de usar e acessível em dispositivos móveis, como smartphones e tablets, de diversos formatos, garantindo que qualquer usuario consiga utilizar a plataforma.<br>
06 - Desempenho : A plataforma deve ter um tempo de resposta rápida e com baixa latência para proporcionar uma experiência de usuário agradável.<br>
07 - Facil manutenção: A plataforma deve ser projetada seguindo boas práticas de desenvolvimento de software, facilitando a manutenção e possíveis futuras atualizações.<br>
08 - Compatibilidade: A plataforma deve ser compatível com os principais sistemas operacionais móveis, como Android e iOS, e funcionar corretamente em todos os tipos de navegadores web.<br>
09 - Localização: A plataforma deve oferecer suporte ao inglês e múltiplos idiomas, atendendo as necessidades de uma audiência global.<br>
10 - Sustentabilidade: A plataforma deve completar todas as tarefas para qual foi proposta, de forma  correta e consistente com o contexto em que foi solicitado.

## Perfis de Usuários 

A seção de perfil de usuário da documentação de software é responsável por descrever instruções detalhadas sobre o uso de cada opção e recursos relacionados ao perfil do usuário, garantindo uma experiência fácil e intuitiva para o usuário final.


## Casos de Uso

A seção de casos de uso da documentação de software é uma parte crucial que descreve as funcionalidades 
do software e como elas serão utilizadas pelos usuários. Aqui, são listados todos os cenários possíveis de uso do software, incluindo as ações que o usuário pode realizar, as interações com o sistema e os resultados esperados. Os casos de uso são descritos em detalhes, incluindo a descrição do objetivo da funcionalidade, as entradas de dados, as ações do usuário e os resultados esperados. Além disso, também são incluídos os critérios de aceitação, que são os padrões que o software precisa atender para ser considerado como funcionando corretamente.

1 - Eu, como funcionário da Dell, quero ter conteúdos recomendados de acordo com os meus interesses, com o intuito de otimizar meu tempo.
2 - Eu, como Product Owner, quero ter acesso à dashboards de dados, a fim de medir a produtividade de meus funcionários e o andamento dos projetos.

<center>
[template-documento3](../img/template-documento3.jpg)

Exemplo de Diagrama de Casos de Uso
</center>


# Arquitetura do Sistema

Atualizar a cada revisão/atualização da arquitetura, mantendo todas as 3 versões no documento..


<center>
[template-documento4](../img/template-documento4.jpg)

Exemplo de Diagrama de Arquitetura
</center>


# UX e UI Design

Aborda o design e a funcionalidade da aplicação ou sistema em questão. Ela fornece informações sobre como o software é projetado para ser fácil de usar e intuitivo para os usuários. Nesta seção, deve ser possível encontrar descrições detalhadas sobre as principais características e recursos da interface do usuário, como botões, menus, ícones e outros elementos que são utilizados para facilitar a interação do usuário com o software. Além disso, são fornecidos exemplos de como as funcionalidades do software são acessadas e usadas pelos usuários, incluindo informações sobre os passos necessários para realizar tarefas específicas. Esta seção também aborda as principais preocupações de UX, como acessibilidade, usabilidade, consistência e simplicidade. São apresentados exemplos de como o software é projetado para atender às necessidades dos usuáriaos com diferentes tipos de habilidades e recursos.


## Wireframes

Telas de baixa fidelidade das áreas do usuário, conectados, demonstrando a diagramação e o fluxo de navegação.

Exemplos: tela da home, tela de login, etc. Em cada tela colocar: cabeçalho, rodapé, barra lateral, área de conteúdo.

Aqui você deve colocar o link para o wireframe ou colocar as imagens geradas na sequência correta do fluxo de navegação.


## Design de Interface - Guia de Estilos
Refere-se ao design visual, cores, tipografia, imagens, logotipos, ou seja, os elementos visuais que compõem o produto.
Aqui você deve colocar o link para seu documento de guia de estilos.


# Projeto de Banco de Dados

Documento contendo diagrama de entidades e relacionamentos do banco de dados


## Modelo Conceitual

O modelo conceitual deve garantir uma conexão com a realidade. Os 4 tipos de conexões com a realidade são:
conceitos
atributos
identificações
associações
O Modelo Entidade-Relacionamento - MER
entidades e tipos de entidades
atributos e tipos de atributos
relacionamentos e tipos de relacionamentos


## Modelo Lógico 

O modelo lógico de banco de dados é uma representação abstrata e simplificada dos dados armazenados no sistema. É utilizado para entender como os dados são relacionados e para garantir a integridade e consistência dos dados armazenados. Incluir  uma descrição detalhada das tabelas, campos e relações presentes no modelo lógico de banco de dados. Também serão apresentadas as regras de negócio e as restrições aplicadas aos dados para garantir a integridade e a consistência dos dados armazenados.


# Testes de Software



## Teste Unitário

Link ou imagem da tabela com dados organizados dos testes realizados.


## Teste de Integração

Link ou imagem da tabela com dados organizados dos testes realizados.


## Teste de Regressão

Link ou imagem da tabela com dados organizados dos testes realizados.


## Teste de Usabilidade 

Link ou imagem da tabela com dados organizados dos testes realizados.


## Teste de Funcionalidade 

Link ou imagem da tabela com dados organizados dos testes realizados.


## Teste de API 

Link ou imagem da tabela com dados organizados dos testes realizados.


# Documentação da API

Apresentar a documentação no formato Swagger ou aplicação equivalente com todas as requisições dos endpoints desenvolvidos e funcionando.


# Manual do Usuário

Fornecer instruções detalhadas sobre como usar o software corretamente. É uma ferramenta valiosa para ajudar os usuários a compreender as funções do software, instalar o software, configurar as preferências do usuário, entre outras tarefas. O manual do usuário geralmente inclui screenshots, animações e outros recursos visuais para tornar a experiência do usuário mais clara e intuitiva. Além disso, ele também pode incluir informações sobre solução de problemas, dicas e truques, bem como informações de contato para suporte técnico. É importante que a seção de manual do usuário seja atualizada frequentemente para garantir que os usuários tenham acesso à informação mais recente e precisa sobre o software.


# Referências

Toda referência citada no texto deverá constar nessa seção, utilizando o padrão de normalização da ABNT - ABNT NBR 10520). As citações devem ser confiáveis e relevantes para o trabalho. São imprescindíveis as citações dos sites de download das ferramentas utilizadas, bem como a citação de algum objeto, música, textura ou outros que não tenham sido produzidos pelo grupo, mas utilizados (mesmo no caso de licenças gratuitas, royalty free ou similares).
Sugerimos o uso do sistema autor-data para citações.


# Apêndice 

Os apêndices representam informações adicionais que não caberiam no documento exposto acima, mas que são importantes por alguma razão específica do projeto. 
