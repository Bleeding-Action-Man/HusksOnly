//==================================================================================================================
// Base Changes by Vel-San, base mutator by TripWire Interactive - Contact on Steam using the following Profile Link
// for more information, feedback, questions or requests please contact
// httpssteamcommunity.comidVel-San
//==================================================================================================================

class KFHusksOnly extends Mutator;

function PostBeginPlay()
{
	SetTimer(0.1,False);
}
function Timer()
{
	local KFGameType KF;
	local byte i;
	local class<KFMonster> MC;
	local int MSquadLength;

	KF = KFGameType(Level.Game);
	MC = Class<KFMonster>(DynamicLoadObject(KF.GetEventHuskClassName(),Class'Class'));
	if ( KF!=None && MC!=None )
	{
		// groups of monsters that will be spawned
		KF.InitSquads.Length = 1;
		MSquadLength = Min( 10, KF.MaxZombiesOnce );
		KF.InitSquads[0].MSquad.Length = MSquadLength;
		for( i=0; i<MSquadLength; i++ )
			KF.InitSquads[0].MSquad[i] = MC;
	}
	Destroy();
}

DefaultProperties
{
	GroupName="KF-HusksOnly"
	FriendlyName="Husks Only Mut"
	Description="Experience 'Neo' from the Matrix, try to evade husks all game! CAUTION: This is considered to be extreme hardcore as it scales with the game difficulty, you should be kiting almost all game! - By Vel-San"
}

