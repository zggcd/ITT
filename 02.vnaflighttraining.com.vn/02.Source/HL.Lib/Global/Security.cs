using System;
using System.Security.Cryptography;
using System.Text;

namespace HL.Lib.Global
{
    public class Security
    {
        public static string MD5(string Str)
        {
            Byte[] _Bytes = new UnicodeEncoding().GetBytes(Str);
            Byte[] _HasBytes = ((HashAlgorithm)CryptoConfig.CreateFromName("MD5")).ComputeHash(_Bytes);
            return BitConverter.ToString(_HasBytes);
        }

        public static string GetPass(string password)
        {
            HashAlgorithm algorithm = (HashAlgorithm)CryptoConfig.CreateFromName("MD5");
            return ByteArrayToHexString(algorithm.ComputeHash(Encoding.UTF8.GetBytes(password)));
        }

        public static String ByteArrayToHexString(byte[] bytes)
        {
            int length = bytes.Length;

            char[] chars = new char[length << 1];

            for (int i = 0, j = 0; i < length; i++, j++)
            {
                byte b = (byte)(bytes[i] >> 4);
                chars[j] = (char)(b > 9 ? b + 0x37 : b + 0x30);

                j++;

                b = (byte)(bytes[i] & 0x0F);
                chars[j] = (char)(b > 9 ? b + 0x37 : b + 0x30);
            }

            return new String(chars);
        }
    }
}
