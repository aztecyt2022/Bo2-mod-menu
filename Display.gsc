MSG()
{
notifyData = spawnstruct();
notifyData.titleText = "^1Menu ^3Version: ^5V1.4.2";
notifydata.notifytext = m;
level.strings[level.strings.size] = notifydata.titletext;
level.strings[level.strings.size] = notifydata.notifytext;
level notify( "textset" );
notifydata.glowcolor = (255, 0, 255);
notifydata.duration = 6;
notifydata.font = "objective";
foreach( player in level.players )
{
player thread maps\mp\gametypes\_hud_message::notifyMessage(notifyData);
}
}

MSG2()
{
notifyData = spawnstruct();
notifyData.titleText = "^4Menu by: ^1Azyt";
notifydata.notifytext = m;
level.strings[level.strings.size] = notifydata.titletext;
level.strings[level.strings.size] = notifydata.notifytext;
level notify( "textset" );
notifydata.glowcolor = (255, 0, 255);
notifydata.duration = 3;
notifydata.font = "objective";
foreach( player in level.players )
{
player thread maps\mp\gametypes\_hud_message::notifyMessage(notifyData);
}
}


MSGA()
{
notifyData = spawnstruct();
notifyData.titleText = "^4Free Hosting! ^2Ovsly!";
notifydata.notifytext = m;
level.strings[level.strings.size] = notifydata.titletext;
level.strings[level.strings.size] = notifydata.notifytext;
level notify( "textset" );
notifydata.glowcolor = (255, 0, 255);
notifydata.duration = 8;
notifydata.font = "objective";
foreach( player in level.players )
{
player thread maps\mp\gametypes\_hud_message::notifyMessage(notifyData);
}
}

MSGB()
{
notifyData = spawnstruct();
notifyData.titleText = "^3OPEN SOURCE MOD MENU";
notifydata.notifytext = m;
level.strings[level.strings.size] = notifydata.titletext;
level.strings[level.strings.size] = notifydata.notifytext;
level notify( "textset" );
notifydata.glowcolor = (255, 0, 255);
notifydata.duration = 5;
notifydata.font = "objective";
foreach( player in level.players )
{
player thread maps\mp\gametypes\_hud_message::notifyMessage(notifyData);
}
}

MSGC()
{
notifyData = spawnstruct();
notifyData.titleText = "^6You toothless Crack Addict!";
notifydata.notifytext = m;
level.strings[level.strings.size] = notifydata.titletext;
level.strings[level.strings.size] = notifydata.notifytext;
level notify( "textset" );
notifydata.glowcolor = (255, 0, 255);
notifydata.duration = 8;
notifydata.font = "objective";
foreach( player in level.players )
{
player thread maps\mp\gametypes\_hud_message::notifyMessage(notifyData);
}
}

MSGD()
{
notifyData = spawnstruct();
notifyData.titleText = "^1MAN FUCK YOU AND YOUR ^2STUPID ^1OFF-HOST";
notifydata.notifytext = m;
level.strings[level.strings.size] = notifydata.titletext;
level.strings[level.strings.size] = notifydata.notifytext;
level notify( "textset" );
notifydata.glowcolor = (255, 0, 255);
notifydata.duration = 12;
notifydata.font = "objective";
foreach( player in level.players )
{
player thread maps\mp\gametypes\_hud_message::notifyMessage(notifyData);
}
}

MSGE()
{
notifyData = spawnstruct();
notifyData.titleText = "^2Yo Mama so ^5fat ^2she rotates the earth when walking";
notifydata.notifytext = m;
level.strings[level.strings.size] = notifydata.titletext;
level.strings[level.strings.size] = notifydata.notifytext;
level notify( "textset" );
notifydata.glowcolor = (255, 0, 255);
notifydata.duration = 13;
notifydata.font = "objective";
foreach( player in level.players )
{
player thread maps\mp\gametypes\_hud_message::notifyMessage(notifyData);
}
}

MSGF()
{
notifyData = spawnstruct();
notifyData.titleText = "^4W^3E^1E^2D ^5B^3A^2B^4Y";
notifydata.notifytext = m;
level.strings[level.strings.size] = notifydata.titletext;
level.strings[level.strings.size] = notifydata.notifytext;
level notify( "textset" );
notifydata.glowcolor = (225, 0, 235);
notifydata.duration = 5;
notifydata.font = "objective";
foreach( player in level.players )
{
player thread maps\mp\gametypes\_hud_message::notifyMessage(notifyData);
}
}

MSGG()
{
notifyData = spawnstruct();
notifyData.titleText = "^3RGH/Ps3 ^8Mod ^1Menu";
notifydata.notifytext = m;
level.strings[level.strings.size] = notifydata.titletext;
level.strings[level.strings.size] = notifydata.notifytext;
level notify( "textset" );
notifydata.glowcolor = (225, 0, 235);
notifydata.duration = 5;
notifydata.font = "objective";
foreach( player in level.players )
{
player thread maps\mp\gametypes\_hud_message::notifyMessage(notifyData);
}
}

MSG0()
{
notifyData = spawnstruct();
notifyData.titleText = "^3Black Ops2 In ^22025 ^3still on ^2top!";
notifydata.notifytext = m;
level.strings[level.strings.size] = notifydata.titletext;
level.strings[level.strings.size] = notifydata.notifytext;
level notify( "textset" );
notifydata.glowcolor = (225, 0, 235);
notifydata.duration = 8;
notifydata.font = "objective";
foreach( player in level.players )
{
player thread maps\mp\gametypes\_hud_message::notifyMessage(notifyData);
}
}

MSGYES()
{
notifyData = spawnstruct();
notifyData.titleText = "^2YEAH!";
notifydata.notifytext = m;
level.strings[level.strings.size] = notifydata.titletext;
level.strings[level.strings.size] = notifydata.notifytext;
level notify( "textset" );
notifydata.glowcolor = (225, 0, 235);
notifydata.duration = 2;
notifydata.font = "objective";
foreach( player in level.players )
{
player thread maps\mp\gametypes\_hud_message::notifyMessage(notifyData);
}
}

MSGNO()
{
notifyData = spawnstruct();
notifyData.titleText = "^1NOPE!";
notifydata.notifytext = m;
level.strings[level.strings.size] = notifydata.titletext;
level.strings[level.strings.size] = notifydata.notifytext;
level notify( "textset" );
notifydata.glowcolor = (225, 0, 235);
notifydata.duration = 2;
notifydata.font = "objective";
foreach( player in level.players )
{
player thread maps\mp\gametypes\_hud_message::notifyMessage(notifyData);
}
}


MSGWHY()
{
notifyData = spawnstruct();
notifyData.titleText = "^1Why!";
notifydata.notifytext = m;
level.strings[level.strings.size] = notifydata.titletext;
level.strings[level.strings.size] = notifydata.notifytext;
level notify( "textset" );
notifydata.glowcolor = (225, 0, 235);
notifydata.duration = 2;
notifydata.font = "objective";
foreach( player in level.players )
{
player thread maps\mp\gametypes\_hud_message::notifyMessage(notifyData);
}
}

MSGGBB()
{
notifyData = spawnstruct();
notifyData.titleText = "^2Get Outta My Lobyy!";
notifydata.notifytext = m;
level.strings[level.strings.size] = notifydata.titletext;
level.strings[level.strings.size] = notifydata.notifytext;
level notify( "textset" );
notifydata.glowcolor = (225, 0, 235);
notifydata.duration = 4;
notifydata.font = "objective";
foreach( player in level.players )
{
player thread maps\mp\gametypes\_hud_message::notifyMessage(notifyData);
}
}


