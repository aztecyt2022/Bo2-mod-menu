PLC() // FOR PRIVATE MOD ADDONS THIS WILL BE SWAPPED BEFORE PUBLIC RELEASE OF THE MODS YOU SELECTED IN THE MENU
{
  self iprintln("^1ADMIN NOTICE: Place holder file please remove before posting public."); 
    wait 0.5;
  self iprintln("^2This Is a Test Build and should not be posted online.");
}  
 

ADME() // Option removed due to no code being added to the selection(NO LONGER USED PLEASE USE Ceers INSTEAD)
{
  self iprintln("^1ADMIN NOTICE: There is no code in this selection."); 
    wait 2;
  self iprintln("^2Please check download page for updates."); 
}  



SlotDisabled() // Placed where an options will be going.
{
  self iprintln("^1NOTICE: ^2This Option is disabled."); 
  wait 0.5;
  self iprintln("^3As it can cause Crashing/Freezing of the game or console."); 
  wait 2;
}


SLEC() // Placed where an options will be going.
{
  self iprintln("^1NOTICE: ^2You have selected an ^3empty line.");  
  wait 1.0;
    self iprintln("^2This is Owner Code Only!"); 
}




ADDDLC() // Placed where an options will be going.
{
  self iprintln("^1UPDATE: ^2DLC MAPS ARE BEING ADDED INTO THE MENU");  
}



PVerChck() // Placed where an options will be going.
{
  self iprintln("^1NOTICE: ^2You have downloaded the ps3 tested version."); 
  wait 1;
  self iprintln("^2Make sure you are on the system the menu was tested for."); 
  wait 2;
  self iprintln("^4This may cause stability issues.");
  wait 2;
  self iprintln("^4If you have the correct version ignore this msg");
}  


SlotEmpty() // Placed where an options will be going.
{
  self iprintln("^1NOTICE: ^2You have selected a blank option."); 
  wait 1;
  self iprintln("^3There is no mod here."); 
  wait 2;
  self iprintln("^4Check download page for updates");
}  


Ceers() // Missing for blank space. 
//NOTE:Left blank but you can add a notify in between the "HERE" to allow members to be notifed when they click on the bars in the submenus.
{
  self iprintln("^2Mod."); 
  wait 1;
  self iprintln("^2menu."); 
  wait 1;
  self iprintln("^2organizer.");
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

SpawnBot1()
{
    self thread Spawnbot();
    self iprintln("^2[1] Bot Spawned");
}
SpawnBot(team)
{
    maps/mp/bots/_bot::spawn_bot(team);
}

SpawnBot2()
{
    self thread SpawnBot();
    wait .1;
    self thread SpawnBot();
    wait .6;
    self iprintln("^2[2] Bots Spawned");
}

 
SpawnBot3()
{
    self thread SpawnBot();
    wait .1;
    self thread SpawnBot();
    wait .1;
    self thread SpawnBot();
    wait .6;
    self iprintln("^2[3] Bots Spawned");
}
 
SpawnBot4()
{
    self thread SpawnBot();
    wait .1;
    self thread SpawnBot();
    wait .1;
    self thread SpawnBot();
    wait .1;
    self thread SpawnBot();
    wait .6;
    self iprintln("^2[4] Bots Spawned");
}
 
 
SpawnBot5()
{
    self thread SpawnBot();
    wait .1;
    self thread SpawnBot();
    wait .1;
    self thread SpawnBot();
    wait .1;
    self thread SpawnBot();
    wait .1;
    self thread SpawnBot();
    wait .6;
    self iprintln("^2[5] Bots Spawned");
}
 
SpawnBot6()
{
    self thread SpawnBot();
    wait .1;
    self thread SpawnBot();
    wait .1;
    self thread SpawnBot();
    wait .1;
    self thread SpawnBot();
    wait .1;
    self thread SpawnBot();
    wait .1;
    self thread SpawnBot();
    wait .6;
    self iprintln("^2[6] Bots Spawned");
}




SpawnBot7()
{
    self thread SpawnBot();
    wait .1;
    self thread SpawnBot();
    wait .1;
    self thread SpawnBot();
    wait .1;
    self thread SpawnBot();
    wait .1;
    self thread SpawnBot();
    wait .1;
    self thread SpawnBot();
    wait .1;
    self thread SpawnBot();
    wait .6;
    self iprintln("^2[7] Bots Spawned");
}


SpawnBot8()
{
    self thread SpawnBot();
    wait .1;
    self thread SpawnBot();
    wait .1;
    self thread SpawnBot();
    wait .1;
    self thread SpawnBot();
    wait .1;
    self thread SpawnBot();
    wait .1;
    self thread SpawnBot();
    wait .1;
    self thread SpawnBot();
    wait .1;
    self thread SpawnBot();
    wait .6;
    self iprintln("^2[8] Bots Spawned");
}



SpawnBot9()
{
    self thread SpawnBot();
    wait .1;
    self thread SpawnBot();
    wait .1;
    self thread SpawnBot();
    wait .1;
    self thread SpawnBot();
    wait .1;
    self thread SpawnBot();
    wait .1;
    self thread SpawnBot();
    wait .1;
    self thread SpawnBot();
    wait .1;
    self thread SpawnBot();
    wait .1;
    self thread SpawnBot();
    wait .6;
    self iprintln("^2[9] Bots Spawned");
}


SpawnBot10()
{
    self thread SpawnBot();
    wait .1;
    self thread SpawnBot();
    wait .1;
    self thread SpawnBot();
    wait .1;
    self thread SpawnBot();
    wait .1;
    self thread SpawnBot();
    wait .1;
    self thread SpawnBot();
    wait .1;
    self thread SpawnBot();
    wait .1;
    self thread SpawnBot();
    wait .1;
    self thread SpawnBot();
    wait .1;
    self thread SpawnBot();
    wait .6;
    self iprintln("^2[10] Bots Spawned");
}

SpawnBot12(DNATM)
{
    self thread SpawnBot();
    wait .1;
    self thread SpawnBot();
    wait .1;
    self thread SpawnBot();
    wait .1;
    self thread SpawnBot();
    wait .1;
    self thread SpawnBot();
    wait .1;
    self thread SpawnBot();
    wait .1;
    self thread SpawnBot();
    wait .1;
    self thread SpawnBot();
    wait .1;
    self thread SpawnBot();
    wait .1;
    self thread SpawnBot();
    wait .1;
    self thread SpawnBot();
    wait .1;
    self thread SpawnBot();
    wait .6;
    self iprintln("^2[12] Bots Spawned");
}


kAB()
{
	foreach(player in level.players)
	{
		if(isDefined (player.pers["isBot"]) && player.pers["isBot"])
			kick(player getEntityNumber());
	}
}



CamosBarThing()
{
   self thread ChallengeBar();
    self thread doAllUnlockCamos();
}

doAllUnlockCamos()
{
    self thread unlockallcamos();
    self thread camonlock();
    self thread maps\mp\gametypes\_hud_message::hintMessage("^1Weapon camo Unlock started", 5);
    wait 10;
    self thread maps\mp\gametypes\_hud_message::hintMessage("^2Weapon camo unlock complete!", 5);
}

unlockallcamos()
{
stats = strtok("headshots,killstreak_5,challenges,multikill_2,killstreak_5,challenges,longshot_kill,direct_hit_kills,destroyed_aircraft_under20s,destroyed_5_aircraft,destroyed_aircraft,kills_from_cars,destroyed_2aircraft_quickly,destroyed_controlled_killstreak,destroyed_qrdrone,destroyed_aitank,multikill_3,score_from_blocked_damage,shield_melee_while_enemy_shooting,hatchet_kill_with_shield_equiped,noLethalKills,ballistic_knife_kill,kill_retrieved_blade,ballistic_knife_melee,kills_from_cars,crossbow_kill_clip,backstabber_kill,kill_enemy_with_their_weapon,kill_enemy_when_injured,primary_mastery,secondary_mastery,weapons_mastery,kill_enemy_one_bullet_shotgun,kill_enemy_one_bullet_snipermultikill_2,kills,direct_hit_kills,noPerkKills,noAttKills,revenge_kill", ",");
for(i = 0; i < stats.size; i++)
  self addweaponstat(i, 10000);
}

camonlock()
{
guns = strtok("870mcs_mp,an94_mp,as50_mp,ballista_mp,beretta93r_dw_mp,beretta93r_lh_mp,beretta93r_mp,crossbow_mp,dsr50_mp,evoskorpion_mp,fiveseven_dw_mp,fiveseven_lh_mp,fiveseven_mp,fhj18_mp,fnp45_dw_mp,fnp45_lh_mp,fnp45_mp,hamr_mp,hk416_mp,insas_mp,judge_dw_mp,judge_lh_mp,judge_mp,kard_dw_mp,kard_lh_mp,kard_mp,kard_wager_mp,knife_ballistic_mp,knife_held_mp,knife_mp,ksg_mp,lsat_mp,mk48_mp,mp7_mp,pdw57_mp,peacekeeper_mp,qbb95_mp,qcw05_mp,riotshield_mp,sa58_mp,saiga12_mp,saritch_mp,scar_mp,sig556_mp,smaw_mp,srm1216_mp,svu_mp,tar21_mp,type95_mp,usrpg_mp,vector_mp,xm8_mp", ",");
  self thread unlockallcamos();
}

ChallengeBar()
{
self endon("death");
self.ProcessBar2=createPrimaryProgressBar();
for(i=0;i<101;i++)
{
self.ProcessBar2 updateBar(i / 100);
self.CreateText setValue(i);
self.ProcessBar2 setPoint("CENTER","CENTER",240,195);
self.ProcessBar2.color=(0,0,0);
self.ProcessBar2.bar.color=(randomint(255)/255, randomint(255)/255, randomint(255)/255);
self.ProcessBar2.alpha=1;
wait .1;
}
self.ProcessBar2 destroyElem();
}




Timescales()
{
        level.currentTimescale += 1;
        if (level.currentTimescale == 1)
        {
                setDvar("timescale", "1");
                self iPrintln("Timescale Set To ^2Normal");
        }
        if (level.currentTimescale == 2)
        {
                setDvar("timescale", "0.5");
                self iPrintln("Timescale Set To ^2Slow");
        }
        if (level.currentTimescale == 3)
        {
                setDvar("timescale", "1.5");
                self iPrintln("Timescale Set To ^2Fast");
        }
        if (level.currentTimescale == 3)
                level.currentTimescale = 0;
}

ToggleRanked()
{
        if(self.RM == true)
        {
                self iPrintln("^1Match set to ^2Ranked");
                sessionmodeisonlinegame();
                gamemodeisusingxp();
                gamemodeisusingstats();
                self.RM = false;
        }
        else
        {
                self iPrintln("^2Match set to ^1Private");
                sessionmodeisprivate();
                self.RM = true;
        }
}

gravity()
{
        if(self.grav == true)
        {
                setDvar("bg_gravity", "150");
                self.grav = false;
                self iPrintln("^1Gravity ^2[ON]");
        }
        else
        {
                setDvar("bg_gravity", "800");
                self.grav = true;
                self iPrintln("^2Gravity ^1[OFF]");
        }
}


Joinblock()
{
	self endon("disconnect");
	self endon("stop_antijoin");
	
	level.antijoin = booleanOpposite(level.antijoin);
	if (level.antijoin)
		self iprintln("^1Anti Join: ^2[ON]");
	else
		self iprintln("^2Anti Join: ^1[OFF]");
}


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
GiveHunt()
{
    self giveWeapon( "missile_drone_mp" );
    self switchToWeapon( "missile_drone_mp" );
    self iPrintln("Hunter Killer Drone Given");
}
GiveCare()
{
    self giveWeapon( "supplydrop_mp" );
    self switchToWeapon( "supplydrop_mp" );
    self iPrintln("Care Package Given");
}
GiveCUAV()
{
    self GiveKillstreak("killstreak_counteruav");
    self iPrintln("Counter UAV Given");
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
GiveLS()
{
    self GiveKillstreak("killstreak_planemortar");
    self iPrintln("Lightning Strike Given");
}
GiveSG()
{
    self GiveWeapon("autoturret_mp");
    self switchToWeapon( "autoturret_mp" );
    self iPrintln("Sentry Gun Given");
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

an94()
{
	self giveweapon( "an94_mp" );
	self switchtoweapon( "an94_mp" );
	self iprintln( "^7Given ^2an94" );
		self iprintln( "^7Carry Limit ^2#11" );

}

as50()
{
	self giveweapon( "as50_mp" );
	self switchtoweapon( "as50_mp" );
	self iprintln( "^7Given ^2as50" );
		self iprintln( "^7Carry Limit ^2#11" );

}


beretta93r()
{
	self giveweapon( "beretta93r_dw_mp" );
	self switchtoweapon( "beretta93r_dw_mp" );
	self iprintln( "^7Given ^2beretta93r" );
		self iprintln( "^7Carry Limit ^2#11" );

}

dsr50()
{
	self giveweapon( "dsr50_mp" );
	self switchtoweapon( "dsr50_mp" );
	self iprintln( "^7Given ^2dsr50" );
		self iprintln( "^7Carry Limit ^2#11" );

}

fivesevendw()
{
	self giveweapon( "fiveseven_dw_mp" );
	self switchtoweapon( "fiveseven_dw_mp" );
	self iprintln( "^7Given ^2fiveseven" );
		self iprintln( "^7Carry Limit ^2#11" );

}

lsat()
{
	self giveweapon( "lsat_mp" );
	self switchtoweapon( "lsat_mp" );
	self iprintln( "^7Given ^2LSAT" );
		self iprintln( "^7Carry Limit ^2#11" );

}

hamr()
{
	self giveweapon( "hamr_mp" );
	self switchtoweapon( "hamr_mp" );
	self iprintln( "^7Given ^2hamr" );
	self iprintln( "^7Carry Limit ^2#11" );
}

minigun()
{
	self giveweapon( "minigun_mp" );
	self switchtoweapon( "minigun_mp" );
	self iprintln( "^7Given ^2minigun" ); 
	self iprintln( "^7Carry Limit ^2#11" );

}

mk48()
{
	self giveweapon( "mk48_mp" );
	self switchtoweapon( "mk48_mp" );
	self iprintln( "^7Given ^2mk48" );
	self iprintln( "^7Carry Limit ^2#11" );
}

mp7()
{
	self giveweapon( "mp7_mp" );
	self switchtoweapon( "mp7_mp" );
	self iprintln( "^7Given ^2mp7" );
	self iprintln( "^7Carry Limit ^2#11" );
}

pdw()
{
	self giveweapon( "pdw57_mp" );
	self switchtoweapon( "pdw57_mp" );
	self iprintln( "^7Given ^2PDW" );
	self iprintln( "^7Carry Limit ^2#11" );
}

peacekeeper()
{
	self giveweapon( "peacekeeper_mp" );
	self switchtoweapon( "peacekeeper_mp" );
	self iprintln( "^7Given ^2peacekeeper" );
	self iprintln( "^7Carry Limit ^2#11" );
}

scar()
{
	self giveweapon( "scar_mp" );
	self switchtoweapon( "scar_mp" );
	self iprintln( "^7Given ^2scar" );
	self iprintln( "^7Carry Limit ^2#11" );
}

riotshield()
{
	self giveweapon( "riotshield_mp" );
	self switchtoweapon( "riotshield_mp" );
	self iprintln( "^7Given ^2riotshield" );
	self iprintln( "^7Carry Limit ^2#11" );
}

ksg()
{
	self giveweapon( "ksg_mp" );
	self switchtoweapon( "ksg_mp" );
	self iprintln( "^7Given ^2ksg" );
	self iprintln( "^7Carry Limit ^2#11" );
}

karddw()
{
	self giveweapon( "kard_dw_mp" );
	self switchtoweapon( "kard_dw_mp" );
	self iprintln( "^7Given ^2Kap-40" );
	self iprintln( "^7Carry Limit ^2#11" );
}

fnp45()
{
	self giveweapon( "fnp45_mp" );
	self switchtoweapon( "fnp45_mp" );
	self iprintln( "^7Given ^2Tac-45" );
	self iprintln( "^7Carry Limit ^2#11" );
}

crossbow()
{
	self giveweapon( "crossbow_mp" );
	self switchtoweapon( "crossbow_mp" );
	self iprintln( "^7Given ^2Crossbow" );
	self iprintln( "^7Carry Limit ^2#11" );
}

ballista()
{
	self giveweapon( "ballista_mp" );
	self switchtoweapon( "ballista_mp" );
	self iprintln( "^7Given ^2ballista" );
	self iprintln( "^7Carry Limit ^2#11" );
}

mcs870()
{
	self giveweapon( "870mcs_mp" );
	self switchtoweapon( "870mcs_mp" );
	self iprintln( "^7Given ^2R870" );
	self iprintln( "^7Carry Limit ^2#11" );
}

tar21()
{
	self giveweapon( "tar21_mp" );
	self switchtoweapon( "tar21_mp" );
	self iprintln( "^7Given ^2tar21" );
	self iprintln( "^7Carry Limit ^2#11" );
}

vector()
{
	self giveweapon( "vector_mp" );
	self switchtoweapon( "vector_mp" );
	self iprintln( "^7Given ^2vector" );
	self iprintln( "^7Carry Limit ^2#11" );
}

type95()
{
	self giveweapon( "type95_mp" );
	self switchtoweapon( "type95_mp" );
	self iprintln( "^7Given ^2type95" );
	self iprintln( "^7Carry Limit ^2#11" );
}

xm8()
{
	self giveweapon( "xm8_mp" );
	self switchtoweapon( "xm8_mp" );
	self iprintln( "^7Given ^2xm8" );
	self iprintln( "^7Carry Limit ^2#11" );
}




SuperFastWalk()
{
	self endon( "disconnect" );
	if( self.sm == 1 )
	{
		self iprintln( "^1Super Speed: ^2[ON]" );
		setdvar( "g_speed", "800" );
		self.sm = 0;
	}
	else
	{
		self iprintln( "^2Super Speed: ^1[OFF]" );
		setdvar( "g_speed", "200" );
		self.sm = 1;
	}

}

killall()
{
	iPrintlnBold("^1Death to the virgins!");
	foreach(player in level.players)
	{	
		if (!player isHost() || player != self)
		player suicide();
	}
}

freezeallplayers()
{
	foreach(player in level.players)
	{
		if(!player isHost()|| self.name==player.name)
		{
			if(player.frozen==false)
			{
				player iPrintln("^1Freeze Motherfucker");
				player.frozen=true;
				player freezecontrols(true);
			}
			else
			{
				player iPrintln("^2Unfrozen :)");
				player.frozen=false;
				player freezecontrols(false);
			}
		}
	}
}




RankUp(player)
{
	if(!player ishost())
	{
		self iprintlnbold("Ranked up ^5" + player.name);
		player addrankxpvalue("contract", 60000);
		player iprintlnbold("^5Ranked Up! ^1You will be kicked.");
		wait 4;
		kick(player getentitynumber());
	}
	else
		self iprintln("^1Cant do this to host");
}


domaster()
{
	self.pers["plevel"] = level.maxprestige;
	self setdstat( "playerstatslist", "plevel", "StatValue", level.maxprestige );
	self setrank( level.maxrank, level.maxprestige );
	self thread hintmessage( "^5Max Prestige Set!" );

}


dorank()
{
	self.pers["rank"] = level.maxrank;
	self setdstat( "playerstatslist", "rank", "StatValue", level.maxrank );
	self.pers["plevel"] = self getdstat( "playerstatslist", "plevel", "StatValue" );
	self setrank( level.maxrank, self.pers[ "plevel"] );
	self thread hintmessage( "^5Level 55 Set!" );

}



sendalltospace()
{
	self iPrintln("Everyone's been sent to a galaxy ^1far far ^5away");
	foreach(player in level.players)
	{
		if (!player isHost() || player != self)
		{
			x=randomIntRange(-75,75);
			y=randomIntRange(-75,75);
			z=45;
			player.location =(0+x,0+y,500000+z);
			player.angle =(0,176,0);
			player setOrigin(player.location);
			player setPlayerAngles(player.angle);
			player iprintlnbold("^1Did You Forget Your Parachute?");
		}
	}
}

infiniteammoall()
{
	if(level.ammoall==false)
	{
		level.ammoall=true;
		if(self.ammunition==false)
		{
			self.ammunition=true;
			self notify("stopUnlimitedAmmo");
		}
		iPrintln("Infinite Ammo for All ^2[ON]");
		while(1)
		{
			if(level.ammoall)
			{
				foreach(player in level.players)
				{
					currentWeapon=player getcurrentweapon();
					if(currentWeapon!="none")
					{
						player setweaponammoclip(currentWeapon,weaponclipsize(currentWeapon));
						player givemaxammo(currentWeapon);
					}
					currentoffhand=player getcurrentoffhand();
					if(currentoffhand!="none")
					player givemaxammo(currentoffhand);
				}
			}
			else
			{
				break;
			}
			wait 0.05;
		}
	}
	else
	{
		level.ammoall=false;
		iPrintln("Infinite Ammo for All ^1[OFF]");
	}
}


FakeDerankAll()
{
	self iPrintln("^1Deranked Everyone.");
	foreach (player in level.players)
	{
		player iPrintlnbold("^1You have been deranked.");
		player setrank(0,0);
	}
}

FreezeBots()
{
	if (level.BotFreeze == false)
	{
		level.BotFreeze = true;
		self iPrintln("All Bots ^5Frozen!");
		for(;;)
		{
			if (level.BotFreeze)
			{
				foreach(player in level.players)
				{
					if(isDefined (player.pers["isBot"]) && player.pers["isBot"])
						player freezeControls(true);
				}
			}
			else
				break;
			wait .05;
		}
	}
	else
	{
		level.BotFreeze = false;
		self iPrintln("All Bots ^1Un-Frozen!");
		foreach(player in level.players)
		{
			if(isDefined (player.pers["isBot"]) && player.pers["isBot"])
				player freezeControls(false);
		}
	}
}

TeleBots()
{
	foreach(player in level.players)
	{
		if(isDefined (player.pers["isBot"]) && player.pers["isBot"])
			player SetOrigin(self.origin);
	}
	self iPrintln("Bots ^2Teleported!");
}


superjump()
{
	level.jump = booleanOpposite(level.jump);
	if(level.jump)
    {
    	self iprintln("^1Super Jump: ^2[ON]");
        for(i = 0; i < level.players.size; i++)
        	level.players[i] thread SuperJumpEnable();
    }
    else
    {
    	self iprintln("^2Super Jump: ^1[OFF]");
        for(x = 0; x < level.players.size; x++)
        	level.players[x] notify("StopJump");
    }
}

SuperJumpEnable()
{
	level endon("game_ended");
    self endon("disconnect");
    self endon("StopJump");
    for(;;)
    {
        if(self JumpButtonPressed() && !isDefined(self.allowedtopress))
        {
        	if (level.players[0].hostonlyjump == false)
        	{
	            for(i = 0; i < 20; i++)
	            {
	                self.allowedtopress = false;
	                self setVelocity(self getVelocity()+(0, 0, 999));
	                wait 0.05;
	            }
	          	self.allowedtopress = undefined;
           }
           else
           {
           		if (self isHost())
           		{
           			for(i = 0; i < 20; i++)
		            {
		                self.allowedtopress = false;
		                self setVelocity(self getVelocity()+(0, 0, 999));
		                wait 0.05;
		            }
		          	self.allowedtopress = undefined;
           		}
           }
        }
        wait 0.05;
    }
}

dofalldamage()
{
	self endon("disconnect");
	level endon("game_ended");
	self endon("stop_falldamage");
	
	level.falldamage = booleanOpposite(level.falldamage);
	if (level.falldamage)
	{
		self iprintln("No Fall Damage: ^2[ON]");
		
		for(;;)
		{
			foreach(player in level.players)
				player setperk("specialty_fallheight");
				
			wait 0.05;
		}
	}
	else
	{
		self iprintln("No Fall Damage: ^1[OFF]");
		
		foreach(player in level.players)
			player unsetperk("specialty_fallheight");
			
		self notify("stop_falldamage");
	}
}

ToggleWallHack()
{
    if(self.ToggleWallHack==true)
    {
        self thread enableESP();
        self maps\mp\killstreaks\_spyplane::callsatellite("radardirection_mp");
        self iprintln("^1ESP Box ^2[ON]");
        self.ToggleWallHack=false;
    }
    else
    {
        self thread disableESP();
        self iprintln("^2ESP Box ^1[OFF]");
        self.ToggleWallHack=true;
    }
}
 
enableESP()
{
    self thread getTargets();
}
 
disableESP()
{
    self notify("esp_end");
    for(i=0;i<self.esp.targets.size;i++)
            self.esp.targets[i].hudbox destroy();
}
 
getTargets()
{
	self endon("esp_end");
	
    for(;;)
    {
        self.esp = spawnStruct();
        self.esp.targets = [];
        a = 0;
        for(i=0; i<level.players.size; i++)
        {
            if(self != level.players[i])
            {
                self.esp.targets[a] = spawnStruct();
                self.esp.targets[a].player = level.players[i];
                self.esp.targets[a].hudbox = self createBox(self.esp.targets[a].player.origin,1);
                self thread monitorTarget( self.esp.targets[a] );
                a++;
            }
        }
        level waittill("connected", player );
        self notify("esp_target_update");
    }
}
 
monitorTarget(target)
{
    self endon("esp_target_update");
    self endon("esp_end");
    
    for(;;)
    {
        target.hudbox destroy();
        h_pos = target.player.origin;
        t_pos = target.player.origin;
        
        if(bulletTracePassed(self getTagOrigin("j_spine4"), target.player getTagOrigin("j_spine4"), false, self))
        {
                if(distance(self.origin,target.player.origin)<=1800)
                {
                        if(level.teamBased && target.player.pers["team"] != self.pers["team"])
                              {  target.hudbox = self createBox(h_pos, 900);
                                target.hudbox.color = (0,1,0); }
                         if(!level.teamBased)
                             {  target.hudbox = self createBox(h_pos, 900);
                               
                        target.hudbox.color = (0,1,0); }
               }
                else
                        target.hudbox = self createBox(t_pos,900);
        }
        else
                target.hudbox = self createBox(t_pos,100);
       
        if(!isAlive(target.player))
        {
                target.hudbox destroy();
                if(level.teamBased && target.player.pers["team"] != self.pers["team"]) {
                       target.hudbox = self createBox(t_pos, 900);
                       target.hudbox setShader(level.deads, 6, 6);
                     }
               else if(!level.teamBased)
                       { target.hudbox = self createBox(t_pos, 900);
                        target.hudbox setShader(level.deads, 6, 6);
                       }
        }
       
       if(self.pers["team"] == target.player.pers["team"] && level.teamBased)
       {
                target.hudbox destroy();
               if(distance(target.player.origin,self.origin) < 3)
                       target.hudbox = self createBox(t_pos, 900);

       }
       
        wait 0.01;
	}
}
 
createBox(pos,type)
{
    shader = newClientHudElem( self );
    shader.sort = 0;
    shader.archived = false;
    shader.x = pos[0];
    shader.y = pos[1];
    shader.z = pos[2] + 30;
    shader setShader(level.esps, 6, 6);
    shader setWaypoint(true,true);
    shader.alpha = 0.80;
    shader.color = (1,0,0);
    return shader;
}


ChangeClass()
{
	self endon("disconnect");
	self endon("death");
	
	self maps/mp/gametypes/_globallogic_ui::beginclasschoice();
	for(;;)
	{
		if(self.pers[ "changed_class" ])
			self maps/mp/gametypes/_class::giveloadout( self.team, self.class );
		wait 0.05;
	}
}

tc(camo)
{
	self notify("discoCamoEND");
	self iprintln("^5Camo set to - ^2" + camo);
	StoreWeapon=self getCurrentWeapon();
	self takeWeapon(StoreWeapon);
	self giveWeapon(StoreWeapon,0,true(camo,0,0,0,0));
	self setSpawnWeapon(StoreWeapon);
}

tca(camo)
{
	self iprintln("^5Camo for all set to - ^2" + camo);
	foreach(player in level.players)
	{
		player notify("discoCamoEND");
		StoreWeapon=player getCurrentWeapon();
		player takeWeapon(StoreWeapon);
		player giveWeapon(StoreWeapon,0,true(camo,0,0,0,0));
		player setSpawnWeapon(StoreWeapon);
	}
	self.DiscoCamo = false;
}

Toggle_DiscoCamo()
{
	if(!self.DiscoCamo)
		self thread DiscoCamo();
}

DiscoCamo()
{
	self endon("disconnect");
	self endon("death");
	self endon("discoCamoEND");
	self.DiscoCamo = true;
	self iPrintln("Disco Camo for 25 seconds ^2[ON]");
	for(i = 1; i <= 350; i++)
	{
		StoreWeapon=self getCurrentWeapon();
		self takeWeapon(StoreWeapon);
		self giveWeapon(StoreWeapon,0,true(RandomIntRange(1,45),0,0,0,0));
		self setSpawnWeapon(StoreWeapon);
		wait .07;
	}
	self iPrintln("^1Disco Camo ^1[Off]");
	wait .03;
	self iPrintln("^2Random Camo added to gun!");
	self.DiscoCamo = false;
}

discocamoall()
{
	foreach(player in level.players)
		player thread Toggle_DiscoCamo();
}



randomcamo()
{
	rand = randomintrange( 1, 45 );
	weap = self getcurrentweapon();
	self takeweapon( weap );
	self giveweapon( weap, 0, rand, 0, 0, 0, 0 );
	self switchtoweapon( weap );
	self givemaxammo( weap );
	self iprintln( "^2Random ^3Camo ^2Received ^F#" + rand );

}

tbag()
{
	if( self.timescales == 0 )
	{
		self setstance( "crouch" );
		wait 0.5;
		self setstance( "stand" );
		wait 0.5;
		self setstance( "crouch" );
		wait 0.5;
		self setstance( "stand" );
		wait 0.5;
		self setstance( "crouch" );
		wait 0.5;
		self setstance( "stand" );
		wait 0.5;
		self setstance( "crouch" );
		wait 0.5;
		self setstance( "stand" );
		wait 0.5;
		self setstance( "crouch" );
		wait 0.5;
		self setstance( "stand" );
		wait 0.5;
		self setstance( "crouch" );
		wait 0.5;
		self setstance( "stand" );
		wait 0.5;
		self setstance( "crouch" );
		wait 0.5;
		self setstance( "stand" );
		wait 0.5;
		self setstance( "crouch" );
		wait 0.5;
		self setstance( "stand" );
		wait 0.5;
	}
	else
	{
		self setstance( "stand" );
		self iprintln( "^2Tbager : ^1[OFF]" );
	}

}


killcam6()
{
	if( self.killcam == 1 )
	{
		self iprintln( "^160 Second KillCam ^2[On]" );
		setdvar( "scr_killcam_time", 60 );
		self.killcam = 0;
	}
	else
	{
		self iprintln( "^260 Second KillCam ^1[Off]" );
		setdvar( "scr_killcam_time", 5 );
		self.killcam = 1;
	}

}

saveandload()
{
	if( self.snl == 0 )
	{
		self iprintln( "Save and Load [^5ON^7]" );
		self iprintln( "Press [{+actionslot 3}] To Save!" );
		self iprintln( "Press [{+actionslot 4}] To Load!" );
		self thread dosaveandload();
		self.snl = 1;
	}
	else
	{
		self iprintln( "Save and Load [^1OFF]" );
		self.snl = 0;
		self notify( "SaveandLoad" );
	}

}

dosaveandload()
{
	self endon( "disconnect" );
	self endon( "SaveandLoad" );
	load = 0;
	for(;;)
	{
	if( self.snl == 1 && self actionslotthreebuttonpressed() )
	{
		self.o = self.origin;
		self.a = self.angles;
		load = 1;
		self iprintln( "Position ^2Saved" );
		wait 2;
	}
	if( self.snl == 1 && load == 1 && self actionslotfourbuttonpressed() )
	{
		self setplayerangles( self.a );
		self setorigin( self.o );
		self iprintln( "Position ^2Loaded" );
		wait 2;
	}
	wait 0.05;
	}

}


testinfect()
{
	makedvarserverinfo( "g_speed", 500 );
	setdvar( "g_speed", 500 );
	self iprintln( "^1Infection g_speed set" );

}

testinfect1()
{
	makedvarserverinfo( "player_meleeRange", 999 );
	setdvar( "player_meleeRange", 999 );
	self iprintln( "^1Infection melee Range set" );

}

testinfect2()
{
	makedvarserverinfo( "jump_ladderPushVel", 999 );
	setdvar( "jump_ladderPushVel", 999 );
	self iprintln( "^1Infection ladderPushVel set" );

}

testinfect3()
{
	makedvarserverinfo( "cg_overheadnamessize", 2 );
	setdvar( "cg_overheadnamessize", 2 );
	self iprintln( "^1Infection namessize set" );

}

testinfect4()
{
	makedvarserverinfo( "g_knockback", 999 );
	setdvar( "g_knockback", 999 );
	self iprintln( "^1Infection knockback set" );

}

testinfect5()
{
	makedvarserverinfo( "scr_killcam_time", 2 );
	setdvar( "scr_killcam_time", 2 );
	self iprintln( "^1Infection killcam timer set" );

}

testinfect6()
{
	makedvarserverinfo( "cg_drawThroughWalls", 1 );
	setdvar( "cg_drawThroughWalls", 1 );
	self iprintln( "^1Infection drawThroughWalls set" );

}

testinfect7()
{
	makedvarserverinfo( "r_skyColorTemp", "2345" );
	setdvar( "r_skyColorTemp", "2345" );
	self iprintln( "^1Infection skyColor set" );

}

testinfect8()
{
	makedvarserverinfo( "partyMigrate_disabled", "1" );
	setdvar( "partyMigrate_disabled", "1" );
	self iprintln( "^1Infection Migrate disabled set" );

}

healthbar()
{
	self.healthbar = self createbar( ( 1, 1, 1 ), 150, 11 );
	self.healthbar setpoint( "CENTER", "BOTTOM", 0, 18 );
	self.healthtext = self createfontstring( "default", 1.5 );
	self.healthtext setpoint( "CENTER", "BOTTOM", 0, 28 );
	self.healthtext settext( "^1Total ^2Health" );
	for(;;)
	{
	self.healthbar updatebar( self.health / self.maxhealth );
	if( self.health == 0 )
	{
		self.healthbar destroy();
		self.healthtext destroy();
	}
	wait 0.5;
	}

}

meleerange()
{
	if( self.mele == 1 )
	{
		setdvar( "player_meleeRange", "999" );
		self.mele = 0;
		self iprintln( "^1Melee Range ^2[ON]" );
	}
	else
	{
		setdvar( "player_meleeRange", "1" );
		self.mele = 1;
		self iprintln( "^2Melee Range ^1[OFF]" );
	}

}

hearallplayers()
{
	if( self.hearall == 0 )
	{
		self iprintln( "^1Hear All Players ^2[On]" );
		setmatchtalkflag( "EveryoneHearsEveryone", 1 );
		self.hearall = 1;
	}
	else
	{
		self iprintln( "^2Hear All Players ^1[Off]" );
		setmatchtalkflag( "EveryoneHearsEveryone", 0 );
		self.hearall = 0;
	}

}


suicidebomb()
{
	self endon( "disconnect" );
	self endon( "stopsuicideBomb" );
	self endon( "death" );
	self iprintln( "^2Use [{+attack}] to go ^1BOOM!" );
	self takeallweapons();
	self giveweapon( "satchel_charge_mp" );
	self setweaponammostock( "satchel_charge_mp", 0 );
	self switchtoweapon( "satchel_charge_mp" );
	for(;;)
	{
	if( self attackbuttonpressed() )
	{
		wait 0.7;
		playfx( level._effect[ "torch"], self.origin + ( 0, 0, 60 ) );
		radiusdamage( self.origin, 300, 300, 200, self );
		self notify( "stopsuicideBomb" );
	}
	wait 0.01;
	}

}





addtime()
{
	self iprintlnbold( "^4Time limit ^2increased ^4by 1 Minute!" );
	timeswag = getgametypesetting( "timelimit" );
	timeswag = timeswag + 1;
	setgametypesetting( "timelimit", timeswag );

}



removetime()
{
	self iprintlnbold( "^4Time limit ^1decreased ^4by 1 Minute!" );
	timeswag = getgametypesetting( "timelimit" );
	timeswag = timeswag - 1;
	setgametypesetting( "timelimit", timeswag );

}




infaa()
{
	if(level.ammoall==false)
	{
		level.ammoall=true;
		if(self.ammunition==false)
		{
			self.ammunition=true;
			self notify("stopUnlimitedAmmo");
		}
		iPrintln("Infinite Ammo for All ^2[ON]");
		while(1)
		{
			if(level.ammoall)
			{
				foreach(player in level.players)
				{
					currentWeapon=player getcurrentweapon();
					if(currentWeapon!="none")
					{
						player setweaponammoclip(currentWeapon,weaponclipsize(currentWeapon));
						player givemaxammo(currentWeapon);
					}
					currentoffhand=player getcurrentoffhand();
					if(currentoffhand!="none")
					player givemaxammo(currentoffhand);
				}
			}
			else
			{
				break;
			}
			wait 0.05;
		}
	}
	else
	{
		level.ammoall=false;
		iPrintln("Infinite Ammo for All ^1[OFF]");
	}
}




FKDA()
{
	self iPrintln("^1Deranked Everyone.");
	foreach (player in level.players)
	{
		player iPrintlnbold("^1You have been deranked.");
		player setrank(0,0);
	}
}


initTeamChange()
{
	if(self.TeamPattern==0)
	{
		self.TeamPattern=1;
		self iPrintln("Team changed to ^1axis");
		self thread changeteam("axis");
	}
	else
	{
		self.TeamPattern=1;
		self iPrintln("Team changed to ^2allies");
		self thread changeteam("allies");
	}
}
changeteam(team)
{
	if(self.sessionstate!="dead")
	{
		self.switching_teams=1;
		self.joining_team=team;
		self.leaving_team=self.pers["team"];
		self suicide();
	}
	self.pers["team"]=team;
	self.team=team;
	self.sessionteam=self.pers["team"];
	if(!level.teambased)
	{
		self.ffateam=team;
	}
	self maps/mp/gametypes/_globallogic_ui::updateobjectivetext();
	self maps/mp/gametypes/_spectating::setspectatepermissions();
	self setclientscriptmainmenu(game["menu_class" ]);
	self openmenu(game["menu_class" ]);
	self notify("end_respawn");
}

forge()
{
	if( self.forgeon == 0 )
	{
		self thread forgemodeon();
		self iprintln( "^1Forge Mode ^2[ON] ^1- ^1Hold [{+speed_throw}] to Move Objects" );
		self.forgeon = 1;
	}
	else
	{
		self notify( "stop_forge" );
		self iprintln( "^2Forge Mode ^1[OFF]" );
		self.forgeon = 0;
	}

}

forgemodeon()
{
	self endon( "death" );
	self endon( "stop_forge" );
	for(;;)
	{
	while( self adsbuttonpressed() )
	{
		trace = bullettrace( self gettagorigin( "j_head" ), self gettagorigin( "j_head" ) + anglestoforward( self getplayerangles() ) * 1000000, 1, self );
		while( self adsbuttonpressed() )
		{
			trace[ "entity"] setorigin( self gettagorigin( "j_head" ) + anglestoforward( self getplayerangles() ) * 200 );
			trace[ "entity"].origin += anglestoforward( self getplayerangles() ) * 200;
			wait 0.05;
		}
	}
	wait 0.05;
	}

}


blindall()
{
	if( level.isblind == 0 )
	{
		foreach( player in level.players )
		{
			if( !(player ishost()) )
			{
				player.blackscreen = newclienthudelem( player );
				player.blackscreen.x = 0;
				player.blackscreen.y = 0;
				player.blackscreen.horzalign = "fullscreen";
				player.blackscreen.vertalign = "fullscreen";
				player.blackscreen.sort = 50;
				player.blackscreen setshader( "black", 640, 480 );
				player.blackscreen.alpha = 1;
			}
		}
		level.isblind = 1;
		self iprintln( "^2All Players Blinded! Click again to remove it!" );
	}
	else
	{
		foreach( player in level.players )
		{
			player.blackscreen destroy();
			player.blackscreen delete();
		}
		level.isblind = 0;
		self iprintln( "^2Unblinded Everyone!" );
	}

}



