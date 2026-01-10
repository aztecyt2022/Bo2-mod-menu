msg()
{
	notifydata = spawnstruct();
	notifydata.titletext = "^1Menu ^3Version: ^5V2.0.4";
	notifydata.notifytext = UNDEFINED_LOCAL;
	level.strings[level.strings.size] = notifydata.titletext;
	level.strings[level.strings.size] = notifydata.notifytext;
	level notify( "textset" );
	notifydata.glowcolor = ( 255, 0, 255 );
	notifydata.duration = 6;
	notifydata.font = "objective";
	foreach( player in level.players )
	{
		player thread notifymessage( notifydata );
	}

}

msg2()
{
	notifydata = spawnstruct();
	notifydata.titletext = "^4Menu by: ^1Azyt";
	notifydata.notifytext = UNDEFINED_LOCAL;
	level.strings[level.strings.size] = notifydata.titletext;
	level.strings[level.strings.size] = notifydata.notifytext;
	level notify( "textset" );
	notifydata.glowcolor = ( 255, 0, 255 );
	notifydata.duration = 3;
	notifydata.font = "objective";
	foreach( player in level.players )
	{
		player thread notifymessage( notifydata );
	}

}

msga()
{
	notifydata = spawnstruct();
	notifydata.titletext = "^4NO Payment in 2026 WHY!";
	notifydata.notifytext = UNDEFINED_LOCAL;
	level.strings[level.strings.size] = notifydata.titletext;
	level.strings[level.strings.size] = notifydata.notifytext;
	level notify( "textset" );
	notifydata.glowcolor = ( 255, 0, 255 );
	notifydata.duration = 8.5;
	notifydata.font = "objective";
	foreach( player in level.players )
	{
		player thread notifymessage( notifydata );
	}

}

msgb()
{
	notifydata = spawnstruct();
	notifydata.titletext = "^3OPEN SOURCE MENU";
	notifydata.notifytext = UNDEFINED_LOCAL;
	level.strings[level.strings.size] = notifydata.titletext;
	level.strings[level.strings.size] = notifydata.notifytext;
	level notify( "textset" );
	notifydata.glowcolor = ( 255, 0, 255 );
	notifydata.duration = 5;
	notifydata.font = "objective";
	foreach( player in level.players )
	{
		player thread notifymessage( notifydata );
	}

}

msgc()
{
	notifydata = spawnstruct();
	notifydata.titletext = "^6You toothless Crack Addict!";
	notifydata.notifytext = UNDEFINED_LOCAL;
	level.strings[level.strings.size] = notifydata.titletext;
	level.strings[level.strings.size] = notifydata.notifytext;
	level notify( "textset" );
	notifydata.glowcolor = ( 255, 0, 255 );
	notifydata.duration = 8;
	notifydata.font = "objective";
	foreach( player in level.players )
	{
		player thread notifymessage( notifydata );
	}

}

msgd()
{
	notifydata = spawnstruct();
	notifydata.titletext = "^3FUCK OFF HOE ASS BITCH";
	notifydata.notifytext = UNDEFINED_LOCAL;
	level.strings[level.strings.size] = notifydata.titletext;
	level.strings[level.strings.size] = notifydata.notifytext;
	level notify( "textset" );
	notifydata.glowcolor = ( 255, 0, 255 );
	notifydata.duration = 10;
	notifydata.font = "objective";
	foreach( player in level.players )
	{
		player thread notifymessage( notifydata );
	}

}

msge()
{
	notifydata = spawnstruct();
	notifydata.titletext = "^1R3D ^2AC1D ^6V2";
	notifydata.notifytext = UNDEFINED_LOCAL;
	level.strings[level.strings.size] = notifydata.titletext;
	level.strings[level.strings.size] = notifydata.notifytext;
	level notify( "textset" );
	notifydata.glowcolor = ( 255, 0, 255 );
	notifydata.duration = 6;
	notifydata.font = "objective";
	foreach( player in level.players )
	{
		player thread notifymessage( notifydata );
	}

}

msgf()
{
	notifydata = spawnstruct();
	notifydata.titletext = "^4W^3E^1E^2D ^5B^3A^2B^4Y";
	notifydata.notifytext = UNDEFINED_LOCAL;
	level.strings[level.strings.size] = notifydata.titletext;
	level.strings[level.strings.size] = notifydata.notifytext;
	level notify( "textset" );
	notifydata.glowcolor = ( 225, 0, 235 );
	notifydata.duration = 5;
	notifydata.font = "objective";
	foreach( player in level.players )
	{
		player thread notifymessage( notifydata );
	}

}

msgg()
{
	notifydata = spawnstruct();
	notifydata.titletext = "^3RGH/Ps3 ^8Mod ^1Menu";
	notifydata.notifytext = UNDEFINED_LOCAL;
	level.strings[level.strings.size] = notifydata.titletext;
	level.strings[level.strings.size] = notifydata.notifytext;
	level notify( "textset" );
	notifydata.glowcolor = ( 225, 0, 235 );
	notifydata.duration = 5;
	notifydata.font = "objective";
	foreach( player in level.players )
	{
		player thread notifymessage( notifydata );
	}

}

msg0()
{
	notifydata = spawnstruct();
	notifydata.titletext = "^3Black Ops2 In ^22026 ^3still on ^2top!";
	notifydata.notifytext = UNDEFINED_LOCAL;
	level.strings[level.strings.size] = notifydata.titletext;
	level.strings[level.strings.size] = notifydata.notifytext;
	level notify( "textset" );
	notifydata.glowcolor = ( 225, 0, 235 );
	notifydata.duration = 8;
	notifydata.font = "objective";
	foreach( player in level.players )
	{
		player thread notifymessage( notifydata );
	}

}

msgyes()
{
	notifydata = spawnstruct();
	notifydata.titletext = "^2YEAH!";
	notifydata.notifytext = UNDEFINED_LOCAL;
	level.strings[level.strings.size] = notifydata.titletext;
	level.strings[level.strings.size] = notifydata.notifytext;
	level notify( "textset" );
	notifydata.glowcolor = ( 225, 0, 235 );
	notifydata.duration = 2;
	notifydata.font = "objective";
	foreach( player in level.players )
	{
		player thread notifymessage( notifydata );
	}

}

msgno()
{
	notifydata = spawnstruct();
	notifydata.titletext = "^1NOPE!";
	notifydata.notifytext = UNDEFINED_LOCAL;
	level.strings[level.strings.size] = notifydata.titletext;
	level.strings[level.strings.size] = notifydata.notifytext;
	level notify( "textset" );
	notifydata.glowcolor = ( 225, 0, 235 );
	notifydata.duration = 2;
	notifydata.font = "objective";
	foreach( player in level.players )
	{
		player thread notifymessage( notifydata );
	}

}

msgwhy()
{
	notifydata = spawnstruct();
	notifydata.titletext = "^1Why!";
	notifydata.notifytext = UNDEFINED_LOCAL;
	level.strings[level.strings.size] = notifydata.titletext;
	level.strings[level.strings.size] = notifydata.notifytext;
	level notify( "textset" );
	notifydata.glowcolor = ( 225, 0, 235 );
	notifydata.duration = 2;
	notifydata.font = "objective";
	foreach( player in level.players )
	{
		player thread notifymessage( notifydata );
	}

}

msggbb()
{
	notifydata = spawnstruct();
	notifydata.titletext = "^2Get Outta My lobby bish!";
	notifydata.notifytext = UNDEFINED_LOCAL;
	level.strings[level.strings.size] = notifydata.titletext;
	level.strings[level.strings.size] = notifydata.notifytext;
	level notify( "textset" );
	notifydata.glowcolor = ( 225, 0, 235 );
	notifydata.duration = 6;
	notifydata.font = "objective";
	foreach( player in level.players )
	{
		player thread notifymessage( notifydata );
	}

}

msgga1()
{
	notifydata = spawnstruct();
	notifydata.titletext = "^3SHUT THE ^1FUCK ^3UP!";
	notifydata.notifytext = UNDEFINED_LOCAL;
	level.strings[level.strings.size] = notifydata.titletext;
	level.strings[level.strings.size] = notifydata.notifytext;
	level notify( "textset" );
	notifydata.glowcolor = ( 225, 0, 235 );
	notifydata.duration = 4;
	notifydata.font = "objective";
	foreach( player in level.players )
	{
		player thread notifymessage( notifydata );
	}

}

msgga2()
{
	notifydata = spawnstruct();
	notifydata.titletext = "^3Listen To This moron!!";
	notifydata.notifytext = UNDEFINED_LOCAL;
	level.strings[level.strings.size] = notifydata.titletext;
	level.strings[level.strings.size] = notifydata.notifytext;
	level notify( "textset" );
	notifydata.glowcolor = ( 225, 0, 235 );
	notifydata.duration = 6;
	notifydata.font = "objective";
	foreach( player in level.players )
	{
		player thread notifymessage( notifydata );
	}

}



//Vision are below here!







BWV()
{
    self endon("disconnect");
    self endon("death");
    
	if(self.bw == true)
	{
		self useServerVisionSet(true);
		self SetVisionSetforPlayer("mpintro", 0);
		self iPrintln("^1Black & White ^2[On]");
		self.bw = false;
	}
	else
	{
		self useServerVisionSet(false);
		self iPrintln("^2Black & White ^1[Off]");
		self.bw = true;
	}
}

LVis()
{
    self endon("disconnect");
    self endon("death");
    
	if(self.lv == true)
	{
		self useServerVisionSet(true);
		self SetVisionSetforPlayer("taser_mine_shock", 0);
		self iPrintln("^1Light Vision ^2[On]");
		self.lv = false;
	}
	else
	{
		self useServerVisionSet(false);
		self iPrintln("^2Light Vision ^1[Off]");
		self.lv = true;
	}
}

EV()
{
    self endon("disconnect");
    self endon("death");
    
	if(self.ev == true)
	{
		self useServerVisionSet(true);
		self SetVisionSetforPlayer("remote_mortar_enhanced", 0);
		self iPrintln("^1Enhanced Vision ^2[On]");
		self.ev = false;
	}
	else
	{
		self useServerVisionSet(false);
		self iPrintln("^2Enhanced Vision ^1[Off]");
		self.ev = true;
	}
}

infrarV()
{
    self endon("disconnect");
    self endon("death");
    
	if(self.infrarv == true)
	{
		self setinfraredvision(true);
		self iPrintln("^1Infrared Vision ^2[On]");
		self.infrarv = false;
	}
	else
	{
		self setinfraredvision(false);
		self iPrintln("^2Infrared Vision ^1[Off]");
		self.infrarv = true;
	}
}

WVis()
{
    self endon("disconnect");
    self endon("death");
    
    if(self isHost())
    {
	if(self.wv == true)
	{
		self useServerVisionSet(true);
		setdvar("r_waterSheetingFX_enable", "1");
		self iPrintln("^1Water Vision ^2[On]");
		self.wv = false;
	}
	else
	{
		self useServerVisionSet(false);
		setdvar("r_waterSheetingFX_enable", "0");
		self iPrintln("^2Water Vision ^1[Off]");
		self.wv = true;
	}
	}
	else
	    self iprintln("You must be ^5Host ^7to do that");
}

PVis()
{
    self endon("disconnect");
    self endon("death");
    
    if(self isHost())
    {
	if(self.pv == true)
	{
		self useServerVisionSet(true);
		setdvar("r_poisonFX_debug_enable", "1");
		self iPrintln("^1Poison Vision ^2[On]");
		self.pv = false;
	}
	else
	{
		self useServerVisionSet(false);
		setdvar("r_poisonFX_debug_enable", "0");
		self iPrintln("^2Poison Vision ^1[Off]");
		self.pv = true;
	}
	}
	else
	    self iprintln("You must be ^2Host ^7to do that");
}





