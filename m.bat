del ss.exe
del ss.pdb
cl /W4 /nologo ss.cxx /O2i /EHac /Zi /D_AMD64_ /link ntdll.lib /incremental:no
