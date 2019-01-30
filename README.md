## INSTALLATION:
Uses the Isopoh.Cryptography.Argon2 Fully Managed .Net Core Argon2 implementation by mheyman
https://github.com/mheyman/Isopoh.Cryptography.Argon2

Make sure you have the lastest .NET Framework installed (tested on .NET Framework 4.7.2)
	
Open IIS, go to the applicaton pools and open the application pool being used by your 
website. Check the .NET CRL version
E.g: v4.0.30319
	
Navigate to the CRL folder
E.g: C:\Windows\Microsoft.NET\Framework64\v4.0.30319
	
Copy over: ClassicASP.Argon2.dll, Isopoh.Cryptography.Argon2.dll, Isopoh.Cryptography.Blake2b.dll and Isopoh.Cryptography.SecureArray.dll
	
Run CMD as administrator

Change the directory to your CRL folder
E.g: cd C:\Windows\Microsoft.NET\Framework64\v4.0.30319
	
Run the following command: RegAsm ClassicASP.Argon2.dll /tlb /codebase

## Example output from argon2.asp

	Argon2 Hash: $argon2i$v=19$m=2048,t=6,p=4$IuVF4gkfn3MfbyW1NR6W0w==$zLGJNxEy0VYjycLzL+lyvVbP9R0MK7k+Al7kRsAzBf4=

	Time to execute: 0.1406s

	Argon2 Verified: True

	Time to execute: 0.1250s
