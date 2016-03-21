module ui


page root() {
  main("root")
}

template main(active: String){
  menu(active)
  div [class = "content"] {
    elements()
  }
}

template menu(active : String){
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

derive linklist Assignment

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

derive linklist Course

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

derive linklist Enrollment

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

derive linklist Student

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

derive linklist Submission

template entitylinklist(){
  div [class = "entity-link-list"] {
    elements()
  }
}

template entity(){
  div [class = "entity"] {
    elements()
  }
}

template entitytitle(value:String){
  div [class = "entity-title"] {
    output(value)
  }
}

template entityfield(name:String){
  div [class = "entity-field"] {
    div [class = "entity-field-label"] {
      output(name) " :"
    }
    div [class = "entity-field-value"] {
      elements()
    }
  }
}
template entityfield(name:String, value:String){
  entityfield(name){output(value)}
}
template entityfield(name:String, value:Int){
  entityfield(name, if(value==null) displayNull() else value.toString())
}
template entityfield(name:String, value:Float){
  entityfield(name, if(value==null) displayNull() else value.toString())
}
template entityfield(name:String, value:Bool){
  entityfield(name, if(value==null) displayNull() else value.toString())
}
template entityfield(name:String, value:DateTime){
  entityfield(name, if(value==null) displayNull() else value.toString())
}

function displayNull() : String {
  return "";
}

derivetemplate linklist Entname {
  template entnamelinklist(values : [Entname]){
    entitylinklist{
      for (s in values){
        navigate entname2(s) [ ] { output(s.getName()) }
      }
    }
  }
  template entnamelinklist(values : {Entname}){
    entnamelinklist([v |v : Entname in values order by v.name]){}
  }
  template entnamelinklist(values : Entname){
    entnamelinklist([values])
  }
}
