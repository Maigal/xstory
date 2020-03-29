/// @description Insert description here
// You can write your code in this editor

if (isReal) {
	with(other) {
		if (!other.mobsHit[? uid] && other.mobCount > 0) {
			damageAmount = other.damageAmount
			statusAilment = none;
			event_user(0) // Trigger user event 0 of oMonster
			other.mobsHit[? uid] = true;
			other.mobCount -= 1;
		
			if (other.mobCount <= 0) {
				event_user(0)
			}
		}
	
	}
}
