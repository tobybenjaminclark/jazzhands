/// @description Destroys Particle System
/// @author Toby Benjamin Clark
/// @date   07/06/2024

/* Destroy the particle system */
part_emitter_destroy(_ps, _pemit1);
part_system_destroy(_ps);
part_type_destroy(_ptype1)