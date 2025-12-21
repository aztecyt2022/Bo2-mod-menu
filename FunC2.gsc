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



