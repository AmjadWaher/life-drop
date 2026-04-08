# Flutter Clean Architecture Rules

## General Rules
- Always follow Clean Architecture
- Separate code into layers:
  - presentation
  - domain
  - data
- Each layer must be independent

---

## Folder Structure

lib/
  features/
    feature_name/
      data/
        models/
        datasources/
        repositories/
      domain/
        entities/
        repositories/
        usecases/
      presentation/
        bloc/
        screens/
        widgets/

---

## Architecture Rules

### 1. Presentation Layer
- Just responsible for UI
- Use Bloc for state management
- No API calls here
- No business logic

### 2. Domain Layer
- Contain of:
  - Entities
  - UseCases
  - Repository interfaces
- Must be PURE Dart (no Flutter imports)
- No dependencies on other layers

### 3. Data Layer
- Contain of:
  - Models
  - API services
  - Repository implementations
- Responsible for:
  - API calls
  - Local storage

---

## Naming Conventions

- Entity: User
- Model: UserModel
- Repository: UserRepository
- Repository Impl: UserRepositoryImpl
- UseCase: GetUserUseCase

---

## State Management (Bloc)

- Use Cubit or Bloc
- Each feature has its own Bloc
- States must be immutable
- Use Equatable

---

## API Rules

- Use Dio for networking
- Endpoints must return ApiResult
- Handle errors using:
  - try/catch
  - custom exceptions

---

## Dependency Injection

- Use get_it
- Register:
  - repositories
  - usecases
  - blocs

---

## Code Generation Rules

- Do NOT mix layers
- Do NOT call API from UI
- Always create:
  - entity → model → repository → usecase → bloc → UI

---

## Example Flow

UI → Bloc → UseCase → Repository → DataSource → API

---

## Additional Rules

- Write clean and readable code
- Avoid duplication
- Follow SOLID principles
- Add comments for complex logic