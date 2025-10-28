# 🐉 Projeto DBZ API - API REST para Gerenciamento de Personagens

API REST desenvolvida em ASP.NET Core 7.0 para gerenciamento de personagens do universo Dragon Ball Z, utilizando Entity Framework Core com MySQL.

## 📋 Índice

- [Descrição](#descrição)
- [Tecnologias Utilizadas](#tecnologias-utilizadas)
- [Pré-requisitos](#pré-requisitos)
- [Configuração do Banco de Dados](#configuração-do-banco-de-dados)
- [Como Executar](#como-executar)
- [Endpoints da API](#endpoints-da-api)
- [Validações Implementadas](#validações-implementadas)
- [Exemplos de Uso](#exemplos-de-uso)
- [Estrutura do Projeto](#estrutura-do-projeto)

## 📝 Descrição

Esta é uma API REST completa para CRUD (Create, Read, Update, Delete) de personagens do universo Dragon Ball Z. A API permite gerenciar informações sobre os personagens, incluindo nome e tipo, com validações robustas.

## 🛠 Tecnologias Utilizadas

- **.NET 7.0** - Framework base
- **ASP.NET Core Web API** - Framework para criação de APIs REST
- **Entity Framework Core 7.0.7** - ORM para acesso a dados
- **Pomelo.EntityFrameworkCore.MySql 7.0.0** - Provedor MySQL para EF Core
- **Swagger (Swashbuckle)** - Documentação interativa da API
- **MySQL** - Banco de dados relacional

## 📦 Pré-requisitos

Antes de executar o projeto, certifique-se de ter instalado:

1. [.NET SDK 7.0 ou superior](https://dotnet.microsoft.com/download)
2. [MySQL Server](https://dev.mysql.com/downloads/mysql/)
3. [Visual Studio 2022](https://visualstudio.microsoft.com/) ou [Visual Studio Code](https://code.visualstudio.com/) (opcional, mas recomendado)

## 🗄 Configuração do Banco de Dados

### 1. Criar o Banco de Dados MySQL

Abra o MySQL e execute o seguinte comando para criar o banco de dados:

```sql
CREATE DATABASE DBZ CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
```

### 2. Configurar a String de Conexão

Edite o arquivo `appsettings.json` e ajuste a string de conexão conforme suas credenciais do MySQL:

```json
"ConnectionStrings": {
  "AppDbConnectionString": "server=localhost; database=DBZ; User=root; Password=123456;"
}
```

**Importante**: Substitua `123456` pela senha do seu MySQL.

### 3. Executar as Migrações

Execute o seguinte comando na raiz do projeto para aplicar as migrações ao banco de dados:

```bash
dotnet ef database update
```

Se você ainda não instalou o Entity Framework Tools, instale com:

```bash
dotnet tool install --global dotnet-ef
```

## 🚀 Como Executar

### Opção 1: Visual Studio

1. Abra o arquivo `ProjetoDBZ.sln` no Visual Studio
2. Certifique-se de que o perfil de execução está configurado como "https"
3. Pressione `F5` ou clique em "Executar"
4. A aplicação será aberta automaticamente no navegador em `https://localhost:7010` com o Swagger

### Opção 2: Visual Studio Code

1. Abra a pasta do projeto no VS Code
2. Abra o terminal integrado (Ctrl + ' )
3. Execute o comando:

```bash
dotnet run
```

4. Acesse `https://localhost:7010/swagger` no navegador

### Opção 3: Terminal/Command Prompt

1. Navegue até a pasta do projeto
2. Execute:

```bash
dotnet run
```

3. Acesse `https://localhost:7010/swagger` no navegador

### Opção 4: Executar com perfil específico

Para executar apenas em HTTP (sem HTTPS):

```bash
dotnet run --launch-profile http
```

O Swagger estará disponível em `http://localhost:5085/swagger`

## 🔌 Endpoints da API

### Base URL

- HTTPS: `https://localhost:7010/api/personagens`
- HTTP: `http://localhost:5085/api/personagens`

### 1. Listar Todos os Personagens

**GET** `/api/personagens`

Retorna todos os personagens cadastrados.

**Resposta de Sucesso (200 OK)**:
```json
[
  {
    "id": 1,
    "nome": "Goku",
    "tipo": "Saiyajin"
  },
  {
    "id": 2,
    "nome": "Vegeta",
    "tipo": "Saiyajin"
  }
]
```

### 2. Buscar Personagem por ID

**GET** `/api/personagens/{id}`

Retorna um personagem específico pelo ID.

**Parâmetros:**
- `id` (int) - ID do personagem

**Resposta de Sucesso (200 OK)**:
```json
{
  "id": 1,
  "nome": "Goku",
  "tipo": "Saiyajin"
}
```

**Resposta de Erro (404 Not Found)**:
```json
"Personagem não encontrado!"
```

### 3. Adicionar Novo Personagem

**POST** `/api/personagens`

Cria um novo personagem.

**Body (JSON)**:
```json
{
  "nome": "Goku",
  "tipo": "Saiyajin"
}
```

**Resposta de Sucesso (201 Created)**:
```json
{
  "id": 1,
  "nome": "Goku",
  "tipo": "Saiyajin"
}
```

**Resposta de Erro (400 Bad Request)** - Validação falhou:
```json
{
  "errors": {
    "Nome": ["Nome é um campo obrigatório!"],
    "Tipo": ["Tipo é um campo obrigatório!"]
  }
}
```

### 4. Atualizar Personagem Existente

**PUT** `/api/personagens/{id}`

Atualiza um personagem existente pelo ID.

**Parâmetros:**
- `id` (int) - ID do personagem a ser atualizado

**Body (JSON)**:
```json
{
  "nome": "Kakarotto",
  "tipo": "Saiyajin"
}
```

**Resposta de Sucesso (201 Created)**:
```json
{
  "id": 1,
  "nome": "Kakarotto",
  "tipo": "Saiyajin"
}
```

**Resposta de Erro (404 Not Found)**:
```json
"Personagem não encontrado!"
```

### 5. Deletar Personagem

**DELETE** `/api/personagens/{id}`

Remove um personagem do banco de dados.

**Parâmetros:**
- `id` (int) - ID do personagem a ser removido

**Resposta de Sucesso (200 OK)**:
```json
"Personagem Goku deletado com sucesso!"
```

**Resposta de Erro (404 Not Found)**:
```json
"Personagem não encontrado!"
```

## ✅ Validações Implementadas

### Modelo Personagem

O modelo `Personagem` possui as seguintes validações usando Data Annotations:

#### Campo: Nome
- ✅ **Required**: Campo obrigatório
- ✅ **MinLength**: Mínimo de 3 caracteres
- ✅ **MaxLength**: Máximo de 50 caracteres

**Mensagens de Erro**:
- `"Nome é um campo obrigatório!"` - Quando o campo está vazio
- `"Nome tem que ter no mínimo 3 letras"` - Quando tem menos de 3 caracteres
- `"Nome precisa ter no máximo 50 letras"` - Quando excede 50 caracteres

#### Campo: Tipo
- ✅ **Required**: Campo obrigatório
- ✅ **MaxLength**: Máximo de 50 caracteres

**Mensagens de Erro**:
- `"Tipo é um campo obrigatório!"` - Quando o campo está vazio
- `"Tipo precisa ter no máximo 50 caracteres"` - Quando excede 50 caracteres

#### Campo: Id
- ✅ **Key**: Chave primária (gerado automaticamente pelo banco)

### Comportamento das Validações

As validações são executadas automaticamente pelo ASP.NET Core quando:
1. Um novo personagem é criado via **POST**
2. Um personagem existente é atualizado via **PUT**

Se as validações falharem, a API retornará um erro **400 Bad Request** com os detalhes das violações.

## 📖 Exemplos de Uso

### cURL

#### 1. Listar todos os personagens

```bash
curl -X GET https://localhost:7010/api/personagens
```

#### 2. Buscar personagem por ID

```bash
curl -X GET https://localhost:7010/api/personagens/1
```

#### 3. Adicionar novo personagem

```bash
curl -X POST https://localhost:7010/api/personagens \
  -H "Content-Type: application/json" \
  -d "{\"nome\":\"Goku\",\"tipo\":\"Saiyajin\"}"
```

#### 4. Atualizar personagem

```bash
curl -X PUT https://localhost:7010/api/personagens/1 \
  -H "Content-Type: application/json" \
  -d "{\"nome\":\"Kakarotto\",\"tipo\":\"Saiyajin\"}"
```

#### 5. Deletar personagem

```bash
curl -X DELETE https://localhost:7010/api/personagens/1
```

### Postman

1. **Importar Collection**: Crie uma nova collection no Postman
2. **Configurar Variável**: Defina uma variável de ambiente `base_url` com valor `https://localhost:7010`
3. **Testar Endpoints**: Importe os requests acima substituindo a URL base pela variável

### Exemplo de Dados Válidos

```json
// ✅ VÁLIDO
{
  "nome": "Goku",
  "tipo": "Saiyajin"
}

// ✅ VÁLIDO
{
  "nome": "Piccolo",
  "tipo": "Namekuseijin"
}

// ❌ INVÁLIDO - Nome muito curto
{
  "nome": "Ab",
  "tipo": "Alien"
}

// ❌ INVÁLIDO - Nome muito longo (mais de 50 caracteres)
{
  "nome": "EsteNomeÈExtremamenteLongoEExcedeOLimiteDeCaracteresPermitidos",
  "tipo": "Saiyajin"
}

// ❌ INVÁLIDO - Nome ausente
{
  "tipo": "Saiyajin"
}

// ❌ INVÁLIDO - Tipo ausente
{
  "nome": "Goku"
}
```

## 📁 Estrutura do Projeto

```
ProjetoDBZ/
├── Controllers/
│   └── PersonagensController.cs    # Controller com todos os endpoints
├── Data/
│   └── AppDbContext.cs              # Contexto do Entity Framework
├── Models/
│   └── Personagem.cs                # Modelo de dados com validações
├── Migrations/
│   ├── 20251027203456_Inicial.cs   # Migração inicial do banco
│   └── AppDbContextModelSnapshot.cs # Snapshot do modelo
├── Properties/
│   └── launchSettings.json          # Configurações de inicialização
├── appsettings.json                 # Configurações da aplicação
├── Program.cs                       # Ponto de entrada da aplicação
└── ProjetoDBZ.csproj               # Arquivo de projeto
```

## 🔧 Comandos Úteis

### Executar Migrações

```bash
dotnet ef database update
```

### Criar Nova Migração

```bash
dotnet ef migrations add NomeDaMigracao
```

### Reverter Última Migração

```bash
dotnet ef database update NomeDaMigracaoAnterior
```

### Remover Última Migração

```bash
dotnet ef migrations remove
```

### Limpar e Recompilar

```bash
dotnet clean
dotnet build
```

## 🐛 Troubleshooting

### Erro de Conexão com o Banco de Dados

**Erro**: `Unable to connect to any of the specified MySQL hosts`

**Solução**:
1. Verifique se o MySQL está rodando
2. Confirme as credenciais em `appsettings.json`
3. Teste a conexão manualmente usando o MySQL Workbench

### Erro de Migração

**Erro**: `No migrations found`

**Solução**:
1. Certifique-se de estar na pasta raiz do projeto
2. Execute `dotnet ef migrations list` para verificar se existem migrações
3. Se necessário, crie uma nova migração com `dotnet ef migrations add NomeMigracao`

### Porta em Uso

**Erro**: `Address already in use`

**Solução**:
1. Altere a porta em `launchSettings.json`
2. Ou encerre o processo que está usando a porta

## 📄 Licença

Este projeto está sob a licença especificada no arquivo `LICENSE`.

## 👨‍💻 Autor

Desenvolvido como parte do projeto de aprendizado em ASP.NET Core e Entity Framework.

---

**Nota**: Este projeto utiliza autodeteção da versão do servidor MySQL através de `ServerVersion.AutoDetect()`. Certifique-se de que o servidor MySQL está acessível durante a inicialização da aplicação.

