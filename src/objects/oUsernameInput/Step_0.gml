/// @description Insert description here
// You can write your code in this editor

///Text Input Step Script
//check if box is focused
if (focus = true)
   {
     //if is focused, check for user hitting enter to stop input
     if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed (vk_tab))
         {
           //stop focus on player hitting enter
              focus = false;
         }
     //Get input up to max characters.
       if (string_length(input)<maxCharacters)
         {
              input = keyboard_string;
         }
      /* If they entered max characters no longer get input unless
        it is backspace, then delete the last character and set
       the keyboard_string to the previous characters. */
       else if (keyboard_check_pressed(vk_backspace))
        {
            input = string_delete(input,maxCharacters,1);
            keyboard_string = input;
        }
 }