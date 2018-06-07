using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;


public class ClassReg
{
    protected System.Data.SqlClient.SqlConnection GetConnection()
    {
        string strConnection = ConfigurationManager.ConnectionStrings["AdvWebProjectConnectionString"].ConnectionString;

        //Configure my connection
        System.Data.SqlClient.SqlConnection objCon;
        objCon = new System.Data.SqlClient.SqlConnection();
        objCon.ConnectionString = strConnection;
        return objCon;
    }
    public int RegisterForClass(int StudentID, int ClassID)
    {
        //Get my configured connection
        System.Data.SqlClient.SqlConnection objCon = GetConnection();

        //Configure my command 
        System.Data.SqlClient.SqlCommand objCmd;
        objCmd = new System.Data.SqlClient.SqlCommand();
        objCmd.Connection = objCon;
        objCmd.CommandType = System.Data.CommandType.StoredProcedure;
        objCmd.CommandText = "pInsClassStudents";

        //Setup the parameters
        System.Data.SqlClient.SqlParameter objRC;
        objRC = new System.Data.SqlClient.SqlParameter();
        objRC.ParameterName = "@RC";
        objRC.SqlDbType = System.Data.SqlDbType.Int;
        objRC.Direction = System.Data.ParameterDirection.ReturnValue;
        objCmd.Parameters.Add(objRC);

        System.Data.SqlClient.SqlParameter objStudentID;
        objStudentID = new System.Data.SqlClient.SqlParameter();
        objStudentID.ParameterName = "@StudentId";
        objStudentID.SqlDbType = System.Data.SqlDbType.Int;
        objStudentID.Direction = System.Data.ParameterDirection.Input;
        objStudentID.Value = StudentID;
        objCmd.Parameters.Add(objStudentID);

        System.Data.SqlClient.SqlParameter objClassID;
        objClassID = new System.Data.SqlClient.SqlParameter();
        objClassID.ParameterName = "@ClassId";
        objClassID.SqlDbType = System.Data.SqlDbType.Int;
        objClassID.Direction = System.Data.ParameterDirection.Input;
        objClassID.Value = ClassID;
        objCmd.Parameters.Add(objClassID);

        int errorCode = 0;

        try
        {
            objCon.Open();
            objCmd.ExecuteNonQuery();
        }
        catch (SqlException ex)
        {
            if (ex.Number == 50000)
            {
                errorCode = ex.Number;

            }
            else
            {
                throw;
            }

        }
        finally
        {
            objCon.Close();
        }

        return errorCode;
    }

    public int WebsiteLogin(string StudentLogin, string StudentPassword)
    {
        //Get my configured connection
        System.Data.SqlClient.SqlConnection objCon = GetConnection();

        //Configure my command 
        System.Data.SqlClient.SqlCommand objCmd;
        objCmd = new System.Data.SqlClient.SqlCommand();
        objCmd.Connection = objCon;
        objCmd.CommandType = System.Data.CommandType.StoredProcedure;
        objCmd.CommandText = "pSelLoginIdByLoginAndPassword";

        //Setup the parameters
        System.Data.SqlClient.SqlParameter objRC;
        objRC = new System.Data.SqlClient.SqlParameter();
        objRC.ParameterName = "@RC";
        objRC.SqlDbType = System.Data.SqlDbType.Int;
        objRC.Direction = System.Data.ParameterDirection.ReturnValue;
        objCmd.Parameters.Add(objRC);

        System.Data.SqlClient.SqlParameter objStudentLogin;
        objStudentLogin = new System.Data.SqlClient.SqlParameter();
        objStudentLogin.ParameterName = "@StudentLogin";
        objStudentLogin.SqlDbType = System.Data.SqlDbType.NVarChar;
        objStudentLogin.Size = 50;
        objStudentLogin.Direction = System.Data.ParameterDirection.Input;
        objStudentLogin.Value = StudentLogin;
        objCmd.Parameters.Add(objStudentLogin);

        System.Data.SqlClient.SqlParameter objStudentPassword;
        objStudentPassword = new System.Data.SqlClient.SqlParameter();
        objStudentPassword.ParameterName = "@StudentPassword";
        objStudentPassword.SqlDbType = System.Data.SqlDbType.NVarChar;
        objStudentPassword.Size = 50;
        objStudentPassword.Direction = System.Data.ParameterDirection.Input;
        objStudentPassword.Value = StudentPassword;
        objCmd.Parameters.Add(objStudentPassword);

        System.Data.SqlClient.SqlParameter objStudentID;
        objStudentID = new System.Data.SqlClient.SqlParameter();
        objStudentID.ParameterName = "@StudentID";
        objStudentID.SqlDbType = System.Data.SqlDbType.Int;
        objStudentID.Direction = System.Data.ParameterDirection.Output;
        objCmd.Parameters.Add(objStudentID);

        int intStudentID = -1;
        try
        {
            objCon.Open();
            objCmd.ExecuteNonQuery();
            if (objStudentID.Value.GetType() == typeof(Int32))//If the data is returned as DBNull then skip this
            {
                intStudentID = (int)objStudentID.Value;
            }
        }
        finally
        {
            objCon.Close();
        }
        //If login has failed, then you will receive a -1
        //If login succeeds then you will receive the Student ID
        return intStudentID;
    }

    public Dictionary<string, List<String>> ListMyClasses(int StudentID)
    {
        //Get my configured connection
        System.Data.SqlClient.SqlConnection objCon = GetConnection();

        //Configure my command 
        System.Data.SqlClient.SqlCommand objCmd;
        objCmd = new System.Data.SqlClient.SqlCommand();
        objCmd.Connection = objCon;
        objCmd.CommandType = System.Data.CommandType.StoredProcedure;
        objCmd.CommandText = "pSelClassesByStudentID";

        //Setup the parameters
        System.Data.SqlClient.SqlParameter objStudentID;
        objStudentID = new System.Data.SqlClient.SqlParameter();
        objStudentID.ParameterName = "@StudentID";
        objStudentID.SqlDbType = System.Data.SqlDbType.Int;
        objStudentID.Direction = System.Data.ParameterDirection.Input;
        objStudentID.Value = StudentID;
        objCmd.Parameters.Add(objStudentID);

         Dictionary<string, List<String>> ClassList = new Dictionary<string, List<String>>();

        try
        {
            objCon.Open();

            SqlDataReader reader = objCmd.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    List<string> classAttributes = new List<string>();
                    classAttributes.Add(reader["ClassName"].ToString());
                    classAttributes.Add(reader["ClassDate"].ToString());
                    classAttributes.Add(reader["ClassDescription"].ToString());
                    ClassList.Add(reader["ClassId"].ToString(), classAttributes);
                }
            }
        }
        finally
        {
            objCon.Close();
        }

        return ClassList;
    }

    public Dictionary<string, List<String>> ListAllClasses()
    {
        //Get my configured connection
        System.Data.SqlClient.SqlConnection objCon = GetConnection();

        //Configure my command 
        System.Data.SqlClient.SqlCommand objCmd;
        objCmd = new System.Data.SqlClient.SqlCommand();
        objCmd.Connection = objCon;
        //objCmd.CommandType = System.Data.CommandType.Text;
        objCmd.CommandText = "Select * From vClasses";

        Dictionary<string, List<String>> Classes = new Dictionary<string, List<String>>();

        try
        {
            objCon.Open();

            SqlDataReader reader = objCmd.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    List<string> classAttributes = new List<string>();
                    classAttributes.Add(reader["ClassName"].ToString());
                    classAttributes.Add(reader["ClassDate"].ToString());
                    classAttributes.Add(reader["ClassDescription"].ToString());
                    Classes.Add(reader["ClassId"].ToString(), classAttributes);
                }
            }
        }
        finally
        {
            objCon.Close();
        }

        return Classes;
    }

    public int RequestLogin(string name, string email, string reason, string login, string NR, DateTime? requireby=null)
    {
        //Get my configured connection
        System.Data.SqlClient.SqlConnection objCon = GetConnection();

        //Configure my command 
        System.Data.SqlClient.SqlCommand objCmd;
        objCmd = new System.Data.SqlClient.SqlCommand();
        objCmd.Connection = objCon;
        objCmd.CommandType = System.Data.CommandType.StoredProcedure;
        objCmd.CommandText = "pInsLoginRequests";

        //Setup the parameters
        System.Data.SqlClient.SqlParameter objRC;
        objRC = new System.Data.SqlClient.SqlParameter();
        objRC.ParameterName = "@RC";
        objRC.SqlDbType = System.Data.SqlDbType.Int;
        objRC.Direction = System.Data.ParameterDirection.ReturnValue;
        objCmd.Parameters.Add(objRC);

        System.Data.SqlClient.SqlParameter objname;
        objname = new System.Data.SqlClient.SqlParameter();
        objname.ParameterName = "@Name";
        objname.SqlDbType = System.Data.SqlDbType.NVarChar;
        objname.Size = 50;
        objname.Value = name;
        objname.Direction = System.Data.ParameterDirection.Input;
        objCmd.Parameters.Add(objname);

        System.Data.SqlClient.SqlParameter objemail;
        objemail = new System.Data.SqlClient.SqlParameter();
        objemail.ParameterName = "@EmailAddress";
        objemail.SqlDbType = System.Data.SqlDbType.NVarChar;
        objemail.Size = 50;
        objemail.Value = email;
        objemail.Direction = System.Data.ParameterDirection.Input;
        objCmd.Parameters.Add(objemail);

        System.Data.SqlClient.SqlParameter objlogin;
        objlogin = new System.Data.SqlClient.SqlParameter();
        objlogin.ParameterName = "@LoginName";
        objlogin.SqlDbType = System.Data.SqlDbType.NVarChar;
        objlogin.Size = 50;
        objlogin.Value = login;
        objlogin.Direction = System.Data.ParameterDirection.Input;
        objCmd.Parameters.Add(objlogin);

        System.Data.SqlClient.SqlParameter objNR;
        objNR = new System.Data.SqlClient.SqlParameter();
        objNR.ParameterName = "@NewOrReactivate";
        objNR.SqlDbType = System.Data.SqlDbType.NVarChar;
        objNR.Size = 50;
        objNR.Value = NR;
        objNR.Direction = System.Data.ParameterDirection.Input;
        objCmd.Parameters.Add(objNR);

        System.Data.SqlClient.SqlParameter objreason;
        objreason = new System.Data.SqlClient.SqlParameter();
        objreason.ParameterName = "@ReasonForAccess";
        objreason.SqlDbType = System.Data.SqlDbType.NVarChar;
        objreason.Size = 50;
        objreason.Value = reason;
        objreason.Direction = System.Data.ParameterDirection.Input;
        objCmd.Parameters.Add(objreason);

        if (requireby == null)
        {
            System.Data.SqlClient.SqlParameter objreqdate;
            objreqdate = new System.Data.SqlClient.SqlParameter();
            objreqdate.ParameterName = "@DateRequiredBy";
            objreqdate.SqlDbType = System.Data.SqlDbType.DateTime;
            objreqdate.Value = DBNull.Value;
            objreqdate.Direction = System.Data.ParameterDirection.Input;
            objCmd.Parameters.Add(objreqdate);
        }
        else
        {
            System.Data.SqlClient.SqlParameter objreqdate;
            objreqdate = new System.Data.SqlClient.SqlParameter();
            objreqdate.ParameterName = "@DateRequiredBy";
            objreqdate.SqlDbType = System.Data.SqlDbType.DateTime;
            objreqdate.Value = requireby;
            objreqdate.Direction = System.Data.ParameterDirection.Input;
            objCmd.Parameters.Add(objreqdate);
        }

        System.Data.SqlClient.SqlParameter objLoginID;
        objLoginID = new System.Data.SqlClient.SqlParameter();
        objLoginID.ParameterName = "@LoginID";
        objLoginID.SqlDbType = System.Data.SqlDbType.Int;
        objLoginID.Direction = System.Data.ParameterDirection.Output;
        objCmd.Parameters.Add(objLoginID);

        int intStudentID = -1;
        try
        {
            objCon.Open();
            objCmd.ExecuteNonQuery();
            if (objLoginID.Value.GetType() == typeof(Int32))//If the data is returned as DBNull then skip this
            {
                intStudentID = (int)objLoginID.Value;
            }
        }
        finally
        {
            objCon.Close();
        }
       
        return intStudentID;
    }
}
