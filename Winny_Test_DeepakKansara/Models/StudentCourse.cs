using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Winny_Test_DeepakKansara.Models
{
    public class StudentCourse
    {
        public int StudentCourseId { get; set; }
        public int CourseId { get; set; }
        public string Course { get; set; }
        public int StudentId { get; set; }
        public string Name { get; set; }
    }

    public class Student
    {
        public int StudentId { get; set; }
        public string Name { get; set; }
        public string DateOfBirth { get; set; }
        public string Age { get; set; }
        public char Gender { get; set; }
        public int CourseId { get; set; }
    }
}