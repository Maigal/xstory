/// @description Insert description here
// You can write your code in this editor



input = keyboard_string;

/* If they entered max characters no longer get input unless
it is backspace, then delete the last character and set
the keyboard_string to the previous characters. */
if (keyboard_check_pressed(vk_backspace))
{
    input = string_delete(input,string_length(input),1);
    keyboard_string = input;
}
