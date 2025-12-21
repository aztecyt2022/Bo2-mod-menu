SlotDisabled() // An Option to use when a Mod is glitchy after adding.Used for temp disable while fix is applied.
{
  self iprintlnbold("^1NOTICE: ^2This Option is disabled."); 
  wait 0.5;
  self iprintlnbold("^3As it can cause Crashing/Freezing of the game or console."); 
  wait 2;
}


SlotEmpty() // Placed where an options will be going.
{
  self iprintlnbold("^1NOTICE: ^2You have selected a blank option."); 
  wait 1;
  self iprintlnbold("^3There is no mod here."); 
  wait 2;
  self iprintlnbold("^4Check download page for updates");
}  



BOT2INFO() // Placed where an options will be going.
{
  self iprintlnbold("^2Note: Spawing above regular game limits."); 
  wait 1;
  self iprintlnbold("^3Will prevent peoples names from showing."); 
  wait 2;
  self iprintlnbold("^4In the players list menu.");
  wait 3;
  self iprintlnbold("^2If error happens Reduce player/bot count..");
}




Ceers() //Used for when you put a seperator in your menu(This is not needed but makes it easier you can remove or ignore it)
{
  self iprintln("^2Menu Bar/Splitter"); 
} 


God_Toggle()
{
	if( self.god == 0 )
	{
		self iprintln("^1GodMode : ^2[ON]");
		self enableinvulnerability();
		self.god = 1;
	}
	else
	{
		self iprintln("^2GodMode : ^1[OFF]");
		self disableinvulnerability();
		self.god = 0;
	}

}

alwaysVSAT()
{
        if(self.vsatOn == 0)
        {
                self.vsatOn = 1;
                self thread doVSATv2();
                self iPrintln("^1Advanced UAV ^2[ON]");
        }
        else
        {
                self.vsatOn = 0;
                self notify("stop_VSAT");
                self iPrintln("^2Advanced UAV ^1[OFF]");
        }
}
doVSATv2()
{
        self endon("disconnect");
        self endon("stop_VSAT");
        for(;;)
        {
                self maps\mp\killstreaks\_spyplane::callsatellite("radardirection_mp");
                wait 40;
        }
}


NoclipMode()
{
if(self.UFOMode == false)
{
self thread doUFOMode();
self.NoclipMode = true;
self iPrintln("^1Press [{+smoke}] To Fly Around!");
}
else
{
self notify("EndUFOMode");
self.NoclipMode = false;
self iPrintln("^2Noclip ^1[OFF]");
}
}

doUFOMode()
{
self endon("death");
self endon("EndUFOMode");
self.Fly = 0;
UFO = spawn("script_model",self.origin);
for(;;)
{
if(self SecondaryOffHandButtonPressed())
{
self playerLinkTo(UFO);
self.Fly = 1;
}
else
{
self unlink();
self.Fly = 0;
}
if(self.Fly == 1)
{
Fly = self.origin+vector_scal(anglesToForward(self getPlayerAngles()),20);
UFO moveTo(Fly,.01);
}
wait .001;
}
}

vector_scal(vec, scale)
{
vec = (vec[0] * scale, vec[1] * scale, vec[2] * scale);
return vec;
}


ToggleUAV()
{
self endon("death");
if(self.uav == true)
{
self iPrintln("^1Constant UAV ^2[ON]");
self setclientuivisibilityflag("g_compassShowEnemies", 1);
self.uav = false;
}
else
{
self iPrintln("^2Constant UAV ^1[OFF]");
self setclientuivisibilityflag("g_compassShowEnemies", 0);
self.uav = true;
}
}


ToggleLeft()
{
if(self.LG == true)
    {
        self iPrintln("^1Left Sided Gun: ^2[ON]");
        setDvar("cg_gun_y", "7");
        self.LG = false;
    }
    else
    {
        self iPrintln("^2Left Sided Gun: ^1[OFF]");
        setDvar("cg_gun_y", "0");
        self.LG = true;
    }
}


flashfeed2()
{
	if( self ishost() )
	{
		if( self.flashfeed2 == 0 )
		{
			self thread flashfeed();
			self.flashfeed2 = 1;
			self iprintln( "^1Flash Feed : ^2[ON]" );
		}
		else
		{
			self notify( "FlashFeed2_end" );
			self.flashfeed2 = 0;
			self iprintln( "^2Flash Feed : ^1[OFF]" );
		}
	}
	else
	{
		self iprintln( "^1Only The Host Can Enter This Function" );
	}

}

flashfeed()
{
	self endon( "disconnect" );
	self endon( "FlashFeed2_end" );
	for(;;)
	{
	setdvar( "g_TeamColor_Axis", "1 0 0 1" );
	setdvar( "g_TeamColor_Allies", "1 0 0 1" );
	wait 0.2;
	setdvar( "g_TeamColor_Axis", "1 0.7 0 1" );
	setdvar( "g_TeamColor_Allies", "1 0.7 0 1" );
	wait 0.2;
	setdvar( "g_TeamColor_Axis", "1 1 0 1" );
	setdvar( "g_TeamColor_Allies", "1 1 0 1" );
	wait 0.2;
	setdvar( "g_TeamColor_Axis", "0 1 0 1" );
	setdvar( "g_TeamColor_Allies", "0 1 0 1" );
	wait 0.2;
	setdvar( "g_TeamColor_Axis", "0 0 1 1" );
	setdvar( "g_TeamColor_Allies", "0 0 1 1" );
	wait 0.2;
	setdvar( "g_TeamColor_Axis", "1 0 1 1" );
	setdvar( "g_TeamColor_Allies", "1 0 1 1" );
	wait 0.2;
	setdvar( "g_TeamColor_Axis", "0 1 1 1" );
	setdvar( "g_TeamColor_Allies", "0 1 1 1" );
	wait 0.1;
	}

}


flashlowammo()
{
	if( self.flashingammo == 1 )
	{
		self thread lowammoflash();
		self iprintln( "^1Flashing Low Ammo ^2[ON]" );
		self.flashingammo = 0;
	}
	else
	{
		self notify( "StopFlash" );
		self iprintln( "^2Flashing Low Ammo ^1[OFF]" );
		self.flashingammo = 1;
	}

}
lowammoflash()
{
	self endon( "disconnect" );
	self endon( "StopFlash" );
	while( 1 )
	{
		setdvar( "lowAmmoWarningColor1", "1 0 0 1" );
		setdvar( "lowAmmoWarningNoAmmoColor1", "1 0 0 1" );
		setdvar( "lowAmmoWarningNoReloadColor1", "1 0 0 1" );
		wait 0.2;
		setdvar( "lowAmmoWarningColor1", "1 0.7 0 1" );
		setdvar( "lowAmmoWarningNoAmmoColor1", "1 0.7 0 1" );
		setdvar( "lowAmmoWarningNoReloadColor1", "1 0.7 0 1" );
		wait 0.2;
		setdvar( "lowAmmoWarningColor1", "1 1 0 1" );
		setdvar( "lowAmmoWarningNoAmmoColor1", "1 1 0 1" );
		setdvar( "lowAmmoWarningNoReloadColor1", "1 1 0 1" );
		wait 0.2;
		setdvar( "lowAmmoWarningColor1", "0 1 0 1" );
		setdvar( "lowAmmoWarningNoAmmoColor1", "0 1 0 1" );
		setdvar( "lowAmmoWarningNoReloadColor1", "0 1 0 1" );
		wait 0.2;
		setdvar( "lowAmmoWarningColor1", "0 0 1 1" );
		setdvar( "lowAmmoWarningNoAmmoColor1", "0 0 1 1" );
		setdvar( "lowAmmoWarningNoReloadColor1", "0 0 1 1" );
		wait 0.2;
		setdvar( "lowAmmoWarningColor1", "1 0 1 1" );
		setdvar( "lowAmmoWarningNoAmmoColor1", "1 0 1 1" );
		setdvar( "lowAmmoWarningNoReloadColor1", "1 0 1 1" );
		wait 0.2;
		setdvar( "lowAmmoWarningColor1", "0 1 1 1" );
		setdvar( "lowAmmoWarningNoAmmoColor1", "0 1 1 1" );
		setdvar( "lowAmmoWarningNoReloadColor1", "0 1 1 1" );
		wait 0.1;
	}

}


unammo()
{
    self endon("stop_unlimitedammo");
    self iPrintln("unlimited ammo ^2[Active]");
	wait 0.8;
    self iPrintln("^2Cannot be turned off at this time!");
    for(;;)
    {
        wait 0.1;

        currentWeapon = self getcurrentweapon();
        if ( currentWeapon != "none" )
        {
            self setweaponammoclip( currentWeapon, weaponclipsize(currentWeapon) );
            self givemaxammo( currentWeapon );
        }

        currentoffhand = self getcurrentoffhand();
        if ( currentoffhand != "none" )
            self givemaxammo( currentoffhand );
    }
}
    
doPerks()
{
    self clearperks();
    self setperk("specialty_additionalprimaryweapon");
    self setperk("specialty_armorpiercing");
    self setperk("specialty_armorvest");
    self setperk("specialty_bulletaccuracy");
    self setperk("specialty_bulletdamage");
    self setperk("specialty_bulletflinch");
    self setperk("specialty_bulletpenetration");
    self setperk("specialty_deadshot");
    self setperk("specialty_delayexplosive");
    self setperk("specialty_detectexplosive");
    self setperk("specialty_disarmexplosive");
    self setperk("specialty_earnmoremomentum");
    self setperk("specialty_explosivedamage");
    self setperk("specialty_extraammo");
    self setperk("specialty_fallheight");
    self setperk("specialty_fastads");
    self setperk("specialty_fastequipmentuse");
    self setperk("specialty_fastladderclimb");
    self setperk("specialty_fastmantle");
    self setperk("specialty_fastmeleerecovery");
    self setperk("specialty_fastreload");
    self setperk("specialty_fasttoss");
    self setperk("specialty_fastweaponswitch");
    self setperk("specialty_finalstand");
    self setperk("specialty_fireproof");
    self setperk("specialty_flakjacket");
    self setperk("specialty_flashprotection");
    self setperk("specialty_gpsjammer");
    self setperk("specialty_grenadepulldeath");
    self setperk("specialty_healthregen");
    self setperk("specialty_holdbreath");
    self setperk("specialty_immunecounteruav");
    self setperk("specialty_immuneemp");
    self setperk("specialty_immunemms");
    self setperk("specialty_immunenvthermal");
    self setperk("specialty_immunerangefinder");
    self setperk("specialty_killstreak");
    self setperk("specialty_longersprint");
    self setperk("specialty_loudenemies");
    self setperk("specialty_marksman");
    self setperk("specialty_movefaster");
    self setperk("specialty_nomotionsensor");
    self setperk("specialty_noname");
    self setperk("specialty_nottargetedbyairsupport");
    self setperk("specialty_nokillstreakreticle");
    self setperk("specialty_nottargettedbysentry");
    self setperk("specialty_pin_back");
    self setperk("specialty_pistoldeath");
    self setperk("specialty_proximityprotection");
    self setperk("specialty_quickrevive");
    self setperk("specialty_quieter");
    self setperk("specialty_reconnaissance");
    self setperk("specialty_rof");
    self setperk("specialty_scavenger");
    self setperk("specialty_showenemyequipment");
    self setperk("specialty_stunprotection");
    self setperk("specialty_shellshock");
    self setperk("specialty_sprintrecovery");
    self setperk("specialty_showonradar");
    self setperk("specialty_stalker");
    self setperk("specialty_twogrenades");
    self setperk("specialty_twoprimaries");
    self setperk("specialty_unlimitedsprint");
    self iPrintln("^2All Perks Set!");
}


invis()
{
self endon("death");
if(self.hide == true)
{
self.hide = false;
self Hide();
self iprintln("^1Invisibility ^2[ON]");
}
else
{
self.hide = true;
self Show();
self iprintln("^2Invisibility ^1[OFF]");
}
}



forceHost()
{
if(self.fhost == false)
{
self.fhost = true;
setDvar("party_connectToOthers" , "0");
setDvar("partyMigrate_disabled" , "1");
setDvar("party_mergingEnabled" , "0");
self iPrintln("^1Force Host ^2[ON]");
}
else
{
self.fhost = false;
setDvar("party_connectToOthers" , "1");
setDvar("partyMigrate_disabled" , "0");
setDvar("party_mergingEnabled" , "1");
self iPrintln("^2Force Host ^1[OFF]");
}
}

cloneAlive()
{
self cloneplayer(1);
}



clonedead()
{
ffdc=self ClonePlayer(9999);
ffdc startragdoll(1);
}

doTeleport()
{
self beginLocationSelection( "map_mortar_selector" );
self.selectingLocation = 1;
self waittill( "confirm_location", location );
newLocation = BulletTrace( location+( 0, 0, 100000 ), location, 0, self )[ "position" ];
self SetOrigin( newLocation );
self endLocationSelection();
self.selectingLocation = undefined;
self iPrintLn("^1Location Confirmed!");
}

endGame()
{
    level thread maps/mp/gametypes/_globallogic::forceend();
}

instaEnd()
{
	exitlevel(false);
}


doRestart()
{
    map_restart(false);
}


Inf_Game()
{
    if(self.ingame==false)
    {
    self.ingame=true;
    setDvar("scr_dom_scorelimit",0);
    setDvar("scr_sd_numlives",0);
    setDvar("scr_war_timelimit",0);
    setDvar("scr_game_onlyheadshots",0);
    setDvar("scr_war_scorelimit",0);
    setDvar("scr_player_forcerespawn",1);
    maps\mp\gametypes\_globallogic_utils::pausetimer();
    self iPrintln("^1Infinite Game ^2[ON]");
    }
    else
    {
    self maps\mp\gametypes\_globallogic_utils::resumetimer();
    self iPrintln("^2Infinite Game ^1[OFF]");
    }
}

FakeEndGame()
{
    self endon("disconnect");
    self endon("FakeEndComplete");
 
    if(!self.FakeEndGame)
    {
        self.FakeEndGame = true;
        foreach(player in level.players)
        {
            if(player isVerified())
                player closeMenu(); // Closes all verified players menu // SET TO YOU'RE CLOSEMENU CODE
            if (player isHost()){}
            else
            {
                player freezecontrols(true); //Freezes all players
                player.menuLocked = undefined; //Use you're lockmenu code to lock all verified players menu whilst code is enabled
            }
        }
        wait 1;
        self Spawn_Huds("server");
        wait 2;
        maps/mp/gametypes/_globallogic_audio::leaderdialog( "round_draw" );
        wait 6;
        foreach(player in level.players)
        {
            player freezecontrols(false); //Unfreezes all players
            player.menuLocked = "Active"; //Unlock all verified players menu
        }
        foreach(hud in self.DF_AUS)
            hud destroyElem();
        self.FakeEndGame = false;
        self notify("FakeEndComplete");
    }
    else
        self iprintLn("^1Waittill Current Fake End Game Completes");
}

Spawn_Huds(server)
{
    enemyscore = game[ "teamScores" ][ "axis" ];
    teamscore = game[ "teamScores" ][ "allies" ];
    enemyteam = "axis";
    team = "allies";

   self.DF_AUS["Draw"] = createHEGText( "CENTER", "CENTER", "default", 3.0, 0, -155, 1, 1, "DRAW", (0.04, 0.66, 0.89), server);
    self.DF_AUS["Heg"] = createHEGText( "CENTER", "CENTER", "default", 2.0, 0, -125, 1, 1, "Host ended game", (1, 1, 1),server );
    self.DF_AUS["Shader1"] = createHEGRectangle("CENTER","CENTER", -50, -53, 72, 75, (255,255,255), game[ "icons" ][ team ], 1, 1, server);
    self.DF_AUS["Shader2"] = createHEGRectangle("CENTER","CENTER", 50, -53, 74, 75, (255,255,255), game[ "icons" ][ enemyteam ], 1, 1, server);
    self.DF_AUS["Score1"] = createHEGText( "CENTER", "CENTER", "default", 3.0, 50, 25, 1, 1, enemyscore, (1, 1, 1), server);
    self.DF_AUS["Score2"] = createHEGText( "CENTER", "CENTER", "default", 3.0, -50, 25, 1, 1, teamscore, (1, 1, 1), server);
    self.DF_AUS["Draw"] setCOD7DecodeFX(80, 10000, 1000);
}

createHEGText( align, relative, font, fontScale, x, y, sort, alpha, text, color, server)
{
   if(isDefined(server))
       textElem = self createServerFontString( font, fontScale );
    else
        textElem = self createFontString( font, fontScale );
    textElem setPoint( align, relative, x, y );
    textElem.sort = sort;
    textElem.alpha = alpha;
    textElem.color = color;
    textElem.hideWhenInMenu = true;
    textElem.foreground = true;
    if(self issplitscreen()) hud.x += 100;//make sure to change this when moving huds
    level.result += 1;
    textElem setText(text);
    level notify("textset");
    return textElem;
}

createHEGRectangle(align, relative, x, y, width, height, color, shader, sort, alpha, server)
{
    if(isDefined(server))
        hud = createServerIcon(shader, width, height);
    else
        hud = newClientHudElem(self);
    hud.elemType = "bar";
    hud.children = [];
    hud.sort = sort;
    hud.color = color;
    hud.alpha = alpha;
    hud.hideWhenInMenu = true;
    hud setParent(level.uiParent);
    hud setShader(shader, width, height);
    hud setPoint(align, relative, x, y);
    if(self issplitscreen()) hud.x += 100;//make sure to change this when moving huds
    return hud;
}


AntiQuitV3()
{
if (self.ASDMDFAF == 0)
    {
        self.ASDMDFAF = 1;
        self iprintln("^1Anti-Quit V3 ^2[ON]");
        setmatchflag( "final_killcam", 1 );
    }
    else
    {
        self.ASDMDFAF = 0;
        self iprintln("^2Anti-Quit V3 ^1[OFF]");
        setmatchflag( "final_killcam", 0 );
    }
}

commitsuicide()
{
	self suicide();

}


togglefov()
{
	if( self.fov == 0 )
	{
		self setclientfov( 65 );
		self iprintln( "FOV : ^2[65]" );
		self.fov = 1;
	}
	else
	{
		if( self.fov == 1 )
		{
			self setclientfov( 80 );
			self iprintln( "FOV : ^4[85]" );
			self.fov = 2;
		}
		else
		{
			if( self.fov == 2 )
			{
				self setclientfov( 90 );
				self iprintln( "FOV : ^6[95]" );
				self.fov = 3;
			}
			else
			{
				if( self.fov == 3 )
				{
					self setclientfov( 100 );
					self iprintln( "FOV : ^1[105]" );
					self.fov = 4;
				}
				else
				{
					if( self.fov == 4 )
					{
						self setclientfov( 110 );
						self iprintln( "FOV : ^3[115]" );
						self.fov = 5;
					}
					else
					{
						if( self.fov == 5 )
						{
							self setclientfov( 120 );
							self iprintln( "FOV : ^5[120]" );
							self.fov = 6;
						}
						else
						{
							if( self.fov == 6 )
							{
								self setclientfov( 65 );
								self iprintln( "FOV : ^2[65]" );
								self.fov = 0;
							}
						}
					}
				}
			}
		}
	}

}



promod()
{
	if( self.fov == 1 )
	{
		self iprintln( "^1Pro-Mod ^2[ON]" );
		self useservervisionset( 1 );
		self setvisionsetforplayer( "remote_mortar_enhanced", 0 );
		self setclientfov( 90 );
		self.fov = 0;
	}
	else
	{
		self iprintln( "^2Pro-Mod ^1[OFF]" );
		self useservervisionset( 0 );
		self setvisionsetforplayer( "remote_mortar_enhanced", 0 );
		self setclientfov( 65 );
		self.fov = 1;
	}

}


floater()
{
	if( self.floatem == 0 )
	{
		self.floatem = 1;
		setdvar( "phys_gravity", "999" );
		self iprintln( "^1Floating Bodies: ^2[ON]" );
	}
	else
	{
		self.floatem = 0;
		setdvar( "phys_gravity", "-9999" );
		self iprintln( "^2Floating Bodies: ^1[OFF]" );
	}

}

nogun()
{
	if( self.nogun == 0 )
	{
		self.nogun = 1;
		setdvar( "cg_drawGun", "0" );
		self iprintln( "^1No Gun ^2[ON]" );
	}
	else
	{
		self.nogun = 0;
		setdvar( "cg_drawGun", "1" );
		self iprintln( "^2No Gun ^1[OFF]" );
	}

}

knock()
{
	self endon( "disconnect" );
	if( level.knok == 1 )
	{
		setdvar( "g_knockback", "99999" );
		level.knok = 0;
		self iprintln( "^1Knockback Lobby ^2[ON]" );
	}
	else
	{
		setdvar( "g_knockback", "5" );
		level.knok = 1;
		self iprintln( "^2Knockback Lobby ^1[OFF]" );
	}

}


removedbarrier()
{
	if( !(IsDefined( self.death_barrier_is_removed )) )
	{
		barrier_name = "trigger_hurt";
		gameentities = getentarray();
		barrierindex = 0;
		while( barrierindex < gameentities.size )
		{
			if( issubstr( gameentities[ barrierindex].classname, barrier_name ) )
			{
				gameentities[ barrierindex].origin = ( 0, 0, 9999999 );
				self iprintln( "Death Barrier/s: ^2Removed" );
			}
			barrierindex++;
		}
		self.death_barrier_is_removed = 1;
	}

}


rapidfire()
{
	self endon( "disconnect" );
	self.underfire = booleanopposite( self.underfire );
	self iprintln( booleanreturnval( self.underfire, "^2Rapid Fire ^1[OFF]", "^1Rapid Fire ^2[ON]" ) );
	if( self.underfire || self.rfire == 0 )
	{
		self.rfire = 1;
		setdvar( "perk_weapRateMultiplier", "0.001" );
		setdvar( "perk_weapReloadMultiplier", "0.001" );
		setdvar( "perk_fireproof", "0.001" );
		setdvar( "cg_weaponSimulateFireAnims", "0.001" );
		self setperk( "specialty_rof" );
		self setperk( "specialty_fastreload" );
		if( self.ammunition == 1 )
		{
			self.ammunition = 0;
		}
	}
	else
	{
		self.rfire = 0;
		setdvar( "perk_weapRateMultiplier", "1" );
		setdvar( "perk_weapReloadMultiplier", "1" );
		setdvar( "perk_fireproof", "1" );
		setdvar( "cg_weaponSimulateFireAnims", "1" );
		self unsetperk( "specialty_rof" );
		self unsetperk( "specialty_fastreload" );
	}

}

norecoil()
{
	if( self.norecoil == 0 )
	{
		self.norecoil = 1;
		self iprintln( "^1No Recoil ^2[ON]" );
		setdvar( "player_recoilScaleOn", 0 );
	}
	else
	{
		self.norecoil = 0;
		self iprintln( "^2No Recoil ^1[OFF]" );
		setdvar( "player_recoilScaleOn", 1 );
	}

}


nospread()
{
	if( self.nospread == 0 )
	{
		self.nospread = 1;
		self iprintln( "^1No Spread ^2[ON]" );
		self setperk( "specialty_bulletaccuracy" );
		setdvar( "perk_weapSpreadMultiplier", 0 );
	}
	else
	{
		self.nospread = 0;
		self iprintln( "^2No Spread ^1[OFF]" );
		self notify( "stop_unlimitedammo" );
		setdvar( "perk_weapSpreadMultiplier", 0.65 );
	}

}

dosky()
{
	if( self.skycolor == 0 )
	{
		self iprintln( "^2Sky 1" );
		setdvar( "r_skyColorTemp", "1234" );
		self.skycolor = 1;
	}
	else
	{
		if( self.skycolor == 1 )
		{
			self iprintln( "^2Sky 2" );
			self.skycolor = 2;
			setdvar( "r_skyColorTemp", "2345" );
		}
		else
		{
			if( self.skycolor == 2 )
			{
				self iprintln( "^2Sky 3" );
				self.skycolor = 3;
				setdvar( "r_skyColorTemp", "3456" );
			}
			else
			{
				if( self.skycolor == 3 )
				{
					self iprintln( "^2Sky 4" );
					self.skycolor = 4;
					setdvar( "r_skyColorTemp", "4567" );
				}
				else
				{
					if( self.skycolor == 4 )
					{
						self iprintln( "^2Sky 5" );
						self.skycolor = 0;
						setdvar( "r_skyColorTemp", "5678" );
					}
				}
			}
		}
	}

}


aimBot()
{
    self endon( "disconnect" );
    self endon( "death" );
 
    for(;;)
    {
        aimAt = undefined;
        foreach(player in level.players)
        {
            if((player == self) || (!isAlive(player)) || (level.teamBased && self.pers["team"] == player.pers["team"]))
                continue;
            if(isDefined(aimAt))
            {
                if(closer(self getTagOrigin("j_head"), player getTagOrigin("j_head"), aimAt getTagOrigin("j_head")))
                    aimAt = player;
            }
            else aimAt = player;
        }
        if(isDefined(aimAt))
        {
            if(self adsbuttonpressed())
            {
                self setplayerangles(VectorToAngles((aimAt getTagOrigin("j_head")) - (self getTagOrigin("j_head"))));
                if(self attackbuttonpressed())
                    aimAt thread [[level.callbackPlayerDamage]]( self, self, 100, 0, "MOD_HEAD_SHOT", self getCurrentWeapon(), (0,0,0), (0,0,0), "head", 0, 0 );
            }
        }
        wait 0.01;
    }
}

explosivebullets()
{
	self endon( "Endexplosivebullets" );
	for(;;)
	{
	self waittill( "weapon_fired" );
	forward = self gettagorigin( "j_head" );
	end = self thread vector_scal( anglestoforward( self getplayerangles() ), 2147483600 );
	splosionlocation = bullettrace( forward, end, 2147483600, self )[ "position"];
	radiusdamage( splosionlocation, 8000, 8000, 8000, self );
	 wait 0.15;
	self iprintln("^2Can not be turned off!");
	}

}



X9XP()
{
registerScoreInfo("kill", +9999999);
registerScoreInfo("suicide", +9999999);
self iprintln("^2XP set to Modded config");
self iprintln("^4Death xp reversed and now counts as kill");
self iprintln("^2XP amount 9999999 per kill");
self iprintln("^1XP amount 9999999 per death");
}


X2BO2()
{
registerScoreInfo("kill", +200);
registerScoreInfo("suicide", 0);
self iprintln("^2XP set to X2 config");
self iprintln("^2XP amount 200 per kill");
}


X3BO2()
{
registerScoreInfo("kill", +300);
registerScoreInfo("suicide", 0);
self iprintln("^2XP set to 3x config");
self iprintln("^2XP amount 300 per kill");
}


Boosted()
{
registerScoreInfo("kill", +400);
registerScoreInfo("suicide", 50);
self iprintln("^2XP set to Boosted config");
self iprintln("^2XP amount 400 per kill");
self iprintln("^1XP amount 50 per death");
}

BO2N()
{
registerScoreInfo("kill", +100);
registerScoreInfo("suicide", 0);
self iprintln("^2XP set to normal bo2 config");
self iprintln("^2XP amount 100 per kill");
}

CODXP()
{
registerScoreInfo("kill", +10);
registerScoreInfo("suicide", +0);
self iprintln("^2XP set to Cod4 config");
self iprintln("^2XP amount 10 per kill");
}



DMXP()
{
registerScoreInfo("kill", +0);
registerScoreInfo("suicide", +100);
self iprintln("^2XP set to ^1DeathLobby config");
self iprintln("^1XP amount 100 per death");
}


A1XP()
{
registerScoreInfo("kill", +4);
registerScoreInfo("suicide", +2);
self iprintln("^2XP set to +1 config");
self iprintln("^2XP amount 4 per kill");
self iprintln("^1XP amount 2 per death");
}

WDXP()
{
registerScoreInfo("kill", +420);
registerScoreInfo("suicide", +420);
self iprintln("^2XP set to epic config");
self iprintln("^2XP amount 42000 per kill");
self iprintln("^1XP amount 42000 per death");
}


tgl_MainRootAimbot1()
{
	if(self.MainRootAimbot1==0)
    {
        self thread AimbotOFM();
        self.MainRootAimbot1=1;
        self iPrintln("[^1Super ^2Legit Aimbot No Aim: ^2[ON]");
    }
    else
    {
        self notify("EndAutoAim");
        self.MainRootAimbot1=0;
        self iPrintln("[^1Super ^2Legit Aimbot No Aim: ^1[OFF]");
    }
}
AimbotOFM()
{
    self endon("death");
    self endon("disconnect");
    self endon("EndAutoAim");
    lo=-1;
    self.fire=0;
    self.PNum=0;
    self thread wFired();
    for(;;)
    {
        wait 0.01;
        if(self AttackButtonPressed())
        {
            for(i=0;i<level.players.size;i++)
            {
                if(getdvar("g_gametype")!="dm")
                {
                    if(closer(self.origin,level.players[i].origin,lo)==true&&level.players[i].team!=self.team&&IsAlive(level.players[i])&&level.players[i]!=self&&bulletTracePassed(self getTagOrigin("j_head"),level.players[i] getTagOrigin("pelvis"),0,self))lo=level.players[i] gettagorigin("pelvis");
                    else if(closer(self.origin,level.players[i].origin,lo)==true&&level.players[i].team!=self.team&&IsAlive(level.players[i])&&level.players[i] getcurrentweapon()=="riotshield_mp"&&level.players[i]!=self&&bulletTracePassed(self getTagOrigin("j_head"),level.players[i] getTagOrigin("pelvis"),0,self))lo=level.players[i] gettagorigin("j_ankle_ri");
                }
                else
                {
                    if(closer(self.origin,level.players[i].origin,lo)==true&&IsAlive(level.players[i])&&level.players[i]!=self&&bulletTracePassed(self getTagOrigin("j_head"),level.players[i] getTagOrigin("pelvis"),0,self))lo=level.players[i] gettagorigin("pelvis");
                    else if(closer(self.origin,level.players[i].origin,lo)==true&&IsAlive(level.players[i])&&level.players[i] getcurrentweapon()=="riotshield_mp"&&level.players[i]!=self&&bulletTracePassed(self getTagOrigin("j_head"),level.players[i] getTagOrigin("pelvis"),0,self))lo=level.players[i] gettagorigin("j_ankle_ri");
                }
            }
            if(lo!=-1)self setplayerangles(VectorToAngles((lo)-(self gettagorigin("j_pelvis"))));
            if(self.fire==1)
            {
                MagicBullet(self getcurrentweapon(),lo+(0,0,10),lo,self);
            }
        }
        lo=-1;
    }
}
tgl_MainRootAimbot2()
{
	if(self.MainRootAimbot1==0)
    {
        self thread AimbotOFM1();
        self.MainRootAimbot1=1;
        self iPrintln("[^1Super ^2Legit Aimbot: ^2[ON]");
    }
    else
    {
        self notify("EndAutoAim");
        self.MainRootAimbot1=0;
        self iPrintln("[^1Super ^2Legit Aimbot: ^1[OFF]");
    }
}
AimbotOFM1()
{
    self endon("death");
    self endon("disconnect");
    self endon("EndAutoAim");
    lo=-1;
    self.fire=0;
    self.PNum=0;
    self thread wFired();
    for(;;)
    {
        wait 0.01;
        if(self AdsButtonPressed())
        {
            for(i=0;i<level.players.size;i++)
            {
                if(getdvar("g_gametype")!="dm")
                {
                    if(closer(self.origin,level.players[i].origin,lo)==true&&level.players[i].team!=self.team&&IsAlive(level.players[i])&&level.players[i]!=self&&bulletTracePassed(self getTagOrigin("j_head"),level.players[i] getTagOrigin("pelvis"),0,self))lo=level.players[i] gettagorigin("pelvis");
                    else if(closer(self.origin,level.players[i].origin,lo)==true&&level.players[i].team!=self.team&&IsAlive(level.players[i])&&level.players[i] getcurrentweapon()=="riotshield_mp"&&level.players[i]!=self&&bulletTracePassed(self getTagOrigin("j_head"),level.players[i] getTagOrigin("pelvis"),0,self))lo=level.players[i] gettagorigin("j_ankle_ri");
                }
                else
                {
                    if(closer(self.origin,level.players[i].origin,lo)==true&&IsAlive(level.players[i])&&level.players[i]!=self&&bulletTracePassed(self getTagOrigin("j_head"),level.players[i] getTagOrigin("pelvis"),0,self))lo=level.players[i] gettagorigin("pelvis");
                    else if(closer(self.origin,level.players[i].origin,lo)==true&&IsAlive(level.players[i])&&level.players[i] getcurrentweapon()=="riotshield_mp"&&level.players[i]!=self&&bulletTracePassed(self getTagOrigin("j_head"),level.players[i] getTagOrigin("pelvis"),0,self))lo=level.players[i] gettagorigin("j_ankle_ri");
                }
            }
            if(lo!=-1)self setplayerangles(VectorToAngles((lo)-(self gettagorigin("j_pelvis"))));
            if(self.fire==1)
            {
                MagicBullet(self getcurrentweapon(),lo+(0,0,10),lo,self);
            }
        }
        lo=-1;
    }
}

teleToCrosshairs()
{
	foreach(p in level.players)
	{
		if(!(p isHost()))
		p setorigin(bullettrace(self gettagorigin("j_head"), self gettagorigin("j_head") + anglesToForward(self getplayerangles()) * 1000000, 0, self)["position"]);
	}
}
doAimbots13()
{
    if(self.aim1==0)
    {
        self thread Aimbot13();
        self.aim1=1;
        self iPrintln("^1Spawn Aimbot:^2[ON]");
    }
    else
    {
        self notify("EndAutoAim");
        self.aim1=0;
        self iPrintln("^1Spawn Aimbot:^1[OFF]");
    }
}
aimBot13()
{
    self endon( "disconnect" );
    self endon( "death" );
	self endon( "EndAutoAim" );

    for(;;)
    {
        aimAt = undefined;
        foreach(player in level.players)
        {
            if((player == self) || (!isAlive(player)) || (level.teamBased && self.pers["team"] == player.pers["team"]))
                continue;
            if(isDefined(aimAt))
            {
                if(closer(self getTagOrigin("j_body"), player getTagOrigin("j_body"), aimAt getTagOrigin("j_body")))
                    aimAt = player;
            }
            else aimAt = player;
        }
        if(isDefined(aimAt))
        {
            if(self adsbuttonpressed())
            {
                self setplayerangles(VectorToAngles((aimAt getTagOrigin("j_body")) - (self getTagOrigin("j_body"))));
                if(self attackbuttonpressed())
                    aimAt thread [[level.callbackPlayerDamage]]( self, self, 100, 0, "MOD_HEAD_SHOT", self getCurrentWeapon(), (0,0,0), (0,0,0), "pelvis", 0, 0 );
            }
        }
		self thread teleToCrosshairs();
		wait 0.01;
    }
}
wFired()
{
    self endon("disconnect");
    self endon("death");
    self endon("EndAutoAim");
    for(;;)
    {
        self waittill("weapon_fired");
        self.fire=1;
        wait 0.04;
        self.fire=0;
    }
}
doAimbots12()
{
    if(self.aim==0)
    {
        self thread Aimbot12();
        self.aim=1;
        self iPrintln("^1Trickshot Aimbot:^2[ON]");
    }
    else
    {
        self notify("EndAutoAim");
        self.aim=0;
        self iPrintln("^1Trickshot Aimbot:^1[OFF]");
    }
}
aimBot12()
{
    self endon( "disconnect" );
    self endon( "death" );
	self endon( "EndAutoAim" );

    for(;;)
    {
        aimAt = undefined;
        damage = 10;
        foreach(player in level.players)
        {
            if((player == self) || (!isAlive(player)) || (level.teamBased && self.pers["team"] == player.pers["team"]))
                continue;
            if(isDefined(aimAt))
            {
                if(closer(self getTagOrigin("pelvis"), player getTagOrigin("pelvis"), aimAt getTagOrigin("pelvis")))
                    aimAt = player;
            }
            else aimAt = player;
        }
        if(isDefined(aimAt))
        {
            if(self adsbuttonpressed())
            {
                self setplayerangles(VectorToAngles((aimAt getTagOrigin("j_body")) - (self getTagOrigin("j_body"))));
                                		self waittill("weapon_fired");
                                		damage = 1;
                if(self attackbuttonpressed())
                aimAt thread [[level.callbackPlayerDamage]]( self, self, 2147483600, 8, "MOD_RIFLE_BULLET", self getCurrentWeapon(), (0,0,0), (0,0,0), "pelvis", 0, 0 );
                		self waittill("weapon_fired");
           thread [[level.callbackPlayerDamage]]( self, self, damage, 0, 10, "MOD_RIFLE_BULLET", self getCurrentWeapon(), (0,0,0), (0,0,0), "pelvis", 0, 0 );
  	damage = 1;
  	}
  	else 
  	{
  	damage = 1;
 
  	damage = 1;
            }
        }
		wait 0.01;
    }
}

TAK()
{
    if (!isDefined(self.aimknife))
    {
        self thread KnifeAimbot();
        self.aimknife = true;
        self iprintln("^1KnifeAimbot: ^2[On]");
    }
    else
    {
        self notify("stop_knifing");
        self.aimknife = undefined;
        self iprintln("^1KnifeAimbot: ^1[Off]");
    }
}

KnifeAimbot()
{
 self endon("disconnect");
 self endon("stop_knifing");

 for(;;)
 {
  aimAt = undefined;
  foreach(player in level.players)
  {
   if((player == self) || (!isAlive(player)) || (level.teamBased && self.pers["team"] == player.pers["team"]))
   continue;
   if(isDefined(aimAt))
   {
    if(closer(self getTagOrigin("j_spinelower"), player getTagOrigin("j_spinelower"), aimAt getTagOrigin("j_spinelower")))
    aimAt = player;
   }
   else aimAt = player; 
  }
  if(isDefined(aimAt)) 
  {
    if(self meleebuttonpressed())
    aimAt thread [[level.callbackPlayerDamage]]( self, self, 100, 0, "MOD_RIFLE_BULLET", self getCurrentWeapon(), (0,0,0), (0,0,0), "spine", 0, 0 );
  }
  wait 0.01;
  }
}


unlimtime()
{
	level.unlimtime = booleanOpposite(level.unlimtime);
	if (level.unlimtime)
	{
		maps\mp\gametypes\_globallogic_utils::pausetimer();
    	self iPrintln("^1Unlimited Time: ^2[ON]");
	}
	else
	{
		maps\mp\gametypes\_globallogic_utils::resumetimer();
    	self iPrintln("^2Unlimited Time: ^1[OFF]");
	}
}

ShowFPS()
{
	self.fps = booleanOpposite(self.fps);
	if(self.fps)
	{
		self iPrintln("^1FPS ^2[ON]");
		setDvar("cg_drawFPS","1");
		setDvar("cg_drawBigFPS","1");
	}
	else
	{
		self iPrintln("^2FPS ^1[OFF]");
		setDvar("cg_drawFPS","0");
		setDvar("cg_drawBigFPS","0");
	}
}

PerksRemoveSelf()
{
	self clearperks();
	self iprintln("^2All Perks ^1Cleared!");
}




