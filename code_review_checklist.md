# Code Review Checklist 
**Squad responsável pelo Code Review:** F12

**Squad avaliado:** TestMasters


## ✅ Pontos Positivos

- [x] **Separação clara de responsabilidades** - Testes separados por funcionalidade (login, cadastro, produtos, etc.)
- [x] **Uso de resources** - Implementação de Page Object através de arquivos .resource
- [x] **Estrutura de diretórios organizada** - Separação entre tests/ e resources/
- [x] **Uso de tags** - Testes categorizados com tags apropriadas
- [x] **Setup e Teardown** - Configuração adequada de inicialização e finalização
- [x] **Uso de FakerLibrary** - Geração de dados dinâmicos para testes
- [x] **Screenshots** - Take Screenshot configurado no teardown
- [x] **Uso de checkpoints** - Verificações de estado dos elementos
- [x] **Dados estruturados** - Uso de Dictionary para organizar dados de teste

## ⚠️ Pontos de Melhoria

- [ ] **Falta de abstração** - Keywords muito específicas, pouca reutilização
- [ ] **Mistura de responsabilidades** - Lógica de negócio misturada com interações de UI
- [ ] **Centralização de imports** - Os imports são feitos em cada arquivo .resource, os quais podiam estar organizados em um único arquivo que é importado pelos arquivos .resource
- [ ] **Inconsistência de nomenclatura** - Mistura de português/inglês na definição das keywords
- [ ] **Seletores frágeis** - Uso excessivo de XPath complexos
- [ ] **Duplicação de código** - Keywords similares em diferentes resources
- [ ] **Falta de constantes** - Seletores repetidos sem centralização
- [ ] **Validações limitadas** - Poucas verificações de resultado
- [ ] **Dados de teste fixos** - Alguns valores hardcoded (ex: "Mouse Gamer RGB")
- [ ] **Nomes de arquivos inconsistentes** - Arquivos com nome inconsistente com os elementos contidos no interior. Por exemplo: arquivo campos.resource com keyword de validação genérica de mensagens de erro
- [ ] **Organização confusa de fixtures** - Algumas fixtures se encontram dentro do diretório resources enquanto outras no diretório específico para fixtures
- [ ] **Keywords de validação misturadas** - Muitas keywords responsáveis pela validação dos dados estão inseridas dentro de resources específicos para preenchimento de informações para os testes, as mensagens de validação poderiam ser unidas em um arquivo apenas
- [ ] **Arquivo de resultados** - O arquivo de resultados foi inserido no repositório, entretanto, com base em boas práticas de organização de código, o mais adequado seria não incluí-lo, uma vez que a aplicação pode ser atualizada e as informações contidas nos reports da pasta de resultados se tornam inconsistentes
- [ ] **Localização dos resultados** - Dois arquivos de resultados podem ser encontrados no repositório, o que pode gerar confusão 
- [ ] **Organização das branches** - As branches poderiam ser organizadas de acordo com cada tipo de teste realizado, por exemplo, uma branch para testes de login, outra para testes de cadastro, etc, para facilitar a leitura dos testes desenvolvidos por módulos de funcionalidades da aplicação
- [ ] **Pull Requests** - Algumas pull requests estão muito redundantes, os commits poderiam ser centralizados em apenas uma pr por suites de testes, facilitando a futura revisão para merge

## 🎯 Próximos Passos

1. Refatorar testes para garantir independência
2. Implementar Page Object mais robusto
3. Padronizar nomenclatura e estrutura
4. Centralizar dados e seletores
5. Melhorar cobertura de validações
6. Utilizar .gitignore para previnir a subida de arquivos de resultados