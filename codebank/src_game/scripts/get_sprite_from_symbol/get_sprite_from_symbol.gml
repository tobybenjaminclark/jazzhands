/// @description Maps Sprites to Symbols
/// @author Toby Benjamin Clark
/// @date   14/01/2023

/**
 * Retrieves the corresponding sprite based on the provided symbol from the spawner instance.
 * @param {object} spawner_instance  - The instance of the spawner object.
 * @param {string} symbol            - The symbol representing the desired sprite.
 * @returns {sprite}                 The sprite associated with the given symbol or sprUnknownSymbol
 */
function get_sprite_from_symbol(spawner_instance, symbol)
{
	switch(symbol)
	{
		case "OPEN_PALM":
			return spawner_instance.sprite_open_palm;
		case "CLOSED_FIST":
			return spawner_instance.sprite_closed_fist;
		case "VICTORY":
			return spawner_instance.sprite_victory;
		case "POINTING_UP":
			return spawner_instance.sprite_pointing_up;
		case "THUMBS_DOWN":
			return spawner_instance.sprite_thumbs_down;
		case "THUMBS_UP":
			return spawner_instance.sprite_thumbs_up;
		default:
			return sprUnknownSymbol;
	}
}