using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MMCDating.Common
{
    public static class CheckDBNull
    {
        public static string ValidateString(Object obj)
        {
            if ((obj != null))
            {
                if (obj.GetType() != typeof(System.DBNull))
                {
                    return Convert.ToString(obj);
                }
                else
                {
                    return string.Empty;
                }
            }
            else
            {
                return string.Empty;
            }

        }

        public static string ToStringType(object obj)
        {
            return ValidateString(obj);
        }

        public static double ToDoubleType(object obj)
        {
            double retVal;
            if (double.TryParse(ValidateString(obj), out retVal))
            {
                return retVal;
            }
            else
            {
                return 0;
            }
        }

        public static decimal ToDecimalType(object obj)
        {
            decimal retVal;
            if (decimal.TryParse(ValidateString(obj), out retVal))
            {
                return retVal;
            }
            else
            {
                return 0;
            }
        }

        public static bool ToBooleanType(object obj)
        {
            bool retVal;
            if (bool.TryParse(ValidateString(obj), out retVal))
            {
                return retVal;
            }
            else
            {
                return false;
            }
        }

        public static int ToIntegerType(object obj)
        {
            int retVal;
            if (int.TryParse(ValidateString(obj), out retVal))
            {
                return retVal;
            }
            else
            {
                return 0;
            }
        }

        public static Int16 ToSmallIntegerType(object obj)
        {
            Int16 retVal;
            if (Int16.TryParse(ValidateString(obj), out retVal))
            {
                return retVal;
            }
            else
            {
                return 0;
            }
        }

        public static DateTime ToDateType(object obj)
        {
            DateTime retVal;
            if (DateTime.TryParse(ValidateString(obj), out retVal))
            {
                return retVal;
            }
            else
            {
                return DateTime.MinValue;
            }
        }

    }
}
