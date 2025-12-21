doKillstreaks()
{
	self iPrintln("Max Killstreaks ^2Set");
	maps/mp/gametypes/_globallogic_score::_setplayermomentum(self,9999);
}

GiveUAV()
{
    self GiveKillstreak("killstreak_spyplane");
    self iPrintln("UAV Given");
}
GiveRC()
{
    self GiveKillstreak("killstreak_rcbomb");
    self iPrintln("RC-XD Given");
}
GiveGuard()
{
    self GiveWeapon("microwaveturret_mp");
    self switchToWeapon( "microwaveturret_mp" );
    self iPrintln("Gaurdian Given");
}
GiveHell()
{
    self GiveKillstreak("killstreak_remote_missile");
    self iPrintln("Hellstorm Missle Given");
}
GiveAG()
{
    self giveWeapon( "ai_tank_drop_mp" );
    self switchToWeapon( "ai_tank_drop_mp" );
    self iPrintln("A.G.R Given");
}
GiveSC()
{
    self GiveKillstreak("killstreak_helicopter_comlink");
    self iPrintln("Stealth Chopper Given");
}
GiveVSAT()
{
    self GiveKillstreak("killstreak_spyplane_direction");
    self iPrintln("Orbital VSAT Given");
}
GiveED()
{
    self GiveKillstreak("killstreak_helicopter_guard");
    self iPrintln("Escort Drone Given");
}
GiveEMP()
{
    self giveWeapon( "emp_mp" );
    self switchToWeapon( "emp_mp" );
    self iPrintln("EMP System Given");
}
GiveWH()
{
    self GiveKillstreak("killstreak_straferun");
    self iPrintln("Warthog Given");
}
GiveLST()
{
    self GiveKillstreak("killstreak_remote_mortar");
    self iPrintln("Lodestar Given");
}
GiveVW()
{
    self giveWeapon( "helicopter_player_gunner_mp" );
    self switchToWeapon( "helicopter_player_gunner_mp" );
    self iPrintln("VTOL Warship Given");
}
GiveDogs()
{
    self maps/mp/killstreaks/_killstreaks::givekillstreak("dogs_mp", 5594, true, 5594);
    self iPrintln("Dogs Given");
}

GiveSwarm()
{
    self GiveKillstreak("killstreak_missile_swarm");
    self iPrintln("Swarm Given");
}

