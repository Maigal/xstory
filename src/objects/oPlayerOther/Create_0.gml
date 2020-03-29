/// @description Insert description here
// You can write your code in this editor

skeleton_animation_mix("idle", "run", 0.2)
skeleton_animation_mix("idle", "jump", 0.03)
skeleton_animation_mix("run", "idle", 0.03)
skeleton_animation_mix("run", "jump", 0.03)
skeleton_animation_mix("run", "fall", 0.03)
skeleton_animation_mix("jump", "fall", 0.03)
skeleton_animation_mix("fall", "idle", 0.03)
skeleton_animation_mix("fall", "run", 0.03)
skeleton_animation_mix("attack_sword_1", "idle", 0.03)
skeleton_animation_mix("idle", "attack_sword_1", 0.03)
skeleton_animation_set("idle")
image_speed = 3;

animation = "idle";

currentMessage = "";
usernameTag = "";

projectileCount = 1;
