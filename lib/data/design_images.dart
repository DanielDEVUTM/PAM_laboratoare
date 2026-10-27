/// Pozele din macheta Figma (assets/images), dupa id-urile din JSON.
///
/// Textele, preturile si restul datelor vin din `lab_v1.json`, dar pozele
/// raman cele din macheta, ca designul sa fie identic. Pentru un id fara
/// poza locala se foloseste URL-ul din JSON.
class DesignImages {
  DesignImages._();

  static const String _dir = 'assets/images';

  static const Map<String, String> _byId = {
    // Home
    'autumn-collection-2021': '$_dir/banner.jpg',
    'newCollection': '$_dir/new_collection.jpg',
    'c001': '$_dir/collection_1.jpg',
    'c002': '$_dir/collection_2.jpg',
    'cp001': '$_dir/collection_3.jpg',
    'cp002': '$_dir/collection_4.jpg',
    // Produse
    'p001': '$_dir/feature_1.jpg',
    'p002': '$_dir/feature_2.jpg',
    'p003': '$_dir/feature_3.jpg',
    'p004': '$_dir/recommended_1.jpg',
    'p005': '$_dir/recommended_2.jpg',
    'p006': '$_dir/similar_1.jpg',
    'p007': '$_dir/similar_2.jpg',
    'p008': '$_dir/similar_3.jpg',
    // Recenzii
    'r001': '$_dir/avatar_1.jpg',
    'r002': '$_dir/avatar_2.jpg',
  };

  /// Poza mare din pagina de detalii (fara fundal, ca in macheta).
  static const Map<String, String> _heroById = {
    'p003': '$_dir/product_hero.png',
  };

  static String of(String id, String url) => _byId[id] ?? url;

  static String heroOf(String id, String url) => _heroById[id] ?? of(id, url);
}
