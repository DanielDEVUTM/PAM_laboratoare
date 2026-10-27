# GemStore – Laborator 3

Aplicatie Flutter (continuarea laboratorului 2) cu **State Management (Cubit / flutter_bloc)**
si **programare asincrona**: toate datele (Home + pagina produsului) sunt citite din fisierul
`assets/data/lab_v1.json` (varianta 1). Pozele sunt URL-uri din JSON, deci aplicatia are nevoie de internet.

## Functionalitati

- Datele sunt incarcate asincron din `assets/data/lab_v1.json` (`ProductRepository`).
- Starile aplicatiei: **Loading**, **Success**, **Empty**, **Error** (cu buton *Try again*).
- **Cautare** dupa nume/descriere, **filtrare** pe sectiuni (Feature Products, Recommended, Similar),
  **sortare** (ordinea din JSON, pret crescator/descrescator, Name A-Z / Z-A).
- **Favorite**: adaugare/eliminare din orice ecran, ecran separat *Favorites* cu badge cu numarul lor
  (produsul cu `"isFavorite": true` din JSON e favorit de la inceput).
- **Navigare** catre pagina de detalii a produsului (id-ul e trimis ca argument al rutei).

## Structura

```
lib/
  main.dart                 # MultiBlocProvider + rutele aplicatiei
  routes.dart               # numele rutelor si Routes.openProduct
  models/                   # Product, Review, Category, HeroBanner, Collection, CategoryPromo (cu fromJson)
  data/
    catalog.dart            # datele parsate din JSON (homePage + productPage)
    product_repository.dart # incarcarea asincrona a fisierului JSON
  cubits/
    products/               # ProductsCubit + ProductsState (status, cautare, filtru, sortare)
    favorites/              # FavoritesCubit (id-urile produselor favorite)
  screens/                  # Home, Discover (catalog), Favorites, Product
  widgets/
    common/                 # AppImage, LoadingView, EmptyView, ErrorView, FavoriteButton, ScreenHeader
    catalog/                # SearchField, FilterChips, SortMenu, ProductGridCard
    home/ product/          # componentele ecranelor din laboratorul 2
assets/data/lab_v1.json     # datele aplicatiei (varianta 1)
```

## Rulare

```bash
flutter pub get
flutter run
flutter test   # testele pentru Cubit, repository si ecrane
```
