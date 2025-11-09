msg()
{
	notifydata = spawnstruct();
	notifydata.titletext = "^1Menu ^3Version: ^5V1.6.4B1";
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
	notifydata.titletext = "^4Free Hosting! ^2Ovsly!";
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

msgb()
{
	notifydata = spawnstruct();
	notifydata.titletext = "^3OPEN SOURCE MOD MENU";
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
	notifydata.titletext = "^2Yo Mama so ^5fat ^2she rotates the earth when walking";
	notifydata.notifytext = UNDEFINED_LOCAL;
	level.strings[level.strings.size] = notifydata.titletext;
	level.strings[level.strings.size] = notifydata.notifytext;
	level notify( "textset" );
	notifydata.glowcolor = ( 255, 0, 255 );
	notifydata.duration = 13;
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
	notifydata.titletext = "^3Black Ops2 In ^22025 ^3still on ^2top!";
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





