<%

	' INSTALLATION:
	'************************************************************************
	
	' Uses the Isopoh.Cryptography.Argon2 Fully Managed .Net Core Argon2 implementation by mheyman
	' https://github.com/mheyman/Isopoh.Cryptography.Argon2
	
	' Make sure you have the lastest .NET Framework installed (tested on .NET Framework 4.7.2)
	
	' Open IIS, go to the applicaton pools and open the application pool being used by your 
	' website. Check the .NET CRL version
	' E.g: v4.0.30319
	
	' Navigate to the CRL folder
	' E.g: C:\Windows\Microsoft.NET\Framework64\v4.0.30319
	
	' Copy over: 
	' ClassicASP.Argon2.dll,
	' Isopoh.Cryptography.Argon2.dll,
	' Isopoh.Cryptography.Blake2b.dll 
	' and Isopoh.Cryptography.SecureArray.dll
	
	' Run CMD as administrator
	
	' Change the directory to your CRL folder
	' E.g: cd C:\Windows\Microsoft.NET\Framework64\v4.0.30319
	
	' Run the following command: RegAsm ClassicASP.Argon2.dll /tlb /codebase
	
	
	' ARGON2 IN VBSCRIPT:
	'************************************************************************
	
	' Default used by ClassicASP.Argon2 if none specified:
	
	' timeCost = 4
	' memoryCost = 2048
	' lanes = 4
	' threads = Processor Count
	' salt length = 16 bytes
	
	Const a2_timeCost = 6
	Const a2_memoryCost = 2048
	Const a2_lanes = 4
	Const a2_threads = 4
	Const a2_saltBytes = 16
	
	function argon2_hash(ByVal password)
		
		Dim agron2 : set agron2 = server.CreateObject("ClassicASP.Argon2")
		
			argon2_hash = 	agron2.hash(_
					password,_
					a2_timeCost,_
					a2_memoryCost,_
					a2_lanes,_
					a2_threads,_
					a2_saltBytes)
							
			' or to use the default parameters:
			' argon2_hash = agron2.hash(password)
		
		set agron2 = nothing
		
	end function
	
	function argon2_verify(ByVal password, ByVal a2Hash)

		Dim agron2 : set agron2 = server.CreateObject("ClassicASP.Argon2")
			
			argon2_verify = agron2.verify(password,a2Hash)
			
		set agron2 = nothing
		
	end function

	Dim a2_hash, start, testPassword
	
	start = Timer()
	testPassword = "myPassword"
		
	a2_hash = argon2_hash(testPassword)
				
	response.write "<p><b>Argon2 Hash:</b> " & a2_hash & "</p>"
	response.write "<p><b>Time to execute:</b> " & formatNumber(Timer()-start,4) & "s</p>"
	
	start = Timer()
	
	response.write "<p><b>Argon2 Verified:</b> " & argon2_verify(testPassword,a2_hash) & "</p>"
	response.write "<p><b>Time to execute:</b> " & formatNumber(Timer()-start,4) & "s</p>"	

%>
