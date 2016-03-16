module ui


page root() {
  main("root")
}

define main(active: String){
  menu(active)
  div [class = "content"] {
    elements()
  }
}

define menu(active : String){
  div [class = "menu"] {
	  navigate root() [class = if(active=="root") "active" else ""] { "Home" }
    navigate assignment() [class = if(active=="assignment") "active" else ""] { "Assignment" }
    navigate course() [class = if(active=="course") "active" else ""] { "Course" }
    navigate enrollment() [class = if(active=="enrollment") "active" else ""] { "Enrollment" }
    navigate student() [class = if(active=="student") "active" else ""] { "Student" }
    navigate submission() [class = if(active=="submission") "active" else ""] { "Submission" }
  }
}

page assignment() {
  main("assignment"){
  	assignmentlinklist(from Assignment){}
  }
}

page assignment2(s : Assignment) {
  main("assignment"){
    entity {
      entitytitle(s.getName())
      entityfield("name", s.getName())
      entityfield("question", s.getQuestion())
      entityfield("minimum", s.getMinimum())
      entityfield("weight", s.getWeight())
      entityfield("deadline", s.getDeadline())
      entityfield("extension", s.getExtension())
      entityfield("late penalty", s.getLatePenalty())
      entityfield("avg grade", s.getAvgGrade())
      entityfield("pass perc", s.getPassPerc())
      entityfield("course"){
        courselinklist(s.getCourse()){}
      }
      entityfield("parent"){
        assignmentlinklist(s.getParent()){}
      }
      entityfield("children"){
        assignmentlinklist(s.getChildren()){}
      }
      entityfield("submissions"){
        submissionlinklist(s.getSubmissions()){}
      }
    }
  }
}

define assignmentlinklist(values : [Assignment]){
  entitylinklist{
    for (s in values){
      navigate assignment2(s) [ ] { output(s.getName()) }
    }
  }
}
define assignmentlinklist(values : {Assignment}){
  assignmentlinklist([v |v : Assignment in values order by v.name]){}
}
define assignmentlinklist(values : Assignment){
	assignmentlinklist([values])
}

page course() {
  main("course"){
	  entitylinklist{
	    for (s : Course order by s.getName()){
	      navigate course2(s) [ ] { output(s.getName()) }
	    }
    }
  }
}

page course2(s : Course) {
  main("course"){
    entity {
      entitytitle(s.getName())
      entityfield("name", s.getName())
      entityfield("avg grade", s.getAvgGrade())
      entityfield("pass perc", s.getPassPerc())
      entityfield("num students", s.getNumStudents())
      entityfield("summary", s.getSummary())
      entityfield("assignment"){
        assignmentlinklist(s.getAssignment()){}
      }
      entityfield("enrollments"){
        enrollmentlinklist(s.getEnrollments()){}
      }
    }
  }
}

define courselinklist(values : [Course]){
  entitylinklist{
    for (s in values){
      navigate course2(s) [ ] { output(s.getName()) }
    }
  }
}
define courselinklist(values : {Course}){
  courselinklist([v |v : Course in values order by v.name]){}
}
define courselinklist(values : Course){
  courselinklist([values])
}

page enrollment() {
  main("enrollment"){
    entitylinklist{
	    for (s : Enrollment order by s.getName()){
	      navigate enrollment2(s) [ ] { output(s.getName()) }
	    }
	  }
  }
}

page enrollment2(s : Enrollment) {
  main("enrollment"){
    entity {
      entitytitle(s.getName())
      entityfield("name", s.getName())
      entityfield("grade", s.getGrade())
      entityfield("pass", s.getPass())
      entityfield("pass2", s.getPass2())
      entityfield("course"){
        courselinklist(s.getCourse()){}
      }
      entityfield("student"){
        studentlinklist(s.getStudent()){}
      }
      entityfield("submission"){
        submissionlinklist(s.getSubmission()){}
      }
    }
  }
}

define enrollmentlinklist(values : [Enrollment]){
  entitylinklist{
    for (s in values){
      navigate enrollment2(s) [ ] { output(s.getName()) }
    }
  }
}
define enrollmentlinklist(values : {Enrollment}){
  enrollmentlinklist([v |v : Enrollment in values order by v.name]){}
}
define enrollmentlinklist(values : Enrollment){
  enrollmentlinklist([values])
}

page student() {
  main("student"){
    entitylinklist{
	    for (s : Student order by s.getName()){
	      navigate student2(s) [ ] { output(s.getName()) }
	    }
	  }
  }
}

page student2(s:Student) {
  main("student"){
    entity {
      entitytitle(s.getName())
      entityfield("name", s.getName())
      entityfield("passed courses", s.getPassedCourses())
      entityfield("submissions"){
        submissionlinklist(s.getSubmissions()){}
      }
      entityfield("enrollments"){
        enrollmentlinklist(s.getEnrollments()){}
      }
    }
  }
}

define studentlinklist(values : [Student]){
  entitylinklist{
    for (s in values){
      navigate student2(s) [ ] { output(s.getName()) }
    }
  }
}
define studentlinklist(values : {Student}){
  studentlinklist([v |v : Student in values order by v.name]){}
}
define studentlinklist(values : Student){
  studentlinklist([values])
}

page submission() {
  main("submission"){
    entitylinklist{
	    for (s : Submission order by s.getName()){
	      navigate submission2(s) [ ] { output(s.getName()) }
	    }
    }
  }
}

page submission2(s:Submission) {
  main("submission"){
    entity {
      entitytitle(s.getName())
      entityfield("name", s.getName())
      entityfield("answer", s.getAnswer())
      entityfield("date", s.getDate())
      entityfield("deadline", s.getDeadline())
      entityfield("extension", s.getExtension())
      entityfield("late penalty", s.getLatePenalty())
      entityfield("child grade", s.getChildGrade())
      entityfield("base grade", s.getBaseGrade())
      entityfield("grade", s.getGrade())
      entityfield("grade weighted", s.getGradeWeighted())
      entityfield("child pass", s.getChildPass())
      entityfield("pass", s.getPass())
      entityfield("passInt", s.getPassInt())
      entityfield("best", s.getBest())
      entityfield("assignment"){
        assignmentlinklist(s.getAssignment()){}
      }
      entityfield("student"){
        studentlinklist(s.getStudent()){}
      }
      entityfield("parent"){
        submissionlinklist(s.getParent()){}
      }
      entityfield("children"){
        submissionlinklist(s.getChildren()){}
      }
    }
  }
}

define submissionlinklist(values : [Submission]){
  entitylinklist{
    for (s in values){
      navigate submission2(s) [ ] { output(s.getName()) }
    }
  }
}
define submissionlinklist(values : {Submission}){
  submissionlinklist([v |v : Submission in values order by v.name]){}
}
define submissionlinklist(values : Submission){
  submissionlinklist([values])
}

define entitylinklist(){
  div [class = "entity-link-list"] {
    elements()
  }
}

define entity(){
  div [class = "entity"] {
    elements()
  }
}

define entitytitle(value:String){
  div [class = "entity-title"] {
    output(value)
  }
}

define entityfield(name:String){
  div [class = "entity-field"] {
    div [class = "entity-field-label"] {
      output(name) " :"
    }
    div [class = "entity-field-value"] {
      elements()
    }
  }
}
define entityfield(name:String, value:String){
  entityfield(name){output(value)}
}
define entityfield(name:String, value:Int){
  entityfield(name, value.toString())
}
define entityfield(name:String, value:Float){
  entityfield(name, value.toString())
}
define entityfield(name:String, value:Bool){
  entityfield(name, value.toString())
}
define entityfield(name:String, value:DateTime){
  entityfield(name, value.toString())
}
