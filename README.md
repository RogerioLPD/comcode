# Comcode

Site institucional responsivo da Comcode, desenvolvido em Flutter e disponível
em português e inglês.

## Arquitetura

O projeto adota uma arquitetura **feature-first** pragmática. Cada
funcionalidade mantém sua interface e, quando necessário, suas camadas de dados
e domínio próximas entre si. Elementos globais ficam separados em `app`,
`core` e `shared`.

```text
lib/
├── app/
│   ├── app.dart
│   └── router/
├── core/
│   ├── localization/
│   │   ├── arb/
│   │   └── generated/
│   └── theme/
├── features/
│   ├── cases/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   ├── consultation/
│   ├── differentials/
│   ├── home/
│   └── services/
├── shared/
│   └── widgets/
└── main.dart
```

### Responsabilidades

- `app`: composição da aplicação e configuração de rotas.
- `core`: recursos globais sem vínculo com uma funcionalidade específica,
  como tema e localização.
- `features`: código organizado por capacidade de negócio.
- `shared`: componentes visuais reutilizados por várias funcionalidades.
- `main.dart`: ponto de entrada mínimo da aplicação.

## Comandos

```bash
flutter pub get
flutter gen-l10n
dart format lib test
flutter analyze
flutter test
flutter build web
```

## Localização

Os arquivos editáveis ficam em `lib/core/localization/arb`. Os arquivos em
`lib/core/localization/generated` são gerados pelo Flutter e não devem ser
editados manualmente.
