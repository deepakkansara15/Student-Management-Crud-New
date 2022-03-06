using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Winny_Test_DeepakKansara.Models;

namespace Winny_Test_DeepakKansara.Controllers
{
    public class StudentCourseController : Controller
    {
        string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();


        // GET: StudentCourse
        /// <summary>
        /// For Student List
        /// </summary>
        /// <returns></returns>
        public ActionResult Index()
        {
            List<Student> lst = new List<Student>();

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.CommandText = "STUDENTS_CRUD";
            cmd.Parameters.Add(new SqlParameter("@OPERATION", "SELECT"));
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            ds.Clear();
            da.Fill(ds);
            conn.Close();

            if (ds != null && ds.Tables[0].Rows.Count > 0)
            {
                lst = ds.Tables[0].AsEnumerable().Select(r => new Student
                {
                    StudentId = Convert.ToInt32(r["StudentId"]),
                    Name = r["Name"] != DBNull.Value ? Convert.ToString(r["Name"]) : "",
                    DateOfBirth = r["DateOfBirth"] != DBNull.Value ? Convert.ToString(r["DateOfBirth"]) : "",
                    Age = r["AGE"] != DBNull.Value ? Convert.ToString(r["AGE"]) : "",
                    Gender = Convert.ToChar(r["Gender"]),
                }).ToList();
            }

            return View(lst);
        }

        /// <summary>
        /// Get Student Detail
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult AddEditStudent(int id)
        {
            Student model = new Student();
            if (id > 0)
            {
                SqlConnection conn = new SqlConnection(connStr);
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.CommandText = "STUDENTS_CRUD";
                cmd.Parameters.Add(new SqlParameter("@OPERATION", "SELECTBYID"));
                cmd.Parameters.Add(new SqlParameter("@StudentId", id));
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                ds.Clear();
                da.Fill(ds);
                conn.Close();

                if (ds != null && ds.Tables[0].Rows.Count > 0)
                {
                    model = ds.Tables[0].AsEnumerable().Select(r => new Student
                    {
                        StudentId = Convert.ToInt32(r["StudentId"]),
                        Name = r["Name"] != DBNull.Value ? Convert.ToString(r["Name"]) : "",
                        DateOfBirth = r["DateOfBirth"] != DBNull.Value ? Convert.ToString(r["DateOfBirth"]) : "",
                        Age = r["AGE"] != DBNull.Value ? Convert.ToString(r["AGE"]) : "",
                        Gender = Convert.ToChar(r["Gender"]),
                        CourseId = Convert.ToInt32(r["CourseId"]),
                    }).FirstOrDefault();
                }
            }
            return Json(model, JsonRequestBehavior.AllowGet);
        }

        /// <summary>
        /// Add/Edit Student
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult AddEdit(Student model)
        {
            bool status = true;
            if (model != null)
            {
                SqlConnection conn = new SqlConnection(connStr);
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.CommandText = "STUDENTS_CRUD";
                cmd.Parameters.Add(new SqlParameter("@OPERATION", model.StudentId == 0 ? "INSERT" : "UPDATE"));
                cmd.Parameters.Add(new SqlParameter("@StudentId", model.StudentId));
                cmd.Parameters.Add(new SqlParameter("@Name", model.Name));
                cmd.Parameters.Add(new SqlParameter("@DateOfBirth", model.DateOfBirth));
                cmd.Parameters.Add(new SqlParameter("@Gender", model.Gender));
                cmd.Parameters.Add(new SqlParameter("@CourseId", model.CourseId));
                conn.Open();
                cmd.ExecuteScalar();
                conn.Close();
            }
            else
            {
                status = false;
            }
            return Json(status, JsonRequestBehavior.AllowGet);
        }

        /// <summary>
        /// Delete Student
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult DeleteStudent(int id)
        {
            bool status = true;
            if (id > 0)
            {
                SqlConnection conn = new SqlConnection(connStr);
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.CommandText = "STUDENTS_CRUD";
                cmd.Parameters.Add(new SqlParameter("@OPERATION", "DELETE"));
                cmd.Parameters.Add(new SqlParameter("@StudentId", id));
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
            else
            {
                status = false;
            }
            return RedirectToAction("Index");
        }

        /// <summary>
        /// Get Course for Dropdown
        /// </summary>
        /// <returns></returns>
        public ActionResult GetCourse()
        {
            List<StudentCourse> lst = new List<StudentCourse>();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.CommandText = "GETCOURSE";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            ds.Clear();
            da.Fill(ds);
            conn.Close();

            if (ds != null && ds.Tables[0].Rows.Count > 0)
            {
                lst = ds.Tables[0].AsEnumerable().Select(r => new StudentCourse
                {
                    CourseId = Convert.ToInt32(r["CourseId"]),
                    Course = r["Course"] != DBNull.Value ? Convert.ToString(r["Course"]) : ""
                }).ToList();
            }
            return Json(lst, JsonRequestBehavior.AllowGet);
        }
    }
}