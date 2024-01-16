/// @description Importing `.wav` file & stripping header.
/// @author Toby Benjamin Clark/kupo15
/// @date   14/01/2023

function wav_get_sample_rate(buffer)
{
    
    var _b_25 = buffer_peek(buffer,24,buffer_u8);
    var _b_26 = buffer_peek(buffer,25,buffer_u8);
    var _b_27 = buffer_peek(buffer,26,buffer_u8);
    var _b_28 = buffer_peek(buffer,27,buffer_u8);

    var _sr = (_b_28 << 24) | (_b_27 << 16) | (_b_26 << 8) | _b_25;
    return _sr;
}

function import_wav_trimmed(filename)
{
    var buffer_init = buffer_load(filename);
    var buffer_size = buffer_get_size(buffer_init);
    var channels = buffer_peek(buffer_init,22,buffer_u8);
    var sampleRate = wav_get_sample_rate(buffer_init);

    // seek to the beginning
    buffer_seek(buffer_init,buffer_seek_start,0);
   
    var arr = [100,97,116,97];
    var arrIndex = 0;
    var offset = 0;
   
    // loop through each buffer byte
    for (var i=0;i<buffer_size;i++)
	{
       
	    var arrValue = arr[arrIndex]
	    var dataValue = buffer_peek(buffer_init,i,buffer_u8);
	    var dataFound = (dataValue == arrValue);
       
	    if i >=25 && i <= 28
			show_debug_message(string(i+1)+": "+string(dataValue))
       
		if(dataFound) arrindex = arrIndex + 1;
		else arrIndex = 0;

	    // found end of header
	    if (arrIndex == array_length(arr))
		{
           
	        var offset = i+5;
	        break;
	   }
	}
       
    // use buffer fast instead
    buffer_size -= offset;
    var buffer = buffer_create(buffer_size,buffer_fast,1);
   
    buffer_copy(buffer_init,offset,buffer_size,buffer,0);
    buffer_delete(buffer_init);
       
    var channelType = audio_mono;

    if (channels == 2)
    channelType = audio_stereo;

    var snd = audio_create_buffer_sound(buffer,buffer_s16,sampleRate,0,buffer_size,channelType);
    return snd;
}