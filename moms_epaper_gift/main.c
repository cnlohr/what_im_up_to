#include "common.h"
#include "ePaperColor.h"
#include "basicfat.h"
#include "fullsd.h"

void RunStatus()
{
}

int main()
{
	CLKPR = 0x80;
	CLKPR = 0;

	//Micro SD Power (Off)
	PORTE |= _BV(2);
	DDRE |= _BV(2);


	//Turn off power to ePaper
	PORTD |= ~_BV(7);
	DDRD |= _BV(7);
	_delay_ms(50);
	//Turn ePaper Power On
	PORTD &= ~_BV(7);
	DDRD |= _BV(6);

	SetupEPaperDisplay();
//	EPD_5IN65F_Show7Block();

	//Micro SD Card
	PORTC |= _BV(3);
	DDRC |= _BV(3);

	//Micro SD Power
	PORTE &= ~_BV(2);

	int of = initSD();

	if( of != 0 )
	{
		ClearEpaper( EPD_5IN65F_ORANGE );
		while(1);
	}

	of = openFAT();

	if( of )
	{
		ClearEpaper( EPD_5IN65F_RED );
		while(1);
	}

	uint32_t filelen = 0;

	char fname[MAX_LONG_FILENAME];
	memcpy( fname, "001.dat", 8 );
	uint32_t r = FindClusterFileInDir( fname, 2, -1, &filelen );

	if( r < 0 )
	{
		ClearEpaper( EPD_5IN65F_WHITE );
	}
//	else if( filelen == 0 )
//	{
//		ClearEpaper( EPD_5IN65F_RED );
//	}
	else if( filelen == 0xffffffff )
	{
		ClearEpaper( EPD_5IN65F_BLACK );
	}
	else if( r )
	{
		filelen = 134400;
		//ClearEpaper( EPD_5IN65F_YELLOW );
		struct FileInfo f;
		InitFileStructure( &f, r );
		StartReadFAT(&f);

		SetupEPaperForData();
		uint32_t i;
		int j;
		for( i = 0; i < filelen; i+=512 )
		{
			char dat[1];
			for( j = 0; j < 512; j++ )
			{
				dat[0] = read8FAT();
				//dat[0] = EPD_5IN65F_YELLOW | (EPD_5IN65F_YELLOW<<4);
				SendEPaperData( dat, 1 );
			}
			//FATAdvanceSector();
		}
		SetupEpaperDone();
		EndReadFAT();
	}
	else
	{
		ClearEpaper( EPD_5IN65F_GREEN );
	}
	while(1);
}

