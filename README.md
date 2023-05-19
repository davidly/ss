# ss
Send Serial: Windows command-line app to send, run, and time apps on an Apple 1 clone

I use it with a RetroTechLyfe Apple 1 clone computer.

Build using a Visual Studio VCVARS64 command prompt on Windows:

     cl /nologo ss.cxx /O2i /EHac /Zi /D_AMD64_ /link ntdll.lib

Usage: ss

  Send Slow -- sends commands to an Apple 1 over a serial port
  
  arguments:
  
      -b                     -- Transfer a BASIC program; 'E000 R' is invoked for BASIC when -s specified.
      -p:x                   -- Select the PC's COM port, 1-9. Default is 4
      -r:x                   -- Send a run command and time exectution.
                                Default for assembly apps is to start execution at 0x1000
                                Default for BASIC is just to invoke RUN
      -s:filename            -- Sends the text in filename to the Apple 1
      
  examples:
  
      ss /p:3 /s:myfile.hex         (send myfile.hex over com3
      ss /s:myfile.hex /r           (send then run the app at address 1000
      ss /r                         (run the app already in RAM at address 1000
      ss /b /r                      (run the BASIC app already in RAM with BASIC loaded
      ss /s:myfile.bas /b /r        (start basic, transfer the basic app, and run it
      ss /r:2000                    (run the app already in RAM at address 2000
      
  notes:
  
      -- uploaded files should be in the format you'd type on the Apple 1; machine code or BASIC
      -- execution time is approximate given how slow communication is. Run benchmarks multiple times
      -- close terminal apps with the com port held open, or this app will fail with error 5
      -- when running an app, SS will exit when it reads a $ from the app. Otherwise, ^c to exit
         So, update any apps you want to time to print a '$' when it's done. It's a hack I know.
