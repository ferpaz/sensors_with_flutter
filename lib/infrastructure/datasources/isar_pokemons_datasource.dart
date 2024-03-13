import 'package:isar/isar.dart';
import 'package:miscelaneos/domain/domain.dart';
import 'package:path_provider/path_provider.dart';

class IsarPokemonsDatasource implements LocalPokemonsDatasourceBase {
  late Future<Isar> db;

  IsarPokemonsDatasource() {
    db = openIsar();
  }

  Future<Isar> openIsar() async {
    return await Isar.open(
        [PokemonSchema],
        directory: (await getApplicationDocumentsDirectory()).path,
    );
  }

  @override
  Future<void> insertPokemon(Pokemon pokemon) async {
    final isar = await db;

    final done = isar.writeTxnSync(()  => isar.pokemons.putSync(pokemon));

    print ('Native: insert done: $done');
  }

  @override
  Future<List<Pokemon>> loadPokemons() async {
    final isar = await db;

    return isar.pokemons.where().findAll();

  }

  @override
  Future<int> pokemonsCount() async {
    final isar = await db;

    return isar.pokemons.count();
  }
}
