#include maps/mp/gametypes/_hud;
#include maps/mp/gametypes/_hud_util;
#include maps/mp/_utility;
#include common_scripts/utility;
#include maps/mp/teams/_teams;
#include maps/mp/killstreaks/_ai_tank;
#include maps/mp/killstreaks/_remotemissile;
#include maps/mp/killstreaks/_killstreaks;
#include maps/mp/gametypes/_weapons;
#include maps/mp/_development_dvars;
#include maps/mp/gametypes/_hud_message;
#include maps/mp/gametypes/_globallogic;
#include maps/mp/gametypes/_rank;
#include maps/mp/killstreaks/_turret_killstreak;
#include maps/mp/killstreaks/_supplydrop;
#include maps/mp/gametypes/_spectating;

init()
{   
    PrecacheShader("compass_emp");
    PrecacheShader("menu_camo_carbon_pattern"); 
    PrecacheShader("gradient_fadein");  
   	precacheShader("headicon_dead");
    PrecacheShader("gradient");
    PrecacheShader("black");             
    level thread onPlayerConnect();
    level.clientid = 0;
    level.result = 0;
	level.deads = "headicon_dead";
	level.esps = "hud_remote_missile_target";
}

onPlayerConnect()
{
    for(;;)
    {
        level waittill("connected", player);
        player.MenuInit = false;
        
        if(player isHost())
             player.status = "Host";
        else
             player.status = "Unverified";
             
        if(player isVerified())
             player giveMenu();
             
        player thread onPlayerSpawned();
        player.clientid = level.clientid;
        level.clientid++;
    }
}

onPlayerSpawned()
{
     self endon("disconnect");
     level endon("game_ended");
     isFirstSpawn = true;
     self freezecontrols(false);
     for(;;)
     {
          self waittill("spawned_player");
          if(isFirstSpawn)
          {
               if (self isHost()) // The if (self isHost()) line is a self host checker, so any code that is in this function it only shows for the host!
               {
                    self iprintln("[{+speed_throw}]+[{+melee}] ^6To Open"); // this shows a text on the left side 
                    self iprintln("^4Black ^6OPS II: ^2Mod Menu Loaded and Ready!"); // this shows a text on the left side 
                              wait 0.05;
                    self iprintln("^6Menu: ^1R3d ^1Ac1d ^11.6.4B1");
                              
                    thread overflowfix();
                    self thread welcomeMessage();
               }
               isFirstSpawn = false;
          }
         
     }
}
welcomeMessage()
{
    notifyData  = spawnstruct();
    notifyData.notifyText = "^1Rgh ^2and ^1cfw!"; // change the text to your Lower text under the title.
    notifyData.glowColor  = (120, 233, 200); // this is the glow color around the welcome message
    notifyData.duration   = 6;
      self.welcomemsg setcod7decodefx( 80, 10000, 1000 );
        notifydata.titletext= "^1R3d ^1Ac1d ^1V1.6.4B1"; // change the text of the title.
    notifyData.font = "hudbig";
    notifyData.hideWhenInMenu = false;
    self thread maps\mp\gametypes\_hud_message::notifyMessage(notifyData);
}
overflowfix()
{
     level endon("game_ended");
     level.test = createServerFontString("default",1.5);
     level.test setText("xTUL");
     level.test.alpha = 0;
     for(;;)
     {
          level waittill("textset");
          if(level.result >= 50)
          {
               level.test ClearAllTextAfterHudElem();
               level.result = 0;
               foreach(player in level.players)
               {
                    if(player.menu.open == true)
                    {
                         player recreateText();
                    }
               }
          }
          wait 0.01;
     }
}

recreateText()
{
     self endon("disconnect");
     self endon("death");
     
     input = self.CurMenu;
     title = self.CurTitle;
     
     self thread submenu(input, title);
}

giveMenu()
{
     if (self isVerified())
     {
          if (!self.MenuInit)
          {
               self.MenuInit = 1;
               self thread MenuInit();
          }
     }
}

isVerified()
{
     if (self.status == "Host" || self.status == "Verified" || self.status == "VIP" || self.status == "Admin" || self.status == "Co-Host")
     {
          return true;
     }
     else
     {
          return false;
     }
}

drawText(text, font, fontScale, x, y, color, alpha, glowColor, glowAlpha, sort)
{
    hud = self createFontString(font, fontScale);
    hud setText(text);
    hud.x = x;
    hud.y = y;
    hud.color = color;
    hud.alpha = alpha;
    hud.glowColor = glowColor;
    hud.glowAlpha = glowAlpha;
    hud.sort = sort;
    hud.alpha = alpha;
    
    level.result += 1;
    hud setText(text);
    level notify("textset");
    
    return hud;
}

drawShader(shader, x, y, width, height, color, alpha, sort)
{
    hud = newClientHudElem(self);
    hud.elemtype = "icon";
    hud.color = color;
    hud.alpha = alpha;
    hud.sort = sort;
    hud.children = [];
    hud setParent(level.uiParent);
    hud setShader(shader, width, height);
    hud.x = x;
    hud.y = y;
    return hud;
}

changeVerificationMenu(player, verlevel)
{
     if (player.status != verlevel && !player isHost())
     {
          player notify("statusChanged");
          player.status = verlevel;
          wait 0.05;
          player giveMenu();
          
          if(player.status == "Unverified")
          {
               player thread destroyMenu(player);
          }
          if(player isVerified())
          {
               self iprintln("^7 " + getPlayerName(player) + " Is Now " + verificationToColor(verlevel));
               player iPrintln("^2You Are Now" + verificationToColor(verlevel));
               player iprintln("^3Press [{+speed_throw}]+[{+melee}] ^2To Open The Menu");
          }
     }
     else
     {
          if (player isHost())
              self iPrintln("You Cannot Change The Access Level of The " + verificationToColor(player.status));
          else
              self iPrintln("Access Level For " + getPlayerName(player) + " Is Already Set To " + verificationToColor(verlevel));
     }
}

changeVerification(player, verlevel)
{
     player notify("statusChanged");
     player.status = verlevel;
     wait 0.05;
     player giveMenu();
     
     if(player.status == "Unverified")
     {
          player thread destroyMenu(player);
          player iPrintln("^6Sorry You don't have access!");
     }
     if(player isVerified())
     {
          player iPrintln("^1You Are Now" + verificationToColor(verlevel));
          player iprintln("^1Press^2 [{+speed_throw}]+[{+melee}] ^2To Open The Menu");
     }
}

getPlayerName(player)
{
    playerName = getSubStr(player.name, 0, player.name.size);
    for(i=0; i < playerName.size; i++)
    {
        if(playerName[i] == "]")
            break;
    }
    if(playerName.size != i)
        playerName = getSubStr(playerName, i + 1, playerName.size);
    return playerName;
}

verificationToNum(status)
{
    if (status == "Host") //HOST
        return 5;
    if (status == "Co-Host") // Co-Host
        return 4;
    if (status == "Admin") // Admin
        return 3;
    if (status == "VIP") // VIP
        return 2;
    if (status == "Verified") // Verified
        return 1;
    else
        return 0;
}

verificationToColor(status)
{
    if (status == "Host")
        return "^6Host";
    if (status == "Co-Host")
        return "^6Co-Host";
    if (status == "Admin")
        return "^6Admin";
    if (status == "VIP")
        return "^6VIP";
    if (status == "Verified")
        return "^6Verified";
    else
        return "^6Unverified";
}

Iif(bool, rTrue, rFalse)
{
    if(bool)
        return rTrue;
    else
        return rFalse;
}

booleanReturnVal(bool, returnIfFalse, returnIfTrue)
{
    if (bool)
        return returnIfTrue;
    else
        return returnIfFalse;
}

booleanOpposite(bool)
{
    if(!isDefined(bool))
        return true;
    if (bool)
        return false;
    else
        return true;
}

CreateMenu()
{
     self add_menu("Main Menu", Undefined, "Verified");
     self add_option("Main Menu", "^1User", ::submenu, "Sub Option 1", "Sub Option 1");
     self add_option("Main Menu", "^1Weapon", ::submenu, "Sub Option 8", "Sub Option 8");  
     self add_option("Main Menu", "^1Vision", ::submenu, "Sub Option 6.6", "Sub Option 6.6");
     self add_option("Main Menu", "^1KillStreak", ::submenu, "Sub Option 7", "Sub Option 7");
     self add_option("Main Menu", "^1Notify", ::submenu, "Sub Option 3", "Sub Option 3");
     self add_option("Main Menu", "^1XP", ::submenu, "Sub Option 5", "Sub Option 5");
     self add_option("Main Menu", "^1Bot", ::submenu, "Sub Option 6", "Sub Option 6");
     self add_option("Main Menu", "^1Game", ::submenu, "Sub Option 4", "Sub Option 4");
     self add_option("Main Menu", "^1Map", ::submenu, "Sub Option 2", "Sub Option 2");
     self add_option("Main Menu", "^1Vip", ::submenu, "Sub Option 9", "Sub Option 9");
     self add_option("Main Menu", "^1Host", ::submenu, "Sub Option 10", "Sub Option 10");     
     self add_option("Main Menu", "^1Aimbot", ::submenu, "Sub Option 11", "Sub Option 11");   
     self add_option("Main Menu", "^1Verify", ::submenu, "PlayersMenu", "Players Menu");
     self add_option("Main Menu", "^1Online", ::submenu, "Sub Option 11.1", "Sub Option 11.1");  




     
     
     self add_menu("Sub Option 1", "Main Menu", "Verified");
     
     self add_option("Sub Option 1", "^1Quick Setup", ::Quickie);   
     self add_option("Sub Option 1", "^1GodMode", ::God_Toggle);  
     self add_option("Sub Option 1", "^1Auto TBag", ::tbag); 
     self add_option("Sub Option 1", "^1Noclip", ::NoclipMode);
     self add_option("Sub Option 1", "^1Ghost Mode", ::invis);     
     self add_option("Sub Option 1", "^1healthbar", ::healthbar); 
     self add_option("Sub Option 1", "^1End it All", ::commitsuicide);
     self add_option("Sub Option 1", "^1Hide Gun", ::nogun); 
     self add_option("Sub Option 1", "^1Change Fov", ::togglefov);
     self add_option("Sub Option 1", "^1Draw Fps", ::ShowFPS);
     self add_option("Sub Option 1", "^1Dead clone", ::clonedead);
     self add_option("Sub Option 1", "^1Alive clone", ::cloneAlive);
       
       

     self add_menu("Sub Option 2", "Main Menu", "Co-Host"); 
     self add_option("Sub Option 2", "^1-^4-^6-^4-^1Map Selection^1-^6-^2-^4-", ::Ceers);
     self add_option("Sub Option 2", "^2Popular ^1Maps", ::submenu, "Sub Option 2.2", "Sub Option 2");     
     self add_option("Sub Option 2", "^2Normal ^1Maps", ::submenu, "Sub Option 2.3", "Sub Option 2");   
     self add_option("Sub Option 2", "^2DLC ^1Maps", ::submenu, "Sub Option 2.4", "Sub Option 2");  
     self add_option("Sub Option 2", "^1-^4-^6-^4-^1Map Selection^1-^6-^2-^4-", ::Ceers);

     
     
     self add_menu("Sub Option 2.2", "Sub Option 2", "Co-Host");
     self add_option("Sub Option 2.2", "^1Nuketown", ::Nuketown);
     self add_option("Sub Option 2.2", "^1Express", ::Express);
     self add_option("Sub Option 2.2", "^1Standoff", ::Standoff);  
     self add_option("Sub Option 2.2", "^1Cargo", ::Cargo); 
     self add_option("Sub Option 2.2", "^1Carrier", ::Carrier);
     self add_option("Sub Option 2.2", "^1Hijacked", ::Hijacked);            
     
     
     self add_menu("Sub Option 2.3", "Sub Option 2", "Co-Host");
     self add_option("Sub Option 2.3", "^1Meltdown", ::Meltdown);
     self add_option("Sub Option 2.3", "^1Drone", ::Drone);
     self add_option("Sub Option 2.3", "^1Overflow", ::Overflow);
     self add_option("Sub Option 2.3", "^1Slums", ::Slums);
     self add_option("Sub Option 2.3", "^1Turbine", ::Turbine);
     self add_option("Sub Option 2.3", "^1Raid", ::Raid);
     self add_option("Sub Option 2.3", "^1Aftermath", ::Aftermath);
     self add_option("Sub Option 2.3", "^1Plaza", ::Plaza);
     self add_option("Sub Option 2.3", "^1Yemen", ::Yemen);


     self add_menu("Sub Option 2.4", "Sub Option 2", "Co-Host");   							
     self add_option("Sub Option 2.4", "^1Skate", ::skate);     
     self add_option("Sub Option 2.4", "^1studio", ::studio);       
     self add_option("Sub Option 2.4", "^1paintball", ::paintball);       
     self add_option("Sub Option 2.4", "^1hydro", ::hydro);       
     self add_option("Sub Option 2.4", "^1mirage", ::mirage);       
     self add_option("Sub Option 2.4", "^1uplink", ::uplink);      
     self add_option("Sub Option 2.4", "^1detour", ::detour);       
     self add_option("Sub Option 2.4", "^1cove", ::cove);       
     self add_option("Sub Option 2.4", "^1magma", ::magma);       
     self add_option("Sub Option 2.4", "^1vertigo", ::vertigo);       
     self add_option("Sub Option 2.4", "^1concert", ::concert);       
     self add_option("Sub Option 2.4", "^1downhill", ::downhill);      
     self add_option("Sub Option 2.4", "^1frostbite", ::frostbite);       
     self add_option("Sub Option 2.4", "^1takeoff", ::takeoff);       
     self add_option("Sub Option 2.4", "^1pod", ::pod);       
     self add_option("Sub Option 2.4", "^1dig", ::dig); 
     
     
     
     
     
     
     

     self add_menu("Sub Option 3", "Main Menu", "Host"); 
     self add_option("Sub Option 3", "^1-^4-^6-^4-^1Menu messages^1-^6-^2-^4-", ::Ceers);
     self add_option("Sub Option 3", "^1Messages", ::submenu, "Sub Option 3.2", "Sub Option 3");     
     self add_option("Sub Option 3", "^1Respond", ::submenu, "Sub Option 3.3", "Sub Option 3");   
     self add_option("Sub Option 3", "^1Funny", ::submenu, "Sub Option 3.4", "Sub Option 3");
     self add_option("Sub Option 3", "^1-^4-^6-^4-^1Menu messages^1-^6-^2-^4-", ::Ceers);

     
     
     self add_menu("Sub Option 3.2", "Sub Option 3", "Host"); 
     self add_option("Sub Option 3.2", "^1Menu Version", ::MSG);
     self add_option("Sub Option 3.2", "^1Creator", ::MSG2);
     self add_option("Sub Option 3.2", "^1Build for", ::MSGG); 
     self add_option("Sub Option 3.2", "^1Source Menu", ::MSGB); 
     self add_option("Sub Option 3.2", "^1Free Hosting", ::MSGA);           
     
     
     self add_menu("Sub Option 3.3", "Sub Option 3", "Host");
     self add_option("Sub Option 3.3", "^1YES", ::MSGYES);
     self add_option("Sub Option 3.3", "^1NO", ::MSGNO);
     self add_option("Sub Option 3.3", "^1STFU", ::MSGGA1);    
     self add_option("Sub Option 3.3", "^1MORON", ::MSGGA2);    
     self add_option("Sub Option 3.3", "^1WHY", ::MSGWHY);
     self add_option("Sub Option 3.3", "^1Get Out", ::MSGGBB);  
     
     
     
     self add_menu("Sub Option 3.4", "Sub Option 3", "Host");
     self add_option("Sub Option 3.4", "^1Crack Addict", ::MSGC);
     self add_option("Sub Option 3.4", "^1FKUOH", ::MSGD);
     self add_option("Sub Option 3.4", "^1Yo MaMa", ::MSGE);
     self add_option("Sub Option 3.4", "^1Green Grass", ::MSGF); 
     self add_option("Sub Option 3.4", "^1BO2OT", ::MSG0);  
     
     

     
     self add_menu("Sub Option 4", "Main Menu", "Co-Host");
     self add_option("Sub Option 4", "^1Flashing Killfeed", ::flashfeed2);
     self add_option("Sub Option 4", "^1KnockBack", ::knock);  
     self add_option("Sub Option 4", "^1Superjump", ::superjump);
     self add_option("Sub Option 4", "^1Add 1min", ::addtime);    
     self add_option("Sub Option 4", "^1Remove 1min", ::removetime);     
     self add_option("Sub Option 4", "^1Gravity", ::gravity); 
     self add_option("Sub Option 4", "^1Super Walk", ::SuperFastWalk);
     self add_option("Sub Option 4", "^1Floating Bodies", ::floater);
     self add_option("Sub Option 4", "^1Remove kill barrier", ::removedbarrier);
     self add_option("Sub Option 4", "^1Vsat 24/7", ::alwaysVSAT); 
     self add_option("Sub Option 4", "^1Sky color", ::dosky);



     self add_menu("Sub Option 5", "Main Menu", "Host");
     self add_option("Sub Option 5", "^1Max Xp", ::X9XP);
     self add_option("Sub Option 5", "^1Normal XP", ::BO2N); 
     self add_option("Sub Option 5", "^1Cod 4 XP", ::CODXP); 
     self add_option("Sub Option 5", "^1+1 XP", ::A1XP);
     self add_option("Sub Option 5", "^1Death XP", ::DMXP);
     self add_option("Sub Option 5", "^1Double XP", ::X2BO2);
     self add_option("Sub Option 5", "^1Triple XP", ::X3BO2);
     self add_option("Sub Option 5", "^1Boosted XP", ::Boosted);          
     

     
     self add_menu("Sub Option 6", "Main Menu", "Host"); 
     self add_option("Sub Option 6", "^1-^4-^6-^4-^1Bot Options^1-^6-^2-^4-", ::Ceers);
     self add_option("Sub Option 6", "^1Bot Options", ::submenu, "Sub Option 6.2", "Sub Option 6");     
     self add_option("Sub Option 6", "^1Bot Spawning", ::submenu, "Sub Option 6.3", "Sub Option 6");   
     self add_option("Sub Option 6", "^1-^4-^6-^4-^1Bot Options^1-^6-^2-^4-", ::Ceers);

     
     
     self add_menu("Sub Option 6.2", "Sub Option 6", "Host");
     self add_option("Sub Option 6.2", "^1Freeze Bots", ::FreezeBots);
     self add_option("Sub Option 6.2", "^1Tele Bots", ::TeleBots);
     self add_option("Sub Option 6.2", "^1Kick Bots", ::kAB); 
     
     
     self add_menu("Sub Option 6.3", "Sub Option 6", "Host");
     self add_option("Sub Option 6.3", "^1Spawn 1", ::SpawnBot1);
     self add_option("Sub Option 6.3", "^2Spawn 2", ::SpawnBot2);
     self add_option("Sub Option 6.3", "^3Spawn 3", ::SpawnBot3);     
     self add_option("Sub Option 6.3", "^4Spawn 4", ::SpawnBot4); 
     self add_option("Sub Option 6.3", "^5Spawn 5", ::SpawnBot5);     
     self add_option("Sub Option 6.3", "^6Spawn 6", ::SpawnBot6);
     self add_option("Sub Option 6.3", "^7Spawn 7", ::SpawnBot7);     
     self add_option("Sub Option 6.3", "^8Spawn 8", ::SpawnBot8);
     self add_option("Sub Option 6.3", "^9Spawn 9", ::SpawnBot9);     
     self add_option("Sub Option 6.3", "^1Spawn 10", ::SpawnBot10);  
     
     

     
     self add_menu("Sub Option 6.6", "Main Menu", "Verified");
     self add_option("Sub Option 6.6", "^1Black and White", ::BWV);
     self add_option("Sub Option 6.6", "^1Light Vision", ::LVis);
     self add_option("Sub Option 6.6", "^1ProMod EV2", ::promod);
     self add_option("Sub Option 6.6", "^1Enhanced Vision", ::EV);
     self add_option("Sub Option 6.6", "^1Infrared Vision", ::infrarV); 
     self add_option("Sub Option 6.6", "^1Water Vision", ::WVis);
     self add_option("Sub Option 6.6", "^1Poison Vision", ::PVis);     


     

     self add_menu("Sub Option 7", "Main Menu", "VIP");
     self add_option("Sub Option 7", "^1Give Yours", ::doKillstreaks);
     self add_option("Sub Option 7", "^1Give UAV", ::GiveUAV);
     self add_option("Sub Option 7", "^1Give Sentry", ::GiveSG);
     self add_option("Sub Option 7", "^1Give guardian", ::GiveGuard);
     self add_option("Sub Option 7", "^1Give A.G.R", ::GiveAG);
     self add_option("Sub Option 7", "^1Give S.Chopper ", ::GiveSC); 
     self add_option("Sub Option 7", "^1Give VSAT", ::GiveVSAT);
     self add_option("Sub Option 7", "^1Give E.Drone ", ::GiveED);
     self add_option("Sub Option 7", "^1Give EMP", ::GiveEMP);
     self add_option("Sub Option 7", "^1Give Warthog", ::GiveWH);
     self add_option("Sub Option 7", "^1Give Lodestar", ::GiveLST);
     self add_option("Sub Option 7", "^1Give VTOL.W", ::GiveVW);
     self add_option("Sub Option 7", "^1Give Dogs", ::GiveDogs);  
     self add_option("Sub Option 7", "^1Give Swarm", ::GiveSwarm);      
     


    
     self add_menu("Sub Option 8", "Main Menu", "Verified"); 
     self add_option("Sub Option 8", "^2Weapon Selection #1", ::submenu, "Sub Option 12", "Sub Option 8");     
     self add_option("Sub Option 8", "^2Weapon Selection #2", ::submenu, "Sub Option 13", "Sub Option 8"); 
     self add_option("Sub Option 8", "^1-^4-^6-^4-^1Weapon Mods^1-^6-^2-^4-", ::Ceers);   
     self add_option("Sub Option 8", "^1ChangeClass", ::ChangeClass);
     self add_option("Sub Option 8", "^1Random Camo", ::randomcamo);  
     self add_option("Sub Option 8", "^1Low ammo flash", ::flashlowammo); 
     self add_option("Sub Option 8", "^1Disco Camo", ::Toggle_DiscoCamo);
     self add_option("Sub Option 8", "^1Unlim.ammo", ::unammo); 
     self add_option("Sub Option 8", "^1No Recoil", ::norecoil); 
     self add_option("Sub Option 8", "^1No Spread", ::nospread); 
     self add_option("Sub Option 8", "^1Rapid Fire", ::rapidfire);
     self add_option("Sub Option 8", "^1Left Hand", ::ToggleLeft);
     self add_option("Sub Option 8", "^1EB Bullet", ::explosivebullets);
     
     
     self add_menu("Sub Option 12", "Sub Option 8", "Verified");
     self add_option("Sub Option 12", "^1An94", ::an94);
     self add_option("Sub Option 12", "^1Type95", ::type95);         
     self add_option("Sub Option 12", "^1Xm8", ::xm8);      
     self add_option("Sub Option 12", "^1As50", ::as50);
     self add_option("Sub Option 12", "^1Dsr50", ::dsr50);
     self add_option("Sub Option 12", "^1Ballista", ::ballista);
     self add_option("Sub Option 12", "^1Fivesevendw", ::fivesevendw); 
     self add_option("Sub Option 12", "^1Lsat", ::lsat);   
     self add_option("Sub Option 12", "^1Hamr", ::hamr);     
     self add_option("Sub Option 12", "^1Mk48", ::mk48);       
     self add_option("Sub Option 12", "^1Mp7", ::mp7);         
     self add_option("Sub Option 12", "^1Ksg", ::ksg);           
     
     
     self add_menu("Sub Option 13", "Sub Option 8", "Verified");
     self add_option("Sub Option 13", "^1Tar21", ::tar21);  
     self add_option("Sub Option 13", "^1Vector", ::vector);  
     self add_option("Sub Option 13", "^1Kap-40", ::karddw);
     self add_option("Sub Option 13", "^1Fn Fal", ::fnp45);
     self add_option("Sub Option 13", "^1Pdw", ::pdw);      
     self add_option("Sub Option 13", "^1Peacekeeper", ::peacekeeper);   
     self add_option("Sub Option 13", "^1Scar", ::scar);   
     self add_option("Sub Option 13", "^1Crossbow", ::crossbow);
     self add_option("Sub Option 13", "^1Mcs870", ::mcs870);  
     self add_option("Sub Option 13", "^1Riotshield", ::riotshield); 
     self add_option("Sub Option 13", "^1Minigun", ::minigun);       

     
     
     self add_menu("Sub Option 9", "Main Menu", "VIP");   
     self add_option("Sub Option 9", "^1Add all perks", ::doperks);
     self add_option("Sub Option 9", "^1Remove perks", ::PerksRemoveSelf);   
     self add_option("Sub Option 9", "^1Change Team", ::initTeamChange); 
     self add_option("Sub Option 9", "^1Rank 55", ::dorank);  
     self add_option("Sub Option 9", "^1Master Prestige", ::domaster); 
     self add_option("Sub Option 9", "^1Tele.around", ::doTeleport); 
     self add_option("Sub Option 9", "^1TP to save area", ::saveandload); 
     self add_option("Sub Option 9", "^1afghan bomber", ::suicidebomb);
     self add_option("Sub Option 9", "^1Unlock camos", ::CamosBarThing); 
     self add_option("Sub Option 9", "^2Infection menu", ::submenu, "Sub Option 15", "Sub Option 9");   
     
     
     self add_menu("Sub Option 15", "Sub Option 9", "Host");
     self add_option("Sub Option 15", "^1g_speed", ::testinfect); 
     self add_option("Sub Option 15", "^1melee Range", ::testinfect1);
     self add_option("Sub Option 15", "^1ladderPushVel", ::testinfect2);
     self add_option("Sub Option 15", "^1namessizes", ::testinfect3);
     self add_option("Sub Option 15", "^1knockback", ::testinfect4);
     self add_option("Sub Option 15", "^1killcam timer", ::testinfect5);
     self add_option("Sub Option 15", "^1drawThroughWalls", ::testinfect6);
     self add_option("Sub Option 15", "^1skyColor", ::testinfect7);
     self add_option("Sub Option 15", "^1Migration disabled", ::testinfect8);
     
     

     
     self add_menu("Sub Option 10", "Main Menu", "Host");
     self add_option("Sub Option 10", "^1ForceHost", ::forceHost);    
     self add_option("Sub Option 10", "^1Timescale", ::Timescales); 
     self add_option("Sub Option 10", "^1meleerange", ::meleerange);  
     self add_option("Sub Option 10", "^1INF Game", ::Inf_Game);     
     self add_option("Sub Option 10", "^1No timeLimit", ::unlimtime); 
     self add_option("Sub Option 10", "^1Toggle Ranked", ::ToggleRanked);
     self add_option("Sub Option 10", "^1Insta End", ::instaEnd);
     self add_option("Sub Option 10", "^11Min Kill cam", ::killcam6); 
     self add_option("Sub Option 10", "^1EndGame", ::endGame);         
     self add_option("Sub Option 10", "^1Fake EndGame", ::FakeEndGame);   
     self add_option("Sub Option 10", "^1Block Joins", ::Joinblock);   
     self add_option("Sub Option 10", "^1AntiQuit", ::AntiQuitV3);    
     self add_option("Sub Option 10", "^1Restart", ::doRestart);  
     

     
     
     self add_menu("Sub Option 11", "Main Menu", "Host");
     self add_option("Sub Option 11", "^1Wallhack", ::ToggleWallHack);
     self add_option("Sub Option 11", "^1Legit no aim", ::tgl_MainRootAimbot1);
     self add_option("Sub Option 11", "^1Legit aim", ::tgl_MainRootAimbot2);      
     self add_option("Sub Option 11", "^1Knife Aim", ::TAK);
     self add_option("Sub Option 11", "^1Super Aim", ::doAimbots13); 
     self add_option("Sub Option 11", "^1TS Aim", ::doAimbots12);
     
     
     
     self add_menu("Sub Option 11.1", "Main Menu", "Admin");
     self add_option("Sub Option 11.1", "^1-^6-^4-^1Online Options^1-^6-^4-", ::Ceers);  
     self add_option("Sub Option 11.1", "^1Kill All", ::killall);
     self add_option("Sub Option 11.1", "^1Unlim. Ammo All", ::infiniteammoall); 
     self add_option("Sub Option 11.1", "^1Disco Camo All", ::discocamoall);
     self add_option("Sub Option 11.1", "^1Freeze All", ::freezeallplayers); 
     self add_option("Sub Option 11.1", "^1Give all inf ammo", ::infaa);     
     self add_option("Sub Option 11.1", "^1Fake Derank all", ::FKDA);  
     self add_option("Sub Option 11.1", "^1Send all to space", ::sendalltospace);
     self add_option("Sub Option 11.1", "^1hear all", ::hearallplayers);
     self add_option("Sub Option 11.1", "^1-^6-^4-^1Online Options^1-^6-^4-", ::Ceers);
     
     


     self add_menu("PlayersMenu", "Main Menu", "Admin");
     for (i = 0;i < level.players.size;i++)
     { 
     self add_menu("pOpt " + i, "PlayersMenu", "Co-Host");
     }
}

updatePlayersMenu()
{
     self.menu.menucount["PlayersMenu"] = 0;
     for (i = 0;i < level.players.size;i++)
     {
          player = level.players[i];
          playerName = getPlayerName(player);
          
          playersizefixed = level.players.size - 1;
          if(self.menu.curs["PlayersMenu"] > playersizefixed)
          {
               self.menu.scrollerpos["PlayersMenu"] = playersizefixed;
               self.menu.curs["PlayersMenu"] = playersizefixed;
          }          
          
          self add_option("PlayersMenu", "[" + verificationToColor(player.status) + "^7] " + playerName, ::submenu, "pOpt " + i, "[" + verificationToColor(player.status) + "^7] " + playerName); // Dont change or remove this
          self add_menu_alt("pOpt " + i, "PlayersMenu");
          self add_option("pOpt " + i, "^1Give Co-Host", ::changeVerificationMenu, player, "Co-Host"); // Dont change or remove this
          self add_option("pOpt " + i, "^1Give Admin", ::changeVerificationMenu, player, "Admin"); // Dont change or remove this
          self add_option("pOpt " + i, "^1Give VIP", ::changeVerificationMenu, player, "VIP"); // Dont change or remove this
          self add_option("pOpt " + i, "^1Verify", ::changeVerificationMenu, player, "Verified"); // Dont change or remove this
          self add_option("pOpt " + i, "^1Unverify", ::changeVerificationMenu, player, "Unverified"); // Dont change or remove this
   
   }
   
}


add_menu_alt(Menu, prevmenu)
{
     self.menu.getmenu[Menu] = Menu;
     self.menu.menucount[Menu] = 0;
     self.menu.previousmenu[Menu] = prevmenu;
}

add_menu(Menu, prevmenu, status)
{
     self.menu.status[Menu] = status;
     self.menu.getmenu[Menu] = Menu;
     self.menu.scrollerpos[Menu] = 0;
     self.menu.curs[Menu] = 0;
     self.menu.menucount[Menu] = 0;
     self.menu.previousmenu[Menu] = prevmenu;
}

add_option(Menu, Text, Func, arg1, arg2)
{
     Menu = self.menu.getmenu[Menu];
     Num = self.menu.menucount[Menu];
     self.menu.menuopt[Menu][Num] = Text;
     self.menu.menufunc[Menu][Num] = Func;
     self.menu.menuinput[Menu][Num] = arg1;
     self.menu.menuinput1[Menu][Num] = arg2;
     self.menu.menucount[Menu] += 1;
}

updateScrollbar()
{
     self.menu.scroller MoveOverTime(0.10);
     self.menu.scroller.y = 68 + (self.menu.curs[self.menu.currentmenu] * 15.49);
     self.menu.scroller.archived = false;
}

openMenu()
{
    self freezeControls(false);
    self setClientUiVisibilityFlag("hud_visible", 0);
    self StoreText("Main Menu", "Main Menu");
    
    
    self.menu.background FadeOverTime(0.30);
    self.menu.background.alpha = 0.9;
    self.menu.background.archived = false;
    
    self.menu.background1 FadeOverTime(0.30);
    self.menu.background1.alpha = 0.9;
    self.menu.background1.archived = false;
    
    
    self.menu.line MoveOverTime(0.10);
    self.menu.line.y = 45;  
    self.menu.line.archived = false;
    self.menu.line.alpha = 1;
    
    self.swagtext FadeOverTime(0.3);
    self.swagtext.alpha = 0.90;

   

    self updateScrollbar();
    self.menu.open = true;
}

closeMenu()
{
    self.menu.options FadeOverTime(0.3);
    self.menu.options.alpha = 0;
    self setClientUiVisibilityFlag("hud_visible", 1);
    
    self.subtext1 FadeOverTime(0.3);
    self.subtext1.alpha = 0;
    
    
    self.subtext2 FadeOverTime(0.3);
    self.subtext2.alpha = 0;
    
    self.torq FadeOverTime(0.3);
    self.torq.alpha = 0;
    
    self.menu.background FadeOverTime(0.3);
    self.menu.background.alpha = 0;
    
    self.menu.background1 FadeOverTime(0.3);
    self.menu.background1.alpha = 0;
    
    
    self.swagtext FadeOverTime(0.30);
    self.swagtext.alpha = 0;

    self.menu.title FadeOverTime(0.30);
    self.menu.title.alpha = 0;
    
   self.menu.line MoveOverTime(0.30);
    self.menu.line.y = -550;
    self.menu.line.alpha = 0;
    
    self.menu.backgroundinfo FadeOverTime(0.3);
    self.menu.backgroundinfo.alpha = 0;

    self.menu.scroller MoveOverTime(0.30);
    self.menu.scroller.y = -510;
    self.menu.open = false;
}

destroyMenu(player)
{
    player.MenuInit = false;
    closeMenu();
    wait 0.3;

    player.menu.options destroy();  
    player.menu.background destroy();
    player.menu.background1 destroy();
    player.menu.scroller destroy();
    player.menu.scroller1 destroy();
    player.infos destroy();
    player.menu.line destroy();
    player.menu.title destroy();
    player notify("destroyMenu");
}

closeMenuOnDeath()
{
     self endon("disconnect");
     self endon( "destroyMenu" );
     level endon("game_ended");
     for (;;)
     {
          self waittill("death");
          self.menu.closeondeath = true;
          self submenu("Main Menu", "Main Menu");
          closeMenu();
          self.menu.closeondeath = false;
     }
}
scaleLol()
{
    self endon("stopScale");
    for(;;)
    {
    self.torq.glowColor = (0.196078431372549,0.803921568627451,0.196078431372549);
    wait .05;
    self.torq.glowColor = (0.196078431372549,0.803921568627451,0.196078431372549);
    }
}
StoreShaders()
{
   
   self.menu.background  = self drawShader("compass_emp", 235, 0, 170, 340, (200,0,0),0,0); // this is the side 2 backrgound shader
   self.menu.background1 = self drawShader("gradient", 235, 0, 170, 340, (240,0,0),0,0); // this is the side 1 background shader
   self.menu.line        = self drawShader("black", 235, 45, 170, 17, (200,0,0),0,3); // this is the shader where your subtext is.
   self.menu.scroller    = self drawShader("menu_camo_carbon_pattern", 235, -100, 170, 17, (200,0,0), 255, 3); // this is the scrollbar shader
      
}

StoreText(menu, title)
{
    self.menu.currentmenu = menu;
    string                = "";
    self.menu.title destroy();
    self.menu.title = drawText(title, "default", 1.6, 235, 35, (1, 1, 1), 0, 4);
    self.menu.title FadeOverTime(0.3);
    self.menu.title.archived = false;
    self notify ("stopScale");
    self thread scaleLol();
    self.torq destroy();
    self.torq = self createFontString( "default", 2.0);
    self.torq setPoint( "CENTER", "TOP", 235, 15);
    self.torq setText("^1R3D ^2AC1D"); // this is the title of the menu, so change it to the name of your menu
    self.torq FadeOverTime(0.3);
    self.torq.alpha = 1;
    self.torq.foreground = true;
    self.torq.archived = false;
    for(i = 0; i < self.menu.menuopt[menu].size; i++)
    { string +=self.menu.menuopt[menu][i] + "\n"; }
    
    self.subtext1 destroy();
    self.subtext1 = self createFontString( "default", 1.4);
    self.subtext1 setPoint( "CENTER", "TOP", 235, 35);
    self.subtext1 setText("^5Version ^6V1.6.4B1"); // change this to what ever, this is below your title text
    self.subtext1 FadeOverTime(0.3);
    self.subtext1.alpha = 1;
    self.subtext1.foreground = true;
    self.subtext1.archived = false;
    
    
    self.subtext2 destroy();
    self.subtext2 = self createFontString( "default", 1.3);
    self.subtext2 setPoint( "CENTER", "TOP", 235, 53);
    self.subtext2 setText("^F^2Admin Build."); //  Text below the version text. This can be anything you want.
    self.subtext2 FadeOverTime(0.3);
    self.subtext2.alpha = 1;
    self.subtext2.foreground = true;
    self.subtext2.archived = false;
    
    
    self.menu.options destroy();
    self.menu.options = drawText(string, "objective", 1.3, 265, 68, (1, 1, 1), 0, (0, 0, 0), 0, 4);
    self.menu.options FadeOverTime(0.3);
    self.menu.options.archived = false;
    self.menu.options.alpha = 1;
    self.menu.options setPoint( "LEFT", "LEFT", 517, -128 ); 
 
}

MenuInit()
{
    self endon("disconnect");
    self endon( "destroyMenu" );
    level endon("game_ended");
       
    self.menu = spawnstruct();
    self.toggles = spawnstruct();
     
    self.menu.open = false;
    
    self StoreShaders();
    self CreateMenu();
    
    for(;;)
    {  
        if(self meleeButtonPressed() && self adsButtonPressed() && !self.menu.open) // Open.
        {
            openMenu();
        }
        if(self.menu.open)
        {
            if(self useButtonPressed())
            {
                if(isDefined(self.menu.previousmenu[self.menu.currentmenu]))
                {
                    self submenu(self.menu.previousmenu[self.menu.currentmenu]);
                }
                else
                {
                    closeMenu();
                }
                wait 0.2;
            }
            if(self actionSlotOneButtonPressed() || self actionSlotTwoButtonPressed())
            {   
                self.menu.curs[self.menu.currentmenu] += (Iif(self actionSlotTwoButtonPressed(), 1, -1));
                self.menu.curs[self.menu.currentmenu] = (Iif(self.menu.curs[self.menu.currentmenu] < 0, self.menu.menuopt[self.menu.currentmenu].size-1, Iif(self.menu.curs[self.menu.currentmenu] > self.menu.menuopt[self.menu.currentmenu].size-1, 0, self.menu.curs[self.menu.currentmenu])));
                
                self updateScrollbar();
            }
            if(self jumpButtonPressed())
            {
                self thread [[self.menu.menufunc[self.menu.currentmenu][self.menu.curs[self.menu.currentmenu]]]](self.menu.menuinput[self.menu.currentmenu][self.menu.curs[self.menu.currentmenu]], self.menu.menuinput1[self.menu.currentmenu][self.menu.curs[self.menu.currentmenu]]);
                wait 0.2;
            }
        }
        wait 0.05;
    }
}
 
submenu(input, title)
{
    if (verificationToNum(self.status) >= verificationToNum(self.menu.status[input]))
    {
        self.menu.options destroy();

        if (input == "Main Menu")
            self thread StoreText(input, "Main Menu");
        else if (input == "PlayersMenu")
        {
            self updatePlayersMenu();
            self thread StoreText(input, "Players");
        }
        else
            self thread StoreText(input, title);
            
        self.CurMenu = input;
        self.CurTitle = title;
        
        self.menu.scrollerpos[self.CurMenu] = self.menu.curs[self.CurMenu];
        self.menu.curs[input] = self.menu.scrollerpos[input];
        
        level.result += 1;
        level notify("textset");
        
        if (!self.menu.closeondeath)
        {
            self updateScrollbar();
        }
    }
    else
    {
        iPrintln("^5Only Players With ^4" + verificationToColor(self.menu.status[input]) + " ^5has Access to this menu!");
    }
}


















