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

- [DOCUMENTAÇÃO OFICIAL](#documentação-oficial)
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
  - [Partes Interessadas](#partes-interessadas)
- [Requisitos](#requisitos)
  - [Requisitos Funcionais](#requisitos-funcionais)
  - [Requisitos não Funcionais](#requisitos-não-funcionais)
  - [Perfis de Usuários](#perfis-de-usuários)
  - [Casos de Uso](#casos-de-uso)
  - [Matriz de rastreabilidade](#matriz-de-rastreabilidade)
- [Arquitetura do Sistema](#arquitetura-do-sistema)
  - [Versão 1 - Arquitetura do sistema](#versão-1---arquitetura-do-sistema)
  - [Versão 2 - Arquitetura do sistema](#versão-2---arquitetura-do-sistema)
  - [Arquitetura de mensageiria](#arquitetura-de-mensageiria)
  - [Benefícios e desvantagens da arquitetura](#benefícios-e-desvantagens-da-arquitetura)
  - [Diagrama de sequência do fluxo de dados](#diagrama-de-sequência-do-fluxo-de-dados)
  - [Versão 3 - Arquitetura do sistema](#versão-3---arquitetura-do-sistema)
  - [ETL (Extração, Transformação e Carregamento)](#etl-extração-transformação-e-carregamento)
- [UX e UI Design](#ux-e-ui-design)
  - [Benchmarking e Revisão de Design System](#benchmarking-e-revisão-de-design-system)
  - [Wireframes](#wireframes)
  - [Design de Interface - Guia de Estilos](#design-de-interface---guia-de-estilos)
- [Projeto de Banco de Dados](#projeto-de-banco-de-dados)
  - [Modelos Lógico e Conceitual](#modelos-lógico-e-conceitual)
- [Testes de Software](#testes-de-software)
  - [Teste Unitário e Teste de Integração](#teste-unitário-e-teste-de-integração)
  - [Teste de Carga](#teste-de-carga)
  - [Teste de Usabilidade](#teste-de-usabilidade)
  - [Teste de Funcionalidade](#teste-de-funcionalidade)
  - [Teste de API](#teste-de-api)
- [Documentação da API](#documentação-da-api)
- [Manual do Usuário](#manual-do-usuário)
- [Referências](#referências)
- [Apêndice](#apêndice)


# Visão Geral do Projeto
	


## Parceiro de Negócios

Fundada em 1984, a Dell Technologies é uma renomada empresa que atua no ramo tecnológico através da produção e comercialização de produtos e serviços, estando presente em mais de 180 países ao redor do mundo.

Entre os principais produtos/serviços que a empresa oferece, é possível citar servidores, dispositivos de armazenamento, periféricos, softwares e computadores, sendo este a principal fonte de receita da companhia.

Os principais clientes da Dell são empresas, organizações governamentais e instituições de ensino, bem como consumidores finais. Além disso, a empresa atende a uma ampla variedade de setores, incluindo serviços financeiros, saúde, manufatura, varejo, telecomunicações e serviços públicos. Apesar de ser forte no mercado de varejo, sua principal atuação está no segmento corporativo, sendo líder nesta área.

Em junho de 2022, a companhia apresentou resultados financeiros recorde para o primeiro trimestre do ano fiscal de 2023, ao registrar receita de US$ 26,1 bilhões, o que representa aumento de 16% em relação ao período anterior. Ademais, a empresa gerou resultado operacional recorde para primeiro trimestre de US$ 1,6 bilhão, um aumento de 57%, e recorde de resultado operacional non-GAAP de US$ 2,1 bilhões, um aumento de 21%. O lucro líquido de operações contínuas foi de US$ 1,1 bilhão, aumento de 62%, e o lucro líquido non-GAAP foi de 1,4 bilhão, um aumento de 36%. Os dois foram impulsionados pelo crescimento do resultado operacional e pelas despesas de juros mais baixas devido a saldos de dívida reduzidos. Lucros diluídos por ação foram de US$ 1,37, aumento de 63%, e lucros diluídos por ação non-GAAP foi de US$ 1,84, aumento de 36%.

Com base no resultado financeiro analisado, conclui-se que, mesmo atuando em um mercado competitivo e instável (por estar em constante mudança), a empresa se sobressai aos demais devido aos investimentos em inovação e produtos/serviços de qualidade, além de apresentar gestão eficiente e competente. Dessa maneira, constrói-se um cenário favorável ao desenvolvimento do projeto.


## Problema

A Dell, sendo uma empresa de grande porte, vê a necessidade de criar oportunidades de desenvolvimento e crescimento para os seus colaboradores,assim, tornando-se crucial encontrar novos meios de engajar e desenvolver o crescimento de seus funcionários. Isso porque, com o aumento da competitividade no mercado, as empresas precisam estar constantemente inovando e aprimorando suas práticas e processos. E para que isso aconteça, é necessário que os funcionários estejam engajados e motivados a contribuir com suas ideias e esforços.
<br>
Além disso, o desenvolvimento dos funcionários é importante para garantir que a empresa possa contar com profissionais cada vez mais qualificados e capazes de enfrentar os desafios que surgem no dia a dia do trabalho.

### Análise do Problema
Neste sentido, nota-se a demanda por uma solução que gere entretenimento e ainda reflita em um uso fluído e natural, a fim de manter o usuário engajado e ainda conseguir desenvolver novas habilidades. Cabe destacar a importância de ser uma aplicação que se assemelhe a lazer, uma vez que é direcionada para momentos fora do horário de trabalho. Assim, sugere-se uma aplicação que esteja de fácil alcance, como uma aplicação mobile, com interface similar a uma rede social popular.


### Matriz de avaliação de valor Oceano Azul

A matriz de oceano azul é uma ferramenta de análise estratégica que ajuda a identificar oportunidades de mercado inexploradas e a criar novas demandas. Ela é usada para definir a posição competitiva de uma empresa em relação aos concorrentes e criar um plano de ação para diferenciar a oferta da empresa e criar um novo mercado. A matriz ajuda as empresas a encontrar novas oportunidades de crescimento, reduzir a concorrência e aumentar a lucratividade.

<center> <h3> Gráfico 1 - Matriz Oceano Azul.</h3>  </center> 
<img src="../docs/img/img_docs/oceano-azul.png" alt="Matriz de avaliação de valor Oceano Azul" border="0" width="100%" display="flex" justify-content="center">
<center> Fonte: Elaborado pelo próprio autor (2023).</center>

<br>
<br>

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

<center> <h3> Figura 1 - Value Propostion Canva.</h3>  </center> 
<img src="../docs/img/img_docs/value-proposition.png" alt="Value Proposition Canvas" border="0" width="100%" display="flex" justify-content="center">
<center> Fonte: Elaborado pelo próprio autor (2023). </center>


### Matriz de Risco
Também chamada de matriz de probabilidade e impacto, a matriz mapeia os riscos do projeto, sejam eles tanto riscos de ameaças quanto de oportunidades. Por ser uma ferramenta útil para gerenciar os riscos operacionais existentes em um projeto, foi elaborado uma Matriz de Riscos com base na proposta de solução elaborada pelo time de desenvolvimento, que pode ser visualizada na Figura x.

<center> <h3> Figura 2 - Matriz de risco.</h3>  </center> 
<img src="../docs/img/img_docs/matriz%20de%20risco.png" alt="Matriz de risco" border="0" width="100%" display="flex" justify-content="center">
<center> Fonte: Elaborado pelo próprio autor (2023). </center>


### Análise financeira do projeto

 Para manter o site em funcionamento e fornecer as ferramentas necessárias, a empresa terá alguns custos contínuos, como hospedagem, desenvolvimento, suporte técnico, atualização e manutenção. Embora o site não seja uma fonte direta de lucro para a Dell, ele é visto como uma despesa operacional para aprimorar a equipe de funcionários e melhorar a eficiência e a produtividade da empresa. É importante investir nesses custos para garantir que o site esteja funcionando corretamente e fornecendo novas ferramentas e recursos aos funcionários.

<center> <h3> Tabela 2 - Análise financeira do projeto.</h3>  </center> 
<img src="../docs/img/img_docs/analise_financeira.png" alt="Análise financeira" border="0" width="100%" display="flex" justify-content="center">
<center> Fonte: Elaborado pelo próprio autor (2023). </center>


## Mapeamento do processo

O mapeamento do processo envolve práticas envolvidas no entendimento, análise e melhoria desses, de forma a estruturar a organização com base em processos ponta a ponta. Tem-se como objetivos principais documentar os processos, avaliar padrões e conformidade, treinar colaboradores,discutir e planejar mudanças e comunicar de forma padronizada. Dessa forma, viu-se a necessidade de criação do mapeamento do mesmo, conforme as figuras a seguir.

<center> <h3> Diagrama 1 - Processo 1: Criar publicação.</h3>  </center> 
<img src="../docs/img/img_docs/criar_pub.png" alt="Criar publicação" border="0" width="100%" display="flex" justify-content="center">
<center> Fonte: elaborado pelo próprio autor (2023).</center>
<br>
<center> <h3> Diagrama 2 - Processo 2: Denunciar publicação.</h3>  </center> 
<img src="../docs/img/img_docs/denunciar_pub.png" alt="Denunciar publicação" border="0" width="100%" display="flex" justify-content="center">
<center> Fonte: Elaborado pelo próprio autor (2023). </center>
<br>
<center> <h3> Diagrama  3 - Processo 3: criar projeto.</h3>  </center> 
<img src="../docs/img/img_docs/criar_projeto.png" alt="Criar projeto" border="0" width="100%" display="flex" justify-content="center">
<center> Fonte: Elaborado pelo próprio autor (2023). </center>
<br>
<center> <h3> Diagrama 4 - Processo 4: Inscrever em um projeto.</h3>  </center> 
<img src="../docs/img/img_docs/inscrever_projeto.png" alt="Inscrição em um projeto" border="0" width="100%" display="flex" justify-content="center">
<center> Fonte: Elaborado pelo próprio autor (2023). </center>
<br>
<center> <h3> Diagrama 5 - Processo 5: Gamificação</h3>  </center> 
<img src="../docs/img/img_docs/gamificacao.png" alt="Gamificação" border="0" width="100%" display="flex" justify-content="center">
<center> Fonte: Elaborado pelo próprio autor (2023). </center>

## Descritivo da Solução

Após a análise cuidadosa do problema em questão, constatou-se a necessidade de desenvolver uma solução que atendesse às demandas dos usuários de forma eficiente e personalizada. Dessa forma, sugeriu-se a criação de uma aplicação mobile, que seria integrada a um sistema em nuvem por meio dos serviços oferecidos pela AWS. A ideia principal seria que essa plataforma fosse semelhante a uma rede social, com recursos como um sistema de recomendação e a possibilidade de compartilhar e consumir diversos conteúdos, tanto personalizados quanto não personalizados para cada usuário.
<br>
<br>
Além disso, a solução proposta também contaria com um mecanismo de "match" de projetos, que seria integrado com a aplicação desenvolvida no módulo anterior (Aplicação web em nuvem - módulo 5). Dessa forma, os projetos criados pela plataforma seriam oferecidos de acordo com o conteúdo que o usuário consumisse. Isso permitiria que os usuários pudessem encontrar facilmente projetos de seu interesse e interagir com outras pessoas que tivessem interesses similares. Além disso, a plataforma também permitiria que os usuários interagissem entre si, por meio de comentários e likes em posts. Para incentivar o maior engajamento dos usuários, ainda seria incluído um sistema de gamificação, que permitiria o rankeamento dos usuários de acordo com sua participação e contribuição na plataforma.


## Objetivos

### Objetivos gerais
Como objetivo geral do projeto, é fundamental o engajamento dos funcionários na plataforma, para que estes possam desenvolver seus conhecimentos e habilidades de forma dinâmica e prazerosa, sendo um estímulo para o desenvolvimento pessoal e profissional. Espera-se que a solução desenvolvida seja percebida como um mecanismo de entretenimento e não apenas de aprendizado, de modo que os usuários se sintam motivados e incentivados a utilizar a plataforma e, consequentemente, aprimorar suas competências. Assim, a plataforma deverá ser atraente e envolvente, com um design amigável e uma interface intuitiva, de modo que o usuário se sinta à vontade para explorar todas as funcionalidades oferecidas.
<br>

### Objetivos específicos
Com uma análise mais detalhada, a solução proposta tem como objetivo específico incentivar o desenvolvimento de novas habilidades nos funcionários, além da criação de novas comunidades. Para isso, espera-se envolver os funcionários em um ambiente de lazer e aprendizado, de forma que o aprendizado de algo novo não se torne um fardo, e ainda permita o compartilhamento de conhecimento entre as equipes. Com essa abordagem, busca-se tornar a solução percebida como algo além de um simples mecanismo de aprendizado, mas sim como um ambiente de entretenimento e desenvolvimento pessoal. É importante destacar que a criação de novas comunidades pode contribuir para a formação de novas ideias e projetos dentro da empresa, promovendo ainda mais o crescimento dos funcionários e da organização como um todo.

<br>

## Partes Interessadas 

Dell Technologies: gerar entretenimento fora do trabalho para seus funcionários a partir do MVP entregue. A empresa deve fornecer suporte por meio de materiais e documentos que explicitem os problemas, as necessidades e as expectativas da interessada com o projeto. Além disso, é esperado que a Dell consiga acompanhar as entregas do projeto a cada sprint, para que possa dar feedbacks aos alunos com relação ao desenvolvimento que está sendo feito, para que os alunos sempre tenham a oportunidade de melhorar a entrega.
	
Instituto de Tecnologia e Liderança (INTELI): ter a primeira experiência de continuar um projeto real com a mesma empresa parceira e ver como seus alunos vão ter evoluído. Além disso, espera-se que o orientador possa mediar o contato com a empresa, para que os alunos estejam sempre atualizados sobre as expectativas do projeto, já que isso contribui para uma entrega de melhor qualidade.
	
Alunos responsáveis pelo projeto: interesse em aprender novos conteúdos focados em mobile, que é muito pensado atualmente ao desenvolver uma aplicação, além de se aprofundar mais em Cloud Computing, tópico que está bem requisitado ultimamente. Ademais, os alunos terão a experiência de continuar um projeto passado feito com uma empresa parceira, situação que muitas vezes acontece no mundo corporativos.


# Requisitos
A fim de garantir que todas as necessidades do parceiro fossem atendidas, a equipe desenvolvedora listou os requisitos identificados que a plataforma deveria conter.

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
13 - Os conteúdos devem conter tags: os conteúdo publicados na plataforma devem ser separados pr tags de acordo com o tema abordado, de forma que seja possível linkar esses com os projetos de mesmo tema.<br>
14 - Sistema de match: a plataforma deve conter inteligência artificial embutida para que ocorra "match" entre um usuário e um projeto, baseado nos conteúdos consumidos por este usuário.<br>
15 - Perfil: a aplicação deverá ter a opção de acessar o perfil do usuário, onde será possível visualizar suas soft e hard skills, além de projetos que esse colaborador já tenha participado.<br>
16 - Barra de pesquisa: a aplicação deve conter uma barra de pesquisa para que seja possível pesquisar por conteúdos específicos, para além dos que foram recomendados.<br>
17 - Submissão em um projeto: a plataforma deve permitir que o usuário consiga se submeter em um projeto, seja ele recomendado ou não.<br>
18 - Modo escuro: a aplicação poderá ter modo escuro como opção para os usuários. <br>
19 - Criar projeto: a aplicação permitirá a criação de projetos.<br> 
20 - Aprovação do gestor: o gestor poderá validar a criação de um projeto.


## Requisitos não Funcionais

Descreve os recursos necessários para sua execução, os requisitos de segurança e privacidade.

01 - Escalabilidade : A aplicação deve ser capaz de lidar com muitos usuários simultâneos sem afetar o seu desempenho.<br>
02 - Segurança : A plataforma deve garantir a segurança das informações dos usuários e dos conteúdos armazenados, conforme as práticas de segurança e privacidade.<br>
03 - Disponibilidade : A plataforma deve estar disponível e acessível aos usuários em qualquer momento, garantindo um tempo mínimo de inatividade.<br>
04 - Integração : A plataforma deve ser capaz de se integrar com outros sistemas internos da empresa, como sistemas de gerenciamento de projetos, intranets e aplicativos de comunicação, garantindo assim uma infraestrutura melhor.<br>
05 - Usabilidade : A interface da plataforma deve ser intuitiva, fácil de usar e acessível em dispositivos móveis, como smartphones e tablets, de diversos formatos, garantindo que qualquer usuário consiga utilizar a plataforma.<br>
06 - Desempenho : A plataforma deve ter um tempo de resposta rápida e com baixa latência para proporcionar uma experiência de usuário agradável.<br>
07 - Fácil manutenção: A plataforma deve ser projetada seguindo boas práticas de desenvolvimento de software, facilitando a manutenção e possíveis futuras atualizações.<br>
08 - Compatibilidade: A plataforma deve ser compatível com os principais sistemas operacionais móveis, como Android e iOS, e funcionar corretamente em todos os tipos de navegadores web.<br>
09 - Localização: A plataforma deve oferecer suporte ao inglês e múltiplos idiomas, atendendo as necessidades de uma audiência global.<br>
10 - Sustentabilidade: A plataforma deve completar todas as tarefas para qual foi proposta, de forma  correta e consistente com o contexto em que foi solicitado.

## Perfis de Usuários 

A aplicação desenvolvida atende a um grande público, englobando certos perfis de usuários, como os listados a seguir:

<lu>
<li>Funcionário: qualquer colaborador que trabalha dentro da empresa Dell, independente seu cargo ou posição dentro da empresa, que possua interesse em participar de algum dos processos divulgados e se desafiar a novas tecnologias e competências, ou ainda consumir e publicar conteúdos, como vídeos, podcasts ou até posts.
<li> Moderador: possui todas as características de um usuário definido como funcionário, mas tem a funcionalidade adicional de aprovar ou não os projetos criados pelos colaboradores e ainda avaliar as denúncias feitas em certos conteúdos.
<li>Gerente: pessoas quais terão de aprovar a criação de um projeto criado por um colaborador abaixo desse gerente. Além disso, possui outros poderes administrativos, como o encerramento de projetos, auxiliar na seleção de componentes para um projeto, entre outras funcionalidades. 
<li>Equipe de manutenção: serão os profissionais direcionados para a manutenção da plataforma, cujo verificarão a saúde da aplicação, correção de possíveis bugs e adição de novas implementações. </li>
</lu>
<br>

## Casos de Uso

Para a descrição dos casos de usos, optou-se pela construção de user stories, na qual serviria de base para a formulação dos casos de uso. Assim, foram feitas como na listagem a seguir, e posteriormente correlacionadas com os respectivos casos de uso, conforme  a Tabela 1. Além disso, para visualização integral dos casos de uso, fez-se um diagrama (Diagrama 6) que reflete os atores e suas ações perante à aplicação desenvolvida.

1 - Eu, como funcionário da Dell, quero ter conteúdos recomendados de acordo com os meus interesses, com o intuito de otimizar meu tempo.<br>
2 - Eu, como Product Owner, quero ter acesso à dashboards de dados, a fim de medir a produtividade de meus funcionários e o andamento dos projetos.<br>
3 - Eu, como funcionário da Dell e Product Owner, quero poder acessar o perfil de outros usuários da plataforma, a fim de visualizar suas informações, bem como suas soft/hard skills e projetos trabalhados.<br>
4 - Eu, como funcionário da Dell, quero poder buscar por conteúdos específicos para além daqueles recomendados, com objetivo de encontrar materiais sobre assuntos que não necessariamente eu já demonstrei interesse anteriormente.<br>
5 - Eu, como funcionário da Dell, quero poder denunciar conteúdos abusivos dentro da plataforma, com objetivo de ter aprovação de administradores para remover aqueles conteúdos e tornar a plataforma mais amigável.<br>
6 - Eu, como funcionário da Dell, quero ver minha posição no "Ranking", com objetivo de ver a minha colocação diante dos outros funcionários.<br>
7- Eu, como funcionário da Dell, quero poder avaliar e dar feedbacks sobre projetos dos quais fiz parte, a fim de evidenciar minhas considerações sobre o processo e possíveis pontos de melhoria.<br>
8 - Eu, como funcionário da Dell, quero que a plataforma me dê match com projetos associados aos meus interesses, com o intuito de otimizar meu tempo e me ajudar na busca por oportunidades.<br>
9 - Eu, como funcionário da Dell, quero poder aplicar para projetos, com o intuito de aprender e praticar meus conhecimentos juntamente com outros colegas.<br>
10 - Eu, como usuário da plataforma, quero poder alternar entre modo claro e escuro, a fim de adaptar a visibilidade da plataforma às minhas condições momentâneas <br>
11 - Eu, como moderador, posso avaliar um conteúdo caso ele seja denunciado para que não haja conflito entre os usuários da plataforma. <br>
12 - Eu, como usuário da plataforma, posso acompanhar o andamento da minha inscrição, para saber quando vou começar a trabalhar em um projeto <br>
13 - Eu, como usuário da plataforma, posso editar as informações do meu perfil, para mantê-lo sempre atualizado. <br>
14 - Eu, como usuário da plataforma, quero sempre poder visualizar os posts que eu fiz e os projetos criados, para que eu tenha controle do meu engajamento na plataforma. <br>
15 - Eu, como usuário da plataforma, devo poder editar as informações do meu projeto, para que ele esteja sempre atualizado. <br>
16 - Eu, como usuário da plataforma, devo poder excluir um projeto que eu criei, caso aconteça algum imprevisto. <br>
17 - Eu, como usuário da plataforma, posso denunciar posts de outros usuários, caso eles infrinjam alguma regra/lei, para que não haja conflitos na plataforma. <br>
18 - Eu, como usuário da plataforma, devo receber um feedback se fui aprovado ou não em um projeto, para que eu possa me preparar e me organizar com minhas outras atividades.<br>
19 - Eu, como funcionário da Dell, quero ser recompensado pela minha participação na plataforma, com o objetivo de me sentir engajado e motivado a continuar usando a aplicação. <br>
20 - Eu, como funcionário da Dell, quero poder compartilhar conteúdos (podcasts, vídeos, documentários etc) com meus colegas, a fim de propagar conhecimentos relevantes e oportunidades de projeto. <br>
21 - Eu, como usuário da plataforma, quero poder utilizar minhas credenciais DELL para acessar a plataforma, com o objetivo de evitar a criação de uma nova conta. <br>
22 - Eu, como funcionário da Dell, quero ter a opção de filtrar os conteúdos disponíveis na plataforma, a fim de encontrar somente aqueles associados ao meu interesse do momento <br>
23 - Eu, como administrador da plataforma, quero poder aprovar ou rejeitar projetos, a fim de evitar conflitos ou violações de conduta <br>

<center> Diagrama 6 -Casos de uso.  </center>
<img src="../docs/img/img_docs/casos_de_uso%20(1).jpg" alt="Casos de uso" border="0" width="100%" display="flex" justify-content="center">
<center> Fonte: Elaborado pelo próprio autor (2023). </center>
<br>
<center> Tabela 1 - User Stories e Casos de uso.  </center>
<img src="../docs/img/img_docs/novo_caso_de_uso.jpg" alt="User stories e casos de uso" border="0" width="100%" display="flex" justify-content="center">
<center> Fonte: Elaborado pelo próprio autor (2023). </center>
<br>

## Matriz de rastreabilidade
Sabendo que o conceito de Matriz de rastreabilidade de requisitos pode ser definido por uma ferramenta que explicita a relação direta dos requisitos entre si ou com os outros componentes do projeto (ARTIA, 2020), e ainda auxilia para identificar alterações no projeto e o que elas afetam, viu-se a necessidade de criação de uma para a corrente solução, conforme tabela 2.
<br>
<center> Tabela 2 - Matriz de rastreabilidade.  </center>
<img src="../docs/img/img_docs/matriz_de_rastreabilidade.png" alt="Matriz de rastreabilidade" border="0" width="100%" display="flex" justify-content="center">
<center> Fonte: Elaborado pelo próprio autor (2023). </center>

<br>

# Arquitetura do Sistema
	
A arquitetura de um sistema de software é a estrutura fundamental que define como o sistema é organizado e como seus componentes interagem entre si para atender aos requisitos de software. Ela serve para garantir que o sistema seja escalável, flexível, fácil de manter e extensível ao longo do tempo, permitindo que os desenvolvedores construam um software de alta qualidade que atenda às necessidades dos usuários finais de maneira eficiente. Dessa forma, aqui se encontra a primeira versão da arquitetura do sistema:

## Versão 1 - Arquitetura do sistema
<img src="../docs/img/arquitetura-v11.jpg" alt="ArquiteturaV1" border="0" width="100%" display="flex" justify-content="center">
<center> Fonte: Elaborado pelo próprio autor (2023). </center>
<br>
<p>Pensando em uma melhor performance da aplicação desenvolvida, foram feitas alterações na arquitetura principal do sistema. Sabendo a demanda de escalabilidade e segurança, foi introduzido à arquitetura o mecanismo de mensageiria. Esse consiste em um sistema distribuído que se comunica por meio de mensagens, ou seja, eventos, sendo essas mensagens gerenciadas por um Message Broker (servidor ou módulo de mensagens). O processo ocorre de forma assíncrona, não precisando assim aguardar pela resposta da primeira requisição para continuar a execução do sistema.</p>
<br>
Dessa forma foi escolhido a tecnologia Kafka para a implementação do sistema de mensageiria na arquitetura. Sabendo que a tecnologia carrega como características principais a escalabilidade, permitindo a integração de sistemas heterogêneos, tolerância a falhas, por ser um software distribuído, projetado para funcionar em um ambiente de luster com múltiplos nós, e alta performance, além de ser uma tecnologia open source, o que a torna mais acessível.

## Versão 2 - Arquitetura do sistema
<img src="../docs/img/img_docs/arquitetura_v2.jpg" alt="ArquiteturaV2" border="0" width="100%" display="flex" justify-content="center">
<center> Fonte: Elaborado pelo próprio autor (2023). </center>
<br>

## Arquitetura de mensageiria
Assim, foi constituído a arquitetura de mensageiria, onde é especificado as requisições tomadas por parte do front-end e como o sistema reage a elas, ou seja, quais tipos de requisições especificamente são feitos, os dados e seus tipos que são  inseridos e as possíveis respostas que o sistema pode dar de acordo ocm a requisição dada, conforme é possível verificar na figura abaixo.
<img src="../docs/img/img_docs/arquitetura_mensageria_v2.jpg" alt="Arquitetura de mensageiria" border="0" width="100%" display="flex" justify-content="center">
<center> Fonte: Elaborado pelo próprio autor (2023). </center> <br> <br>

## Benefícios e desvantagens da arquitetura
<p>A aplicação dessa arquitetura traz consigo vantagens e desvantagens. Podem ser citadas como vantagens: 
<lu>
<li> Escalabilidade: a arquitetura possui um desacoplamento de aplicação, que facilita o processo de escalabilidade, principalmente na modalidade horizontal, uma vez que permite o acréscimo de recursos em funcionalidades específicas. Além disso, com o sistema de mensageiria, a multi clusterização do sistema não seria um problema, ima vez que teria um único ponto de contato entre o frontend e o backend.
<li> Tolerância a falhas: também com desacoplamento de aplicação seria proporcionado proteção e segurança, uma vez que a falha em um componente não afetaria o funcionamento dos demais, em efeito cascata.
<li> Alta performance: outro fator afetado pelo desacoplamento da aplicação e o banco de dados é a redução da carga de conexão, melhorando a performance do sistema.
<li> Integração de sistemas heterogêneos: a arquitetura usada permite que a solução desenvolvida seja integrada a diversos outros sistemas, como o próprio sistema corporativo da empresa parceira, por exemplo.
<li> Tecnologia open source: as tecnologias usadas para o sistema de mensageiria proposto na arquitetura são open source, o que reduz os custos de implementação e manutenção do sistema.
</lu></p>
<p>Em contraposição, também são vistos alguns dificultadores na aplicação dessa arquitetura. São eles: </p>
<lu> 
<li> Complexidade de implementação: a arquitetura proposta pode se tornar complexa, dependendo da dimensão que esta ganhar, o que dificulta a implementação e manutenção do sistema.
<li> Aumento da auditoria da aplicação: por se tratar de componentes altamente distribuídos e heterogêneos, a auditoria pode gerar um grande volume de dados, que precisam ser armazenados e processados, aumentando assim a complexidade da arquitetura e os custos operacionais.
<li> Necessidade de uma reestruturação da experiência do usuário: por se tratar de um sistema assíncrono, as respostas as requisições não serão imediatas. Dessa forma, será necessário reestruturação da experiência do usuário, para que este não se sinta prejudicado com a demora nas respostas.
<li> Aumento do número de componentes: a arquitetura ganha maior quantidade de componentes, uma vez que há a necessidade de um servidor de mensageiria.
</lu>

<br>

## Diagrama de sequência do fluxo de dados

O diagrama de sequência de fluxo de dados é uma ferramenta de modelagem que descreve a interação entre diferentes componentes de um sistema, mostrando a sequência de eventos e as informações que fluem entre eles. Ele é utilizado para ilustrar o fluxo de dados em um sistema, permitindo que os desenvolvedores entendam como o sistema funciona e identifiquem oportunidades para melhorias e otimizações.
	
<img src="../docs/img/img_docs/fluxodedados.png" alt="Diagrama de sequência de fluxo de dados" border="0" width="100%" display="flex" justify-content="center">
<center> Fonte: Elaborado pelo próprio autor (2023). </center>
	
## Versão 3 - Arquitetura do sistema
	
Na terceira e última versão da arquitetura, a parte de infraestrutura não foi modificada, apenas foi adicionado uma tabela que conecta os mecanismos de tal arquitetura com a aplicação em termos de observabilidade e redundâncias de processamento, de informações e de transações. De uma forma mais simples, essa tabela mostra os caminhos que um componente ou página vai percorrer na aplicação, já considerando o Kafka, e qual tabela será acionada quando certo endpoint for chamado.

<img src="../docs/img/img_docs/arquitetura%20_v3.png" alt="ArquiteturaV3" border="0" width="100%" display="flex" justify-content="center">
<center> Fonte: Elaborado pelo próprio autor (2023). </center> <br> <br>
Nota do grupo desenvolvedor: <br>
<img src="../docs/img/img_docs/observações_v3.png" alt="Observações sobre a V3 da arquitetura" border="0" width="30%" display="flex" justify-content="center">

## ETL (Extração, Transformação e Carregamento)

O ETL é um processo que envolve a coleta de dados brutos de diferentes fontes, a transformação desses dados em um formato adequado e sua carga em um local de destino, como um data warehouse. O objetivo do ETL é tornar os dados prontos para análise e tomada de decisões, garantindo sua integridade, consistência e acessibilidade.

<img src="../docs/img/img_docs/tabela_ETL.jpg" alt="Diagrama de sequência de fluxo de dados" border="0" width="100%" display="flex" justify-content="center">
<center> Fonte: Elaborado pelo próprio autor (2023). </center>

# UX e UI Design

## Benchmarking e Revisão de Design System

<p>O benchmarking é uma técnica de análise comparativa que permite identificar as melhores práticas em um determinado campo, em relação aos concorrentes ou empresas de referência. No caso de um Design System, o benchmarking pode ser útil para avaliar a eficácia e a qualidade do sistema, além de obter insights sobre como melhorá-lo. Dessa forma foi escolhido pela equipe os design systems da Apple e do Governo Brasileiro.</p>

<p>Ao fazer um benchmark utilizando 3 Design Systems, sendo um o principal e outros dois para comparação, foi possível perceber que a Dell é uma marca muito forte quando se fala em Design. Começando por um Design unificado, todas as 3 empresas, sendo elas a Dell, Apple e o Governo o possuem, já que utilizam o mesmo padrão em todos seus produtos e componentes. Pensando nisso, as três também possuem um Design universal, com ícones de significado convencional para a sociedade. Porém, apesar disso, os ícones da Dell tem um Design muito rústico, tradicional e quadrado, pouco utilizado hoje em dia e que costuma incomodar os olhos. Além disso, a tipografia da Dell também apresenta essas mesmas características, tanto que esse foi um dos pontos fracos encontrados na empresa. Em contrapartida, a Apple e o Governo do Brasil possuem uma iconografia e tipografia mais arredondados, o que costuma ser mais usado e agrada melhor os olhos. No geral, foi pedido que fosse utilizado o Design System da Dell, mas como foi observado, talvez mudar um pouco a iconografia e a tipografia seja mais agradável para a plataforma, porém isso é algo a se discutir com o cliente. Algo que foi decidido por manter completamente é a paleta de cores. A cor azul que a Dell usa é muito marcante e conhecida no mundo todo.</p>

A tabela a seguir descreve a comparação entre os design systems escolhidos:
<img src="../docs/img/img_docs/Cloud-ETS.jpg" alt="Comparação de design System" border="0" width="100%" display="flex" justify-content="center">
<center> Fonte: Elaborado pelo próprio autor (2023). </center>

## Wireframes
Como o Design foi pensado?
A princípio, foi pensado em um Design que tornasse a interação do usuário intuitiva, de maneira que sua experiência navegando pelas telas fosse mais fluida. Dessa forma, pensamos em uma “Bottom Navbar”, que é uma barra de navegação na parte inferior da tela, pois pensando em uma aplicação Mobile e na zona do polegar, a grande maioria dos aplicativos de maior referência, como o Spotify e Instagram, por exemplo, utilizam desse tipo de barra de navegação, já que é uma posição confortável para o usuário acessar e de nítida visualização e com isso, essa feature foi implementada em todas as telas.
Diante disso, na tela inicial, vários ícones acompanhados de texto foram implementados com a intenção de tornar visual a maneira a qual o usuário se encaminhará para as telas de visualização dos posts e repositórios, devidamente filtrados. Além disso, temos um botão de um tom azul mais chamativo, para chamar a atenção do usuário para o botão que o encaminha para a tela com suas recomendações personalizadas. Abaixo disso, têm-se alguns cards, que foram usados para exibir de forma organizada as informações e os posts “em alta” naquele momento.
Pensando na tela de recomendações de conteúdo, tem um filtro que foi implementado com a intenção de permitir que o usuário selecione de forma flexível e personalizada o tipo de conteúdo que quer consumir. Além disso, foi implementado o mesmo modelo de cards do “Trending now” da página inicial, já que esses cards permitem que o usuário consiga facilmente passar o olho e identificar as informações principais daquele projeto.
A respeito da tela de Ranking, foi pensado em vários cards que representam a colocação dos usuários do maior para o menor, optou-se pelo uso de cards ao invés de um texto solto na tela, pois esses cards vão permitir que o usuário se encaminhe para a tela de perfil daquele que clicou, e essas caixas trazem a percepção de algo clicável, diferente de um texto solto na tela. Na tela de FAQ, foi feito algo parecido, mas ao invés de ser somente o card, é um dropdown, que mostra a resposta para aquela pergunta quando o usuário clica nele, assim, o usuário pode ver a resposta para a dúvida que tem, caso essa dúvida esteja entre as mais frequentes.
Por fim, pensando na tela de perfil, temos um ícone circular para a foto do usuário, seguindo o padrão da grande maioria dos aplicativos e redes sociais, de forma que o usuário fique confortável em estar usando algo que já conhece e ao lado do ícone, o nome e papel do usuário para que complemente a foto do mesmo. Além disso, têm campos que estarão exibindo as formas de contatar aquele usuário, feito em formato de texto para que a pessoa possa apenas visualizar e copiar, caso tenha interesse. A parte das skills foi feita em forma de tags, como pedido pelo parceiro de projetos e ao fim da página, temos um histórico de atividades com o mesmo modelo de cards de posts citados anteriores.

As telas navegáveis estão disponíveis em:<https://www.figma.com/file/L15EchWiFZtJNPthyBNJnb/Dell-M6?node-id=45%3A131&t=Hnbg2GhO5hYhYhxq-1>.

## Design de Interface - Guia de Estilos
Tratando-se de um documento que conttempa as diretrizes de design de uma empresa, garantindo a consistência da interface gráfica, esse apresenta definições de cores, tipografia, iconografia e grids. Dessa forma, seguindo o design system do parceiro, foi proposto o guia de estilos a seguir para a aplicação desenvolvida.

<img src="../docs/img/img_docs/Style_guide_v2.png" alt="Guia de estilos" border="0" width="100%" display="flex" justify-content="center">
<center> Fonte: Elaborado pelo próprio autor (2023). </center>


# Projeto de Banco de Dados

Documento contendo diagrama de entidades e relacionamentos do banco de dados


## Modelos Lógico e Conceitual 

O modelo lógico de banco de dados é uma representação abstrata e simplificada dos dados armazenados no sistema. É utilizado para entender como os dados são relacionados e para garantir a integridade e consistência dos dados armazenados. 
Dessa forma foram desenvolvidos os diagramas a seguir a fim de exemplificar como ocorre a interação e armazenamento de informações no sistema, considerando a utilização do novo sistema e do sistema legado.

<p>→ Sistema legado</p>
<img src="img\img_docs\modelo_logico_legado.jpg" border="0" width="100%" display="flex" justify-content="center">

<p>→ Sistema atual</p>
<img src="img\img_docs\modelo_logico_novo.jpg" border="0" width="100%" display="flex" justify-content="center">


# Testes de Software



## Teste Unitário e Teste de Integração

Testes unitários são testes focados em apenas uma unidade do código, enquanto testes de integração focam em testar se a integração do front-end com o back-end estão funcionando da maneira correta e englobando todos os erros possíveis. No caso desse projeto, como está sendo desenvolvido em microsserviços, ambos testes acabam tendo propósitos muito parecidos, portanto não há problemas em pensar e desenvolver eles juntos.

<img src="img\img_docs\tabela_testes.jpg" border="0" width="100%" display="flex" justify-content="center">
<center> Fonte: Elaborado pelo próprio autor (2023). </center> <br> <br>
Legenda: <br>
<img src="img/img_docs/legenda_testes.png" alt="legenda da tabela de testes" border="0" width="30%" display="flex" justify-content="center"> <br> <br>
Nota do grupo desenvolvedor: <br>
<img src="img/img_docs/observações_testes.png" alt="Observações sobre os testes" border="0" width="30%" display="flex" justify-content="center">

<br>
Assim, foram desenvolvidos arquivos .spec para o teste de cada entidade do sistema, sendo eles: <br>

→ Posts:
<img src="img/img_docs/testes_api/teste_unitarios/test_post.png" border="0" width="100%" display="flex" justify-content="center">
<center> Fonte: Elaborado pelo próprio autor (2023). </center> <br>
→ User:
<img src="img/img_docs/testes_api/teste_unitarios/test_user.png" border="0" width="100%" display="flex" justify-content="center">
<center> Fonte: Elaborado pelo próprio autor (2023). </center> <br>
→ Badges:
<img src="img/img_docs/testes_api/teste_unitarios/test_badge.png" border="0" width="100%" display="flex" justify-content="center">
<center> Fonte: Elaborado pelo próprio autor (2023). </center> <br>
Os testes não passaram, uma vez que há conflito na relação das tabelas com o teste desenvolvido. <br>

## Teste de Carga

O teste de carga é um teste de software que avalia o comportamento de um sistema sob condições de carga crescentes. O teste de carga é realizado para determinar um sistema de software existente ou aplicativo sob uma carga específica. <br>
Dessa forma, foi desenvolvido pela equipe um teste de carga com 3 usuários virtuais efetuando requisições simultâneas ao sistema, com o intervalo de 1 segundo e duração de 3 segundos.
<br>
O resultado obtido é de erro, uma vez que existe um tratamento no backend para posts que já existem no banco, conforme é possível ver na imagem de abaixo.

<img src="img/img_docs/testes_api/teste_unitarios/teste_de_carga.png" border="0" width="100%" display="flex" justify-content="center">
<center> Fonte: Elaborado pelo próprio autor (2023). </center> <br>


## Teste de Usabilidade 

Registro de Teste de Usabilidade - Dell Link Data: 21/06/2023

1. Acesso e Login
   <ul>
	<li> Os usuários conseguiram acessar a aplicação e realizar o login com sucesso.</li>
	<li> O processo de autenticação é rápido.</li>
   </ul>

2. Home
   <ul>
	<li> A interface é bem intuitiva.</li>
	<li> Ele consegue ter acesso a todas as páginas da aplicação em poucos cliques.</li>
	<li> Possui destaques das informações e sessões mais importantes.</li>
   </ul>

3. Recomendações
   <ul>
	<li> O usuário consegue acessar com apenas um clique a página de recomendação.</li>
	<li> Essa página é dividia por tema dos conteúdos recomendados.</li>
	<li> O usuário consegue acessar o conteúdo completo com apenas um clique.</li>
   </ul>

4. Feed
   <ul>
	<li> O usuário consegue acessar com apenas um clique a página de feed.</li>
	<li> É uma página bem intuitiva, pois o usuário consegue filtrar para achar mais facilmente os conteúdos desejados.</li>
	<li> Caso o usuário não consiga encontrar o que ele deseja, ele pode utilizar a barra de pesquisa.</li>
   </ul>

5. Criação de projetos
   <ul>
	<li> A interface de criação de projetos é intuitiva e fácil de usar.</li>
	<li> Ela pode ser acessada com apenas dois cliques, iniciando pela NavBar.</li>
	<li> Os usuários conseguiram adicionar detalhes do projeto, como título, descrição, prazo e recursos necessários de forma clara e objetiva.</li>
   </ul>

6. Visualização de projetos
   <ul>
	<li> O usuário pode ter dificuldade de identificar quais cards se referem a projetos, uma vez que eles possuem o mesmo design que os cards de postagem.</li>
	<li> Fora isso, para visualizar um projeto, basta apenas o usuário clicar em cima de seu card que terá acesso a todas as suas informações.</li>
	<li> A visualização dos projetos é organizada e apresenta informações relevantes, como status, membros envolvidos e prazos.</li>
	<li> Antes de clicar no card, o usuário também consegue visualizar quem criou o projeto e quais pessoas já fazem parte do time.</li>
   </ul>

7. Inscrever-se em projetos
   <ul>
	<li> O usuário se inscreve no projeto na mesma página que ele viasualiza as informações do projeto, o que ajuda ele a não ter que sair e voltar várias vezes caro queira checar uma informação novamente antes de se inscrever.</li>
	<li> O usuário tem acesso as informações específicas do projeto, que são importantes para ele decidir se vai ou não querer se aplicar no projeto, considerando seu tema, data de início e término, entre outros.</li>
	<li> O processo de inscrição é simples e rápido, o que não cansa o usuário.</li>
   </ul>

8. Criação de postagens
   <ul>
	<li> A interface de criação de postagens é intuitiva e fácil de usar, pois possui poucos campos.</li>
	<li> Ela pode ser acessada com apenas dois cliques, iniciando pela NavBar.</li>
	<li> Os usuários conseguem adicionar um título, uma descrição, tags relacionadas e uma categoria que ele se encaixa.</li>
   </ul>

9. Visualização de postagens
   <ul>
	<li> Como foi descrito no item 6, o usuário pode ter dificuldade de identificar quais cards se referem a postagens, uma vez que eles possuem o mesmo design que os cards de projeto.</li>
	<li> Fora isso, para visualizar uma postagem, basta apenas o usuário clicar em cima de seu card que terá acesso a todas as suas informações.</li>
	<li> Além disso, é possível ver quem criou a postagem e quando ela foi criada.</li>
   </ul>

10. Perfil do usuário 
   <ul>
	<li> É possível acessar o perfil com apenas um clique por meio da NavBar.</li>
	<li> Os usuários podem editar suas informações pessoais clicando apenas em um único botão que está bem posicionado na tela.</li>
	<li> A seção de atividades no perfil do usuário é clara e útil para o mesmo e outros membros da plataforma acompanharem como tal usuário contribui para a aplicação.</li>
   </ul>
11. Ranking
   <ul>
	<li> O ranking é atualizado em tempo real e exibe a posição dos usuários em relação aos colegas.</li>
	<li> O sistema de ranking incentiva a colaboração e a competição saudável entre os membros da equipe.</li>
	<li> É possível ganhar pontos de duas maneiras, a primeira é ao concluir um projeto, e a outra é com algumas atividades determinadas pela empresa.</li>
   </ul>


12. Pontuação por atividades na plataforma
   <ul>
	<li> O sistema de pontuação pode não ficar claro para o usuário, pois não tem nenhum lugar na plataforma que explica ele.</li>
	<li> Existem duas maneiras de pontuar, uma é pela conclusão de projetos, e a outra é por meio de atividades dentro da plataforma.</li>
	<li> Os pontos são atualizados em tempo real após a conclusão de projetos ou tarefas escolhidas pela empresa, como por exemplo, o usuário ganha 10 pontos quando fizer sua primeira postagem.</li>
	<li> Além de pontos por conclusão de tarefas, os usuários também ganham badges por essas tarefas.</li>
   </ul>

13. FAQ
   <ul>
	<li> A sessão de FAQ pode parecer escondida e de difícil acesso para os usuários, uma vez que fica localizada no menu do perfil. Por outro lado, uma vez acessada, o usuário não parece ter dificuldade para acessá-la novamente.</li>
	<li> O usuário consegue de maneira fácil e intuitiva encontrar as respostas das suas perguntas. Porém, se existirem muitas perguntas, não existe um lugar para pesquisar por temas, o que compromete a experiência do usuário, já que ele vai ter que procurar pergunta por pergunta até encontrar a que deseja, o que pode até levar a desistência.</li>
   </ul>

14. Desempenho geral e usabilidade
   <ul>
	<li> A aplicação apresenta um design moderno e responsivo, que segue o Design System da empresa, feito para ser usado como um aplicativo mobile.</li>
	<li> Os usuários relataram satisfação com a experiência geral do site e muita facilidade de uso.</li>
	<li> Por outro lado, a aplicação ainda apresenta pontos de melhoria que atualmente estão comprometendo a experiência do usuário na aplicação.</li>
   </ul>

15. Conclusão
   <ul>
	<li> O teste de usabilidade da aplicação mostrou resultado positivos, mas com alguns pontos de atenção, uma vez que os usuários tiveram facilidade ao utilizar a aplicação e completar tarefas, mas em alguns momentos específicos ficaram um pouco perdidos. Além disso, as atividades puderam ser concluídas de forma eficiente e intuitiva, com poucos cliques.</li>
	<li> A aplicação contribui para o engajamento e a colaboração entre os membros da empresa, motivando-os a constantemente aprender a novos conteúdos e compartilhar seus conhecimentos com seus colegas.</li>
   </ul>


## Teste de Funcionalidade 

Os testes de funcionalidade são executados para garantir que a aplicação realize as tarefas para as quais foi projetada. Eles são conduzidos em um nível mais alto, concentrando-se nas funcionalidades visíveis e perceptíveis para os usuários. Esses testes avaliam se a aplicação está fornecendo os resultados esperados, interagindo corretamente com os usuários e cumprindo suas funções.

<img src="img/img_docs/testefuncionalidades.png" alt="Testes de funcionalidade" border="0" width="100%" display="flex" justify-content="center">
<center> Fonte: Elaborado pelo próprio autor (2023). </center> <br> <br>

## Teste de API 

Para a testagem das APIs da aplicação, foi usado a documentação do Swagger, que é uma ferramenta de código aberto usada para testar e documentar APIs da Web. A partir da interface foram realizados testes de requisições, validando os dados de entrada e saída, além de verificar se os endpoints estão funcionando corretamente.

→ Teste de requisição DELETE de Badges
<img src="img/img_docs/testes_api/badges/test_delete_badges.png" alt="Testes" border="0" width="100%" display="flex" justify-content="center">
<center> Fonte: Elaborado pelo próprio autor (2023). </center> <br>

→ Teste de requisição GET de Badges
<img src="img/img_docs/testes_api/badges/test_get_badges.png" alt="Testes" border="0" width="100%" display="flex" justify-content="center">
<center> Fonte: Elaborado pelo próprio autor (2023). </center> <br>

→ Teste de requisição GET by Id de Badges
<img src="img/img_docs/testes_api/badges/test_get_badgesbyId.png" alt="Testes" border="0" width="100%" display="flex" justify-content="center">
<center> Fonte: Elaborado pelo próprio autor (2023). </center> <br>

→ Teste de requisição PATCH de Badges
<img src="img/img_docs/testes_api/badges/test_patch_badges.png" alt="Testes" border="0" width="100%" display="flex" justify-content="center">
<center> Fonte: Elaborado pelo próprio autor (2023). </center> <br>

→ Teste de requisição POST de Badges
<img src="img/img_docs/testes_api/badges/test_post_badges.png" alt="Testes" border="0" width="100%" display="flex" justify-content="center">
<center> Fonte: Elaborado pelo próprio autor (2023). </center> <br>

→ Teste de requisição DELETE de Posts
<img src="img/img_docs/testes_api/post/test_delete_post.png" alt="Testes" border="0" width="100%" display="flex" justify-content="center">
<center> Fonte: Elaborado pelo próprio autor (2023). </center> <br>

→ Teste de requisição GET by Title de Posts
<img src="img/img_docs/testes_api/post/test_error_postTitle.png" alt="Testes" border="0" width="100%" display="flex" justify-content="center">
<center> Fonte: Elaborado pelo próprio autor (2023). </center> <br>

→ Teste de requisição GET de Posts
<img src="img/img_docs/testes_api/post/test_get_post.png" alt="Testes" border="0" width="100%" display="flex" justify-content="center">
<center> Fonte: Elaborado pelo próprio autor (2023). </center> <br>

→ Teste de requisição GET by Creator de Posts
<img src="img/img_docs/testes_api/post/test_get_post_byCreator.png" alt="Testes" border="0" width="100%" display="flex" justify-content="center">
<center> Fonte: Elaborado pelo próprio autor (2023). </center> <br>

→ Teste de requisição GET by Id de Posts
<img src="img/img_docs/testes_api/post/test_get_post_byId.png" alt="Testes" border="0" width="100%" display="flex" justify-content="center">
<center> Fonte: Elaborado pelo próprio autor (2023). </center> <br>

→ Teste de requisição PATCH de Posts
<img src="img/img_docs/testes_api/post/test_patch_post.png" alt="Testes" border="0" width="100%" display="flex" justify-content="center">
<center> Fonte: Elaborado pelo próprio autor (2023). </center> <br>

→ Teste de requisição DELETE de Projects
<img src="img/img_docs/testes_api/project/test_delete_project.png" alt="Testes" border="0" width="100%" display="flex" justify-content="center">
<center> Fonte: Elaborado pelo próprio autor (2023). </center> <br>

→ Teste de requisição GET de Projects
<img src="img/img_docs/testes_api/project/test_get_project.png" alt="Testes" border="0" width="100%" display="flex" justify-content="center">
<center> Fonte: Elaborado pelo próprio autor (2023). </center> <br>

→ Teste de requisição GET by Creator de Projects
<img src="img/img_docs/testes_api/project/test_get_projectbyCreator.pngg" alt="Testes" border="0" width="100%" display="flex" justify-content="center">
<center> Fonte: Elaborado pelo próprio autor (2023). </center> <br>

→ Teste de requisição GET by Id de Projects
<img src="img/img_docs/testes_api/project/test_get_projectbyId.png" alt="Testes" border="0" width="100%" display="flex" justify-content="center">
<center> Fonte: Elaborado pelo próprio autor (2023). </center> <br>

→ Teste de requisição PATCH de Projects
<img src="img/img_docs/testes_api/project/test_patch_project.png" alt="Testes" border="0" width="100%" display="flex" justify-content="center">
<center> Fonte: Elaborado pelo próprio autor (2023). </center> <br>

→ Teste de requisição POST de Projects
<img src="img/img_docs/testes_api/project/test_post_project.png" alt="Testes" border="0" width="100%" display="flex" justify-content="center">
<center> Fonte: Elaborado pelo próprio autor (2023). </center> <br>

→ Teste de requisição DELETE de User
<img src="img/img_docs/testes_api/user/test_delete_user.png" alt="Testes" border="0" width="100%" display="flex" justify-content="center">
<center> Fonte: Elaborado pelo próprio autor (2023). </center> <br>

→ Teste de requisição GET de User
<img src="img/img_docs/testes_api/user/test_get_user.png" alt="Testes" border="0" width="100%" display="flex" justify-content="center">
<center> Fonte: Elaborado pelo próprio autor (2023). </center> <br>

→ Teste de requisição GET by Id de User
<img src="img/img_docs/testes_api/user/test_get_userbyId.png" alt="Testes" border="0" width="100%" display="flex" justify-content="center">
<center> Fonte: Elaborado pelo próprio autor (2023). </center> <br>

→ Teste de requisição PATCH score de User
<img src="img/img_docs/testes_api/user/test_patch_score.png" alt="Testes" border="0" width="100%" display="flex" justify-content="center">
<center> Fonte: Elaborado pelo próprio autor (2023). </center> <br>

→ Teste de requisição PATCH de User
<img src="img/img_docs/testes_api/user/test_patch_user.png" alt="Testes" border="0" width="100%" display="flex" justify-content="center">
<center> Fonte: Elaborado pelo próprio autor (2023). </center> <br>

→ Teste de requisição GET by Id de User
<img src="img/img_docs/testes_api/user/test_get_userbyId.png" alt="Testes" border="0" width="100%" display="flex" justify-content="center">
<center> Fonte: Elaborado pelo próprio autor (2023). </center> <br>

# Documentação da API

A documentação da API é uma entrega técnica de conteúdo, contendo instruções sobre como usar e integrar efetivamente a solução. De forma mais simples, ela é um manual de referência resumido que contém todas as informações necessárias para trabalhar com a API, com detalhes sobre seus componentes.
	
Link de acesso ao Swagger: http://localhost:3000/api#/

<img src="../docs/img/img_docs/swagger.png" alt="Swagger" border="0" width="100%" display="flex" justify-content="center">
<center> Fonte: Elaborado pelo próprio autor (2023). </center>


# Manual do Usuário

Fornecer instruções detalhadas sobre como usar o software corretamente. É uma ferramenta valiosa para ajudar os usuários a compreender as funções do software, instalar o software, configurar as preferências do usuário, entre outras tarefas. O manual do usuário geralmente inclui screenshots, animações e outros recursos visuais para tornar a experiência do usuário mais clara e intuitiva. Além disso, ele também pode incluir informações sobre solução de problemas, dicas e truques, bem como informações de contato para suporte técnico. É importante que a seção de manual do usuário seja atualizada frequentemente para garantir que os usuários tenham acesso à informação mais recente e precisa sobre o software.

O manual do usuário está disponível em: https://www.canva.com/design/DAFluYpmwYU/BhdiG8fDAuA1bo1XOlLlWQ/edit?utm_content=DAFluYpmwYU&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton


# Referências

Toda referência citada no texto deverá constar nessa seção, utilizando o padrão de normalização da ABNT - ABNT NBR 10520). As citações devem ser confiáveis e relevantes para o trabalho. São imprescindíveis as citações dos sites de download das ferramentas utilizadas, bem como a citação de algum objeto, música, textura ou outros que não tenham sido produzidos pelo grupo, mas utilizados (mesmo no caso de licenças gratuitas, royalty free ou similares).
Sugerimos o uso do sistema autor-data para citações.

https://artia.com/blog/matriz-de-rastreabilidade/ 01/05/2023

https://antlia.com.br/artigos/servicos-de-mensageria/#:~:text=Mensageria%20%C3%A9%20um%20conceito%20definido,servidor%2Fm%C3%B3dulo%20de%20mensagens  12/05/2023


# Apêndice 

Um dos principais objetivos do projeto era desenvolver um modelo de recomendação. Para isso, foi utilizado uma tabela da plataforma "Kaggle". Primeiro foi feito um tratameto nos dados desse dataset, depois o modelo foi treinado utilizando o knn, e por último ele foi transformado em serviço utilizando o "MQTT". Todas essas informaçõe podem ser encontradas de forma mais detalhada na pasta "AI", que está localizada dentro da pasta códigos. 
