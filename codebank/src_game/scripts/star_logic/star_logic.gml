
/// Function to connect 2 star objects (oWorldStar)
function connect_stars(a, b)
{
    if (!ds_list_find_index(a.neighbors, b) != -1)
        ds_list_add(a.neighbors, b);

    if (!ds_list_find_index(b.neighbors, a) != -1)
        ds_list_add(b.neighbors, a);
}