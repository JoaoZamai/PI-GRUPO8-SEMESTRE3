# Cadastro de Usuário

## Descrição
Permite que novos colaboradores da empresa criem uma conta no aplicativo para acessar o sistema de monitoramento de produção.

---

## User Story

Como colaborador da empresa  
Quero criar uma conta no aplicativo  
Para acessar o sistema de monitoramento da produção.

---

## Caso de Uso

**Nome:** Cadastrar Usuário  
**Ator:** Usuário

### Fluxo Principal

1. O usuário acessa a tela de cadastro.
2. O sistema solicita nome, e-mail e senha.
3. O usuário preenche os dados.
4. O sistema valida as informações.
5. O sistema cria a conta do usuário.

### Fluxo Alternativo

**E-mail inválido**

1. O usuário informa um e-mail fora do domínio da empresa.
2. O sistema exibe mensagem de erro.
3. O cadastro não é concluído.

---

## Critérios de Aceitação

- O usuário deve informar nome, e-mail e senha.
- O e-mail deve pertencer ao domínio da empresa.
- O usuário deve ter mais de 18 anos.
- As senhas devem ser armazenadas de forma segura.

---

### Diagrama de Atividade

<img width="701" height="534" alt="image" src="https://github.com/user-attachments/assets/e8ff8622-7dbd-40e0-80cb-0d822232a44d" />
