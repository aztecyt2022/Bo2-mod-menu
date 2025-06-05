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






