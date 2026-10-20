# GemStore – Laborator 3

Aplicatie Flutter (continuarea laboratorului 2) cu **State Management (Cubit / flutter_bloc)**
si **programare asincrona**: produsele sunt citite dintr-un fisier JSON inclus in proiect.

## Functionalitati

- Datele sunt incarcate asincron din `assets/data/products.json` (`ProductRepository`).
- Starile aplicatiei: **Loading**, **Success**, **Empty**, **Error** (cu buton *Try again*).
- **Cautare** dupa nume/descriere, **filtrare** pe categorii, **sortare**
  (Popular, Newest, pret crescator/descrescator, Top rated, Name A-Z).
- **Favorite**: adaugare/eliminare din orice ecran, ecran separat *Favorites* cu badge cu numarul lor.
- **Navigare** catre pagina de detalii a produsului (id-ul e trimis ca argument al rutei).

## Structura

```
lib/
  main.dart                 # MultiBlocProvider + rutele aplicatiei
  routes.dart               # numele rutelor si Routes.openProduct
  models/                   # Product, Review, Category (cu fromJson)
  data/
    catalog.dart            # datele parsate din JSON
    product_repository.dart # incarcarea asincrona a fisierului JSON
  cubits/
    products/               # ProductsCubit + ProductsState (status, cautare, filtru, sortare)
    favorites/              # FavoritesCubit (id-urile produselor favorite)
  screens/                  # Home, Discover (catalog), Favorites, Product
  widgets/
    common/                 # LoadingView, EmptyView, ErrorView, FavoriteButton, ScreenHeader
    catalog/                # SearchField, CategoryChips, SortMenu, ProductGridCard
    home/ product/          # componentele ecranelor din laboratorul 2
assets/data/products.json   # datele aplicatiei
```

## Rulare

```bash
flutter pub get
flutter run
flutter test   # testele pentru Cubit, repository si ecrane
```
