# Login e Autenticação

## Descrição
Permite que usuários cadastrados acessem o sistema utilizando e-mail e senha.

---

## User Story

Como usuário do sistema  
Quero realizar login com e-mail e senha  
Para acessar o sistema de monitoramento de produção.

---

## Caso de Uso

**Nome:** Realizar Login  
**Ator:** Usuário

### Fluxo Principal

1. O usuário abre o aplicativo.
2. O sistema exibe a tela de login.
3. O usuário insere e-mail e senha.
4. O sistema valida as credenciais.
5. O sistema permite acesso ao dashboard.

### Fluxo Alternativo

**Senha incorreta**

1. O usuário insere senha incorreta.
2. O sistema exibe mensagem de erro.
3. O usuário pode tentar novamente.

---

## Critérios de Aceitação

- O sistema deve validar e-mail e senha.
- Após 5 tentativas inválidas a conta deve ser bloqueada temporariamente.
- Usuários inativos por mais de 90 dias devem autenticar novamente.

---
