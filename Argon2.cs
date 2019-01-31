using System;
using System.Text;
using System.Runtime.InteropServices;
using Isopoh.Cryptography.Argon2;
using Isopoh.Cryptography.SecureArray;

namespace A2
{
    [ProgId("ClassicASP.Argon2")]

    [ClassInterface(ClassInterfaceType.AutoDual)]

    [Guid("048DFFB1-A0FE-4E8F-802A-A1F5820D068A")]

    [ComVisible(true)]

    public class A2
    {
        [ComVisible(true)]

        public string Hash(string password, int timeCost = 4, int memoryCost = 2048, int lanes = 4, int threads = 0, int saltBytes = 16)
        {

            if (threads <= 0) threads = Environment.ProcessorCount;
            if (saltBytes < 8) saltBytes = 8;

            byte[] salt = new byte[saltBytes];
            var Rng = System.Security.Cryptography.RandomNumberGenerator.Create();
            Rng.GetBytes(salt);

            var config = new Argon2Config
            {
                Type = Argon2Type.DataIndependentAddressing,
                Version = Argon2Version.Nineteen,
                Password = Encoding.UTF8.GetBytes(password),
                Salt = salt,
                TimeCost = timeCost,
                MemoryCost = memoryCost,
                Lanes = lanes,
                Threads = threads
            };

            var argon2 = new Argon2(config);
            SecureArray<byte> hash = argon2.Hash();
            return config.EncodeString(hash.Buffer);

        }

        public Boolean Verify(string password, string passwordHash)
        {

            return Argon2.Verify(passwordHash, Encoding.UTF8.GetBytes(password));

        }

    }
}
