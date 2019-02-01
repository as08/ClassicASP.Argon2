This is a Component Object Model (COM) Dynamic-link library (DLL) coded in C# that can be set in Classic ASP using VBscripts "CreateObject" method and allows you to compute Argon2i hashes.

Argon2 is a key derivation function that was selected as the winner of the Password Hashing Competition in July 2015. It was designed by Alex Biryukov, Daniel Dinu, and Dmitry Khovratovich from the University of Luxembourg. Argon2i is optimized to resist side-channel attacks. It accesses the memory array in a password independent order.

https://en.wikipedia.org/wiki/Argon2

## INSTALLATION:
Uses the Isopoh.Cryptography.Argon2 Fully Managed .Net Core Argon2 implementation by mheyman
https://github.com/mheyman/Isopoh.Cryptography.Argon2

Make sure you have the lastest .NET Framework installed (tested on .NET Framework 4.7.2)
	
Open IIS, go to the applicaton pools and open the application pool being used by your 
Classic ASP application. Check the .NET CRL version
E.g: v4.0.30319
	
Navigate to the CRL folder
E.g: C:\Windows\Microsoft.NET\Framework64\v4.0.30319
	
Copy over: ClassicASP.Argon2.dll, Isopoh.Cryptography.Argon2.dll, Isopoh.Cryptography.Blake2b.dll and Isopoh.Cryptography.SecureArray.dll
	
Run CMD as administrator

Change the directory to your CRL folder
E.g: cd C:\Windows\Microsoft.NET\Framework64\v4.0.30319
	
Run the following command: RegAsm ClassicASP.Argon2.dll /tlb /codebase

## Usage

	Set Argon2 = Server.CreateObject("ClassicASP.Argon2")

	' Generate a hash with default parameters (timeCost = 4, memoryCost = 2048, lanes = 4, threads = Environment.ProcessorCount, saltBytes = 16)
	Argon2.Hash("myPassword")
	
	' Custom parameters 
	Argon2.Hash("myPassword", int timeCost, int memoryCost, int lanes, int threads, int saltBytes)

	' Verify a hash
	Argon2.Verify("myPassword","$argon2i$v=19$m=2048,t=6,p=4$IuVF4gkfn3MfbyW1NR6W0w==$zLGJNxEy0VYjycLzL+lyvVbP9R0MK7k+Al7kRsAzBf4=") ' True / False

## Example output from argon2.asp

	Password: myPassword
	
	Argon2 Hash: $argon2i$v=19$m=2048,t=6,p=4$IuVF4gkfn3MfbyW1NR6W0w==$zLGJNxEy0VYjycLzL+lyvVbP9R0MK7k+Al7kRsAzBf4=

	Time to execute: 0.1406s

	Argon2 Verified: True

	Time to execute: 0.1250s
