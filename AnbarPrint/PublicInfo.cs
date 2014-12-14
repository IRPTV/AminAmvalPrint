using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using AnbarPrint.MyDBTableAdapters;

namespace AnbarPrint
{
    public class PublicInfo
    {
        public static string GetEmpNameByCode(int UserCode)
        {
            if (UserCode.ToString().Trim() != "0")
            {
                MyDBTableAdapters.ITTableAdapter Ta = new MyDBTableAdapters.ITTableAdapter();
                MyDB.ITDataTable It_Dt = Ta.Get_PersonelByCode(UserCode);
                if (It_Dt.Rows.Count == 1)
                {
                    return It_Dt[0]["Surname"].ToString() + "-" + It_Dt[0]["name"].ToString();
                }
                else
                {
                    return "----";
                }
            }
            else
            {
                return "----";
            }
        }

        public static string GetDepById(decimal DepId)
        {
            if (DepId != 0)
            {
                MyDBTableAdapters.ITTableAdapter Ta = new MyDBTableAdapters.ITTableAdapter();
                MyDB.ITDataTable It_Dt = Ta.Get_DepById(DepId);
                if (It_Dt.Rows.Count == 1)
                {
                    return It_Dt[0]["name"].ToString();
                }
                else
                {
                    return "----";
                }
            }

            else
            {
                return "----";
            }
        }

        public static string GetKindTitle(object Kind)
        {
            string KindStr = Kind.ToString();
            switch (KindStr)
            {
                case "1":
                    KindStr = "رسید";
                    break;

                case "2":
                    KindStr = "صورت جلسه";
                    break;

                case "3":
                    KindStr = "موجودی انبار";
                    break;
                default:
                    KindStr = "----";
                    break;
            }
            return KindStr;
        }


        public static string GetObjectTitleById(int ObjectId)
        {
            if (ObjectId != 0)
            {
                MyDBTableAdapters.AmvalTableAdapter Ta = new MyDBTableAdapters.AmvalTableAdapter();
                MyDB.AmvalDataTable It_Dt = Ta.Object_SelectById(ObjectId);
                if (It_Dt.Rows.Count == 1)
                {
                    return It_Dt[0]["title"].ToString();
                }
                else
                {
                    return "----";
                }
            }
            else
            {
                return "----";
            }
        }
    }


}