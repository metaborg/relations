application relationsWebDSL

// imports lib/relations/crud-ui

imports lib/relations/Expressions

imports ui

section  data

  init
  {
    var alice := Student{} ;
    var bob := Student{} ;
    var charlie := Student{} ;
    var dave := Student{} ;
    var enA := Enrollment{} ;
    var enB := Enrollment{} ;
    var enC := Enrollment{} ;
    var enD := Enrollment{} ;
    var enE := Enrollment{} ;
    var eve := Student{} ;
    var exam := Assignment{} ;
    var examAlice := Submission{} ;
    var examBob := Submission{} ;
    var examCharlie := Submission{} ;
    var examDave := Submission{} ;
    var examEve := Submission{} ;
    var math := Course{} ;
    var mathAlice := Submission{} ;
    var mathAssignment := Assignment{} ;
    var mathBob := Submission{} ;
    var mathCharlie := Submission{} ;
    var mathDave := Submission{} ;
    var mathEve := Submission{} ;
    var practical := Assignment{} ;
    var practicalAlice := Submission{} ;
    var practicalBob := Submission{} ;
    var practicalCharlie := Submission{} ;
    var practicalDave := Submission{} ;
    var practicalEve := Submission{} ;
    alice.name := "Alice";
    bob.name := "Bob";
    charlie.name := "Charlie";
    dave.name := "Dave";
    enA.student := alice;
    enA.submission := mathAlice;
    enB.student := bob;
    enB.submission := mathBob;
    enC.student := charlie;
    enC.submission := mathCharlie;
    enD.student := dave;
    enD.submission := mathDave;
    enE.student := eve;
    enE.submission := mathEve;
    eve.name := "Eve";
    exam.minimum := 5.0;
    exam.name := "Exam";
    exam.question := "1+1=?";
    exam.weight := 70.0;
    examAlice.answer := "Good";
    examAlice.baseGrade := 7.0;
    examAlice.assignment := exam;
    examAlice.student := alice;
    examBob.answer := "Bad";
    examBob.baseGrade := 3.0;
    examBob.assignment := exam;
    examBob.student := bob;
    examCharlie.answer := "Great";
    examCharlie.baseGrade := 8.0;
    examCharlie.assignment := exam;
    examCharlie.student := charlie;
    examDave.answer := "Great";
    examDave.baseGrade := 8.0;
    examDave.assignment := exam;
    examDave.student := dave;
    examEve.answer := "Great";
    examEve.baseGrade := 8.0;
    examEve.assignment := exam;
    examEve.student := eve;
    math.name := "Math";
    math.assignment := mathAssignment;
    math.enrollments.add(enD);
    math.enrollments.add(enB);
    math.enrollments.add(enA);
    math.enrollments.add(enE);
    math.enrollments.add(enC);
    mathAlice.assignment := mathAssignment;
    mathAlice.children.add(examAlice);
    mathAlice.children.add(practicalAlice);
    mathAlice.student := alice;
    mathAssignment.minimum := 6.0;
    mathAssignment.name := "Math Assignments";
    mathAssignment.children.add(exam);
    mathAssignment.children.add(practical);
    mathBob.assignment := mathAssignment;
    mathBob.children.add(examBob);
    mathBob.children.add(practicalBob);
    mathBob.student := bob;
    mathCharlie.assignment := mathAssignment;
    mathCharlie.children.add(practicalCharlie);
    mathCharlie.children.add(examCharlie);
    mathCharlie.student := charlie;
    mathDave.assignment := mathAssignment;
    mathDave.children.add(practicalDave);
    mathDave.children.add(examDave);
    mathDave.student := dave;
    mathEve.assignment := mathAssignment;
    mathEve.children.add(practicalEve);
    mathEve.children.add(examEve);
    mathEve.student := eve;
    practical.deadline := Expressions.parseDatetime("2016-02-18 23:59:59");
    practical.extension := Expressions.parseDatetime("2016-02-20 23:59:59");
    practical.latePenalty := 2.0;
    practical.minimum := 5.0;
    practical.name := "Practical";
    practical.question := "1/0=?";
    practical.weight := 30.0;
    practicalAlice.answer := "Great";
    practicalAlice.baseGrade := 8.0;
    practicalAlice.date := Expressions.parseDatetime("2016-02-17 16:00:00");
    practicalAlice.assignment := practical;
    practicalAlice.student := alice;
    practicalBob.answer := "Perfect";
    practicalBob.baseGrade := 10.0;
    practicalBob.date := Expressions.parseDatetime("2016-02-17 16:00:00");
    practicalBob.assignment := practical;
    practicalBob.student := bob;
    practicalCharlie.answer := "Sufficient";
    practicalCharlie.baseGrade := 6.0;
    practicalCharlie.date := Expressions.parseDatetime("2016-02-20 16:00:00");
    practicalCharlie.assignment := practical;
    practicalCharlie.student := charlie;
    practicalDave.answer := "Great";
    practicalDave.baseGrade := 8.0;
    practicalDave.date := Expressions.parseDatetime("2016-02-27 16:00:00");
    practicalDave.assignment := practical;
    practicalDave.student := dave;
    practicalEve.answer := "Near Perfect";
    practicalEve.baseGrade := 9.0;
    practicalEve.date := Expressions.parseDatetime("2016-02-27 16:00:00");
    practicalEve.deadline := Expressions.parseDatetime("2016-02-27 23:59:59");
    practicalEve.assignment := practical;
    practicalEve.student := eve;
    alice.save();
    bob.save();
    charlie.save();
    dave.save();
    enA.save();
    enB.save();
    enC.save();
    enD.save();
    enE.save();
    eve.save();
    exam.save();
    examAlice.save();
    examBob.save();
    examCharlie.save();
    examDave.save();
    examEve.save();
    math.save();
    mathAlice.save();
    mathAssignment.save();
    mathBob.save();
    mathCharlie.save();
    mathDave.save();
    mathEve.save();
    practical.save();
    practicalAlice.save();
    practicalBob.save();
    practicalCharlie.save();
    practicalDave.save();
    practicalEve.save();
  }

section  model

  entity Assignment {
    avgGrade : Float := calculateAvgGrade()
    function getAvgGrade ( ) : Float
    {
      return this.avgGrade;
    }
    static function getAvgGrade ( en : Assignment ) : Float
    {
      return if ( en == null ) ( null as Float ) else en.getAvgGrade();
    }
    static function getAvgGrade ( entities : List<Assignment> ) : List<Float>
    {
      return [ en.getAvgGrade() | en : Assignment in entities where en.getAvgGrade() != null ];
    }
    function calculateAvgGrade ( ) : Float
    {
      return Expressions.avg_Float(Submission.getGrade(Assignment.getSubmissions(this)));
    }
    deadline : DateTime ( default= null )
    function getDeadline ( ) : DateTime
    {
      return this.deadline;
    }
    static function getDeadline ( en : Assignment ) : DateTime
    {
      return if ( en == null ) ( null as DateTime ) else en.getDeadline();
    }
    static function getDeadline ( entities : List<Assignment> ) : List<DateTime>
    {
      return [ en.getDeadline() | en : Assignment in entities where en.getDeadline() != null ];
    }
    extension : DateTime ( default= null )
    function getExtension ( ) : DateTime
    {
      return this.extension;
    }
    static function getExtension ( en : Assignment ) : DateTime
    {
      return if ( en == null ) ( null as DateTime ) else en.getExtension();
    }
    static function getExtension ( entities : List<Assignment> ) : List<DateTime>
    {
      return [ en.getExtension() | en : Assignment in entities where en.getExtension() != null ];
    }
    latePenalty : Float ( default= null )
    function getLatePenalty ( ) : Float
    {
      return this.latePenalty;
    }
    static function getLatePenalty ( en : Assignment ) : Float
    {
      return if ( en == null ) ( null as Float ) else en.getLatePenalty();
    }
    static function getLatePenalty ( entities : List<Assignment> ) : List<Float>
    {
      return [ en.getLatePenalty() | en : Assignment in entities where en.getLatePenalty() != null ];
    }
    minimum : Float ( default= null )
    function getMinimum ( ) : Float
    {
      return this.minimum;
    }
    static function getMinimum ( en : Assignment ) : Float
    {
      return if ( en == null ) ( null as Float ) else en.getMinimum();
    }
    static function getMinimum ( entities : List<Assignment> ) : List<Float>
    {
      return [ en.getMinimum() | en : Assignment in entities where en.getMinimum() != null ];
    }
    name : String ( default= null )
    function getName ( ) : String
    {
      return this.name;
    }
    static function getName ( en : Assignment ) : String
    {
      return if ( en == null ) ( null as String ) else en.getName();
    }
    static function getName ( entities : List<Assignment> ) : List<String>
    {
      return [ en.getName() | en : Assignment in entities where en.getName() != null ];
    }
    passPerc : Float := calculatePassPerc()
    function getPassPerc ( ) : Float
    {
      return this.passPerc;
    }
    static function getPassPerc ( en : Assignment ) : Float
    {
      return if ( en == null ) ( null as Float ) else en.getPassPerc();
    }
    static function getPassPerc ( entities : List<Assignment> ) : List<Float>
    {
      return [ en.getPassPerc() | en : Assignment in entities where en.getPassPerc() != null ];
    }
    function calculatePassPerc ( ) : Float
    {
      return Expressions.mul_Float(Expressions.div_Integer(Expressions.sum_Integer(Submission.getPassInt(Assignment.getSubmissions(this))), Expressions.count(Assignment.getSubmissions(this))), 100.0);
    }
    question : String ( default= null )
    function getQuestion ( ) : String
    {
      return this.question;
    }
    static function getQuestion ( en : Assignment ) : String
    {
      return if ( en == null ) ( null as String ) else en.getQuestion();
    }
    static function getQuestion ( entities : List<Assignment> ) : List<String>
    {
      return [ en.getQuestion() | en : Assignment in entities where en.getQuestion() != null ];
    }
    weight : Float ( default= null )
    function getWeight ( ) : Float
    {
      return if ( this.weight != null ) this.weight else this.calculateWeight();
    }
    static function getWeight ( en : Assignment ) : Float
    {
      return if ( en == null ) ( null as Float ) else en.getWeight();
    }
    static function getWeight ( entities : List<Assignment> ) : List<Float>
    {
      return [ en.getWeight() | en : Assignment in entities where en.getWeight() != null ];
    }
    function calculateWeight ( ) : Float
    {
      return 1.0;
    }
    children : Set<Assignment>
    function getChildren ( ) : List<Assignment>
    {
      return [ en | en : Assignment in this.children ];
    }
    static function getChildren ( en : Assignment ) : List<Assignment>
    {
      var empty : List<Assignment> ;
      return if ( en == null ) empty else en.getChildren();
    }
    static function getChildren ( ens : List<Assignment> ) : List<Assignment>
    {
      var r : List<Assignment> ;
      for
      (
      en
      in
      ens
      )
      {
        r.addAll(en.getChildren());
      }
      return r;
    }
    course : Course
    function getCourse ( ) : Course
    {
      return this.course;
    }
    static function getCourse ( en : Assignment ) : Course
    {
      return if ( en == null ) ( null as Course ) else en.getCourse();
    }
    static function getCourse ( ens : List<Assignment> ) : List<Course>
    {
      return [ en.getCourse() | en : Assignment in ens where en.getCourse() != null ];
    }
    parent : Assignment ( inverse = children )
    function getParent ( ) : Assignment
    {
      return this.parent;
    }
    static function getParent ( en : Assignment ) : Assignment
    {
      return if ( en == null ) ( null as Assignment ) else en.getParent();
    }
    static function getParent ( ens : List<Assignment> ) : List<Assignment>
    {
      return [ en.getParent() | en : Assignment in ens where en.getParent() != null ];
    }
    submissions : Set<Submission>
    function getSubmissions ( ) : List<Submission>
    {
      return [ en | en : Submission in this.submissions ];
    }
    static function getSubmissions ( en : Assignment ) : List<Submission>
    {
      var empty : List<Submission> ;
      return if ( en == null ) empty else en.getSubmissions();
    }
    static function getSubmissions ( ens : List<Assignment> ) : List<Submission>
    {
      var r : List<Submission> ;
      for
      (
      en
      in
      ens
      )
      {
        r.addAll(en.getSubmissions());
      }
      return r;
    }
  }

  entity Course {
    avgGrade : Float := calculateAvgGrade()
    function getAvgGrade ( ) : Float
    {
      return this.avgGrade;
    }
    static function getAvgGrade ( en : Course ) : Float
    {
      return if ( en == null ) ( null as Float ) else en.getAvgGrade();
    }
    static function getAvgGrade ( entities : List<Course> ) : List<Float>
    {
      return [ en.getAvgGrade() | en : Course in entities where en.getAvgGrade() != null ];
    }
    function calculateAvgGrade ( ) : Float
    {
      return Assignment.getAvgGrade(Course.getAssignment(this));
    }
    name : String ( default= null )
    function getName ( ) : String
    {
      return this.name;
    }
    static function getName ( en : Course ) : String
    {
      return if ( en == null ) ( null as String ) else en.getName();
    }
    static function getName ( entities : List<Course> ) : List<String>
    {
      return [ en.getName() | en : Course in entities where en.getName() != null ];
    }
    numStudents : Int := calculateNumStudents()
    function getNumStudents ( ) : Int
    {
      return this.numStudents;
    }
    static function getNumStudents ( en : Course ) : Int
    {
      return if ( en == null ) ( null as Int ) else en.getNumStudents();
    }
    static function getNumStudents ( entities : List<Course> ) : List<Int>
    {
      return [ en.getNumStudents() | en : Course in entities where en.getNumStudents() != null ];
    }
    function calculateNumStudents ( ) : Int
    {
      return Expressions.count(Course.getEnrollments(this));
    }
    passPerc : Float := calculatePassPerc()
    function getPassPerc ( ) : Float
    {
      return this.passPerc;
    }
    static function getPassPerc ( en : Course ) : Float
    {
      return if ( en == null ) ( null as Float ) else en.getPassPerc();
    }
    static function getPassPerc ( entities : List<Course> ) : List<Float>
    {
      return [ en.getPassPerc() | en : Course in entities where en.getPassPerc() != null ];
    }
    function calculatePassPerc ( ) : Float
    {
      return Assignment.getPassPerc(Course.getAssignment(this));
    }
    summary : String := calculateSummary()
    function getSummary ( ) : String
    {
      return this.summary;
    }
    static function getSummary ( en : Course ) : String
    {
      return if ( en == null ) ( null as String ) else en.getSummary();
    }
    static function getSummary ( entities : List<Course> ) : List<String>
    {
      return [ en.getSummary() | en : Course in entities where en.getSummary() != null ];
    }
    function calculateSummary ( ) : String
    {
      return Expressions.plus_String(Expressions.plus_String(Expressions.plus_String(Expressions.plus_String(Expressions.plus_String(Expressions.plus_String(Expressions.plus_String("The course ", Course.getName(this)), " has "), Expressions.asString(Course.getNumStudents(this))), " students, "), ( Expressions.choice_One_One(Expressions.plus_String(Expressions.plus_String("has a pass percentage of ", Expressions.asString(Course.getPassPerc(this))), "%"), "has no passing students") as String )), ", and "), ( Expressions.choice_One_One(Expressions.plus_String(Expressions.plus_String("passing students have an average grade of ", Expressions.asString(Course.getAvgGrade(this))), "."), "has no average grade.") as String ));
    }
    assignment : Assignment ( inverse = course )
    function getAssignment ( ) : Assignment
    {
      return this.assignment;
    }
    static function getAssignment ( en : Course ) : Assignment
    {
      return if ( en == null ) ( null as Assignment ) else en.getAssignment();
    }
    static function getAssignment ( ens : List<Course> ) : List<Assignment>
    {
      return [ en.getAssignment() | en : Course in ens where en.getAssignment() != null ];
    }
    enrollments : Set<Enrollment> ( inverse = course )
    function getEnrollments ( ) : List<Enrollment>
    {
      return [ en | en : Enrollment in this.enrollments ];
    }
    static function getEnrollments ( en : Course ) : List<Enrollment>
    {
      var empty : List<Enrollment> ;
      return if ( en == null ) empty else en.getEnrollments();
    }
    static function getEnrollments ( ens : List<Course> ) : List<Enrollment>
    {
      var r : List<Enrollment> ;
      for
      (
      en
      in
      ens
      )
      {
        r.addAll(en.getEnrollments());
      }
      return r;
    }
  }

  entity Enrollment {
    grade : Float := calculateGrade()
    function getGrade ( ) : Float
    {
      return this.grade;
    }
    static function getGrade ( en : Enrollment ) : Float
    {
      return if ( en == null ) ( null as Float ) else en.getGrade();
    }
    static function getGrade ( entities : List<Enrollment> ) : List<Float>
    {
      return [ en.getGrade() | en : Enrollment in entities where en.getGrade() != null ];
    }
    function calculateGrade ( ) : Float
    {
      return Submission.getGrade(Enrollment.getSubmission(this));
    }
    name : String := calculateName()
    function getName ( ) : String
    {
      return this.name;
    }
    static function getName ( en : Enrollment ) : String
    {
      return if ( en == null ) ( null as String ) else en.getName();
    }
    static function getName ( entities : List<Enrollment> ) : List<String>
    {
      return [ en.getName() | en : Enrollment in entities where en.getName() != null ];
    }
    function calculateName ( ) : String
    {
      return Expressions.plus_String(Expressions.plus_String(Course.getName(Enrollment.getCourse(this)), " "), Student.getName(Enrollment.getStudent(this)));
    }
    pass : Bool := calculatePass()
    function getPass ( ) : Bool
    {
      return this.pass;
    }
    static function getPass ( en : Enrollment ) : Bool
    {
      return if ( en == null ) ( null as Bool ) else en.getPass();
    }
    static function getPass ( entities : List<Enrollment> ) : List<Bool>
    {
      return [ en.getPass() | en : Enrollment in entities where en.getPass() != null ];
    }
    function calculatePass ( ) : Bool
    {
      return Submission.getPass(Enrollment.getSubmission(this));
    }
    pass2 : Int := calculatePass2()
    function getPass2 ( ) : Int
    {
      return this.pass2;
    }
    static function getPass2 ( en : Enrollment ) : Int
    {
      return if ( en == null ) ( null as Int ) else en.getPass2();
    }
    static function getPass2 ( entities : List<Enrollment> ) : List<Int>
    {
      return [ en.getPass2() | en : Enrollment in entities where en.getPass2() != null ];
    }
    function calculatePass2 ( ) : Int
    {
      return ( Expressions.conditional_One_One_One(Enrollment.getPass(this), 1, 0) as Int );
    }
    course : Course
    function getCourse ( ) : Course
    {
      return this.course;
    }
    static function getCourse ( en : Enrollment ) : Course
    {
      return if ( en == null ) ( null as Course ) else en.getCourse();
    }
    static function getCourse ( ens : List<Enrollment> ) : List<Course>
    {
      return [ en.getCourse() | en : Enrollment in ens where en.getCourse() != null ];
    }
    student : Student
    function getStudent ( ) : Student
    {
      return this.student;
    }
    static function getStudent ( en : Enrollment ) : Student
    {
      return if ( en == null ) ( null as Student ) else en.getStudent();
    }
    static function getStudent ( ens : List<Enrollment> ) : List<Student>
    {
      return [ en.getStudent() | en : Enrollment in ens where en.getStudent() != null ];
    }
    submission : Submission ( inverse = enrollment )
    function getSubmission ( ) : Submission
    {
      return this.submission;
    }
    static function getSubmission ( en : Enrollment ) : Submission
    {
      return if ( en == null ) ( null as Submission ) else en.getSubmission();
    }
    static function getSubmission ( ens : List<Enrollment> ) : List<Submission>
    {
      return [ en.getSubmission() | en : Enrollment in ens where en.getSubmission() != null ];
    }
  }

  entity Student {
    name : String ( default= null )
    function getName ( ) : String
    {
      return this.name;
    }
    static function getName ( en : Student ) : String
    {
      return if ( en == null ) ( null as String ) else en.getName();
    }
    static function getName ( entities : List<Student> ) : List<String>
    {
      return [ en.getName() | en : Student in entities where en.getName() != null ];
    }
    passedCourses : Int := calculatePassedCourses()
    function getPassedCourses ( ) : Int
    {
      return this.passedCourses;
    }
    static function getPassedCourses ( en : Student ) : Int
    {
      return if ( en == null ) ( null as Int ) else en.getPassedCourses();
    }
    static function getPassedCourses ( entities : List<Student> ) : List<Int>
    {
      return [ en.getPassedCourses() | en : Student in entities where en.getPassedCourses() != null ];
    }
    function calculatePassedCourses ( ) : Int
    {
      return Expressions.sum_Integer(Enrollment.getPass2(Student.getEnrollments(this)));
    }
    enrollments : Set<Enrollment> ( inverse = student )
    function getEnrollments ( ) : List<Enrollment>
    {
      return [ en | en : Enrollment in this.enrollments ];
    }
    static function getEnrollments ( en : Student ) : List<Enrollment>
    {
      var empty : List<Enrollment> ;
      return if ( en == null ) empty else en.getEnrollments();
    }
    static function getEnrollments ( ens : List<Student> ) : List<Enrollment>
    {
      var r : List<Enrollment> ;
      for
      (
      en
      in
      ens
      )
      {
        r.addAll(en.getEnrollments());
      }
      return r;
    }
    submissions : Set<Submission>
    function getSubmissions ( ) : List<Submission>
    {
      return [ en | en : Submission in this.submissions ];
    }
    static function getSubmissions ( en : Student ) : List<Submission>
    {
      var empty : List<Submission> ;
      return if ( en == null ) empty else en.getSubmissions();
    }
    static function getSubmissions ( ens : List<Student> ) : List<Submission>
    {
      var r : List<Submission> ;
      for
      (
      en
      in
      ens
      )
      {
        r.addAll(en.getSubmissions());
      }
      return r;
    }
  }

  entity Submission {
    answer : String ( default= null )
    function getAnswer ( ) : String
    {
      return this.answer;
    }
    static function getAnswer ( en : Submission ) : String
    {
      return if ( en == null ) ( null as String ) else en.getAnswer();
    }
    static function getAnswer ( entities : List<Submission> ) : List<String>
    {
      return [ en.getAnswer() | en : Submission in entities where en.getAnswer() != null ];
    }
    baseGrade : Float ( default= null )
    function getBaseGrade ( ) : Float
    {
      return if ( this.baseGrade != null ) this.baseGrade else this.calculateBaseGrade();
    }
    static function getBaseGrade ( en : Submission ) : Float
    {
      return if ( en == null ) ( null as Float ) else en.getBaseGrade();
    }
    static function getBaseGrade ( entities : List<Submission> ) : List<Float>
    {
      return [ en.getBaseGrade() | en : Submission in entities where en.getBaseGrade() != null ];
    }
    function calculateBaseGrade ( ) : Float
    {
      return ( Expressions.conditional_One_One_One(Submission.getChildPass(this), Submission.getChildGrade(this), null) as Float );
    }
    best : Bool := calculateBest()
    function getBest ( ) : Bool
    {
      return this.best;
    }
    static function getBest ( en : Submission ) : Bool
    {
      return if ( en == null ) ( null as Bool ) else en.getBest();
    }
    static function getBest ( entities : List<Submission> ) : List<Bool>
    {
      return [ en.getBest() | en : Submission in entities where en.getBest() != null ];
    }
    function calculateBest ( ) : Bool
    {
      return ( Expressions.choice_One_One(Expressions.eq_One_One(Submission.getGrade(this), Expressions.max_Float(Submission.getGrade(Assignment.getSubmissions(Submission.getAssignment(this))))), false) as Bool );
    }
    childGrade : Float := calculateChildGrade()
    function getChildGrade ( ) : Float
    {
      return this.childGrade;
    }
    static function getChildGrade ( en : Submission ) : Float
    {
      return if ( en == null ) ( null as Float ) else en.getChildGrade();
    }
    static function getChildGrade ( entities : List<Submission> ) : List<Float>
    {
      return [ en.getChildGrade() | en : Submission in entities where en.getChildGrade() != null ];
    }
    function calculateChildGrade ( ) : Float
    {
      return Expressions.div_Float(Expressions.sum_Float(Submission.getGradeWeighted(Submission.getChildren(this))), Expressions.sum_Float(Assignment.getWeight(Assignment.getChildren(Submission.getAssignment(this)))));
    }
    childPass : Bool := calculateChildPass()
    function getChildPass ( ) : Bool
    {
      return this.childPass;
    }
    static function getChildPass ( en : Submission ) : Bool
    {
      return if ( en == null ) ( null as Bool ) else en.getChildPass();
    }
    static function getChildPass ( entities : List<Submission> ) : List<Bool>
    {
      return [ en.getChildPass() | en : Submission in entities where en.getChildPass() != null ];
    }
    function calculateChildPass ( ) : Bool
    {
      return Expressions.conj(Submission.getPass(Submission.getChildren(this)));
    }
    date : DateTime ( default= null )
    function getDate ( ) : DateTime
    {
      return this.date;
    }
    static function getDate ( en : Submission ) : DateTime
    {
      return if ( en == null ) ( null as DateTime ) else en.getDate();
    }
    static function getDate ( entities : List<Submission> ) : List<DateTime>
    {
      return [ en.getDate() | en : Submission in entities where en.getDate() != null ];
    }
    deadline : DateTime ( default= null )
    function getDeadline ( ) : DateTime
    {
      return if ( this.deadline != null ) this.deadline else this.calculateDeadline();
    }
    static function getDeadline ( en : Submission ) : DateTime
    {
      return if ( en == null ) ( null as DateTime ) else en.getDeadline();
    }
    static function getDeadline ( entities : List<Submission> ) : List<DateTime>
    {
      return [ en.getDeadline() | en : Submission in entities where en.getDeadline() != null ];
    }
    function calculateDeadline ( ) : DateTime
    {
      return Assignment.getDeadline(Submission.getAssignment(this));
    }
    extension : DateTime ( default= null )
    function getExtension ( ) : DateTime
    {
      return if ( this.extension != null ) this.extension else this.calculateExtension();
    }
    static function getExtension ( en : Submission ) : DateTime
    {
      return if ( en == null ) ( null as DateTime ) else en.getExtension();
    }
    static function getExtension ( entities : List<Submission> ) : List<DateTime>
    {
      return [ en.getExtension() | en : Submission in entities where en.getExtension() != null ];
    }
    function calculateExtension ( ) : DateTime
    {
      return Assignment.getExtension(Submission.getAssignment(this));
    }
    grade : Float := calculateGrade()
    function getGrade ( ) : Float
    {
      return this.grade;
    }
    static function getGrade ( en : Submission ) : Float
    {
      return if ( en == null ) ( null as Float ) else en.getGrade();
    }
    static function getGrade ( entities : List<Submission> ) : List<Float>
    {
      return [ en.getGrade() | en : Submission in entities where en.getGrade() != null ];
    }
    function calculateGrade ( ) : Float
    {
      return ( Expressions.conditional_One_One_One(Submission.getOnTime(this), Submission.getBaseGrade(this), ( Expressions.conditional_One_One_One(Submission.getOnExtension(this), Expressions.minus_Float(Submission.getBaseGrade(this), Submission.getLatePenalty(this)), null) as Float )) as Float );
    }
    gradeWeighted : Float := calculateGradeWeighted()
    function getGradeWeighted ( ) : Float
    {
      return this.gradeWeighted;
    }
    static function getGradeWeighted ( en : Submission ) : Float
    {
      return if ( en == null ) ( null as Float ) else en.getGradeWeighted();
    }
    static function getGradeWeighted ( entities : List<Submission> ) : List<Float>
    {
      return [ en.getGradeWeighted() | en : Submission in entities where en.getGradeWeighted() != null ];
    }
    function calculateGradeWeighted ( ) : Float
    {
      return Expressions.mul_Float(Submission.getGrade(this), Assignment.getWeight(Submission.getAssignment(this)));
    }
    latePenalty : Float := calculateLatePenalty()
    function getLatePenalty ( ) : Float
    {
      return this.latePenalty;
    }
    static function getLatePenalty ( en : Submission ) : Float
    {
      return if ( en == null ) ( null as Float ) else en.getLatePenalty();
    }
    static function getLatePenalty ( entities : List<Submission> ) : List<Float>
    {
      return [ en.getLatePenalty() | en : Submission in entities where en.getLatePenalty() != null ];
    }
    function calculateLatePenalty ( ) : Float
    {
      return ( Expressions.choice_One_One(Expressions.mul_Float(Expressions.div_Integer(Expressions.minus_Date(Submission.getDate(this), Submission.getDeadline(this)), Expressions.minus_Date(Submission.getExtension(this), Submission.getDeadline(this))), Assignment.getLatePenalty(Submission.getAssignment(this))), 0.0) as Float );
    }
    name : String := calculateName()
    function getName ( ) : String
    {
      return this.name;
    }
    static function getName ( en : Submission ) : String
    {
      return if ( en == null ) ( null as String ) else en.getName();
    }
    static function getName ( entities : List<Submission> ) : List<String>
    {
      return [ en.getName() | en : Submission in entities where en.getName() != null ];
    }
    function calculateName ( ) : String
    {
      return Expressions.plus_String(Expressions.plus_String(Assignment.getName(Submission.getAssignment(this)), " "), Student.getName(Submission.getStudent(this)));
    }
    onExtension : Bool := calculateOnExtension()
    function getOnExtension ( ) : Bool
    {
      return this.onExtension;
    }
    static function getOnExtension ( en : Submission ) : Bool
    {
      return if ( en == null ) ( null as Bool ) else en.getOnExtension();
    }
    static function getOnExtension ( entities : List<Submission> ) : List<Bool>
    {
      return [ en.getOnExtension() | en : Submission in entities where en.getOnExtension() != null ];
    }
    function calculateOnExtension ( ) : Bool
    {
      return ( Expressions.choice_One_One(Expressions.lte_Date(Submission.getDate(this), Submission.getExtension(this)), false) as Bool );
    }
    onTime : Bool := calculateOnTime()
    function getOnTime ( ) : Bool
    {
      return this.onTime;
    }
    static function getOnTime ( en : Submission ) : Bool
    {
      return if ( en == null ) ( null as Bool ) else en.getOnTime();
    }
    static function getOnTime ( entities : List<Submission> ) : List<Bool>
    {
      return [ en.getOnTime() | en : Submission in entities where en.getOnTime() != null ];
    }
    function calculateOnTime ( ) : Bool
    {
      return ( Expressions.choice_One_One(Expressions.lte_Date(Submission.getDate(this), Submission.getDeadline(this)), Expressions.or(Expressions.eq_One_One(Expressions.count(Submission.getDeadline(this)), 0), Expressions.eq_One_One(Expressions.count(Submission.getDate(this)), 1))) as Bool );
    }
    pass : Bool := calculatePass()
    function getPass ( ) : Bool
    {
      return this.pass;
    }
    static function getPass ( en : Submission ) : Bool
    {
      return if ( en == null ) ( null as Bool ) else en.getPass();
    }
    static function getPass ( entities : List<Submission> ) : List<Bool>
    {
      return [ en.getPass() | en : Submission in entities where en.getPass() != null ];
    }
    function calculatePass ( ) : Bool
    {
      return ( Expressions.choice_One_One(Expressions.and(Expressions.gte_Float(Submission.getGrade(this), ( Expressions.choice_One_One(Assignment.getMinimum(Submission.getAssignment(this)), 0.0) as Float )), Submission.getChildPass(this)), false) as Bool );
    }
    passInt : Int := calculatePassInt()
    function getPassInt ( ) : Int
    {
      return this.passInt;
    }
    static function getPassInt ( en : Submission ) : Int
    {
      return if ( en == null ) ( null as Int ) else en.getPassInt();
    }
    static function getPassInt ( entities : List<Submission> ) : List<Int>
    {
      return [ en.getPassInt() | en : Submission in entities where en.getPassInt() != null ];
    }
    function calculatePassInt ( ) : Int
    {
      return ( Expressions.conditional_One_One_One(Submission.getPass(this), 1, 0) as Int );
    }
    assignment : Assignment ( inverse = submissions )
    function getAssignment ( ) : Assignment
    {
      return this.assignment;
    }
    static function getAssignment ( en : Submission ) : Assignment
    {
      return if ( en == null ) ( null as Assignment ) else en.getAssignment();
    }
    static function getAssignment ( ens : List<Submission> ) : List<Assignment>
    {
      return [ en.getAssignment() | en : Submission in ens where en.getAssignment() != null ];
    }
    children : Set<Submission>
    function getChildren ( ) : List<Submission>
    {
      return [ en | en : Submission in this.children ];
    }
    static function getChildren ( en : Submission ) : List<Submission>
    {
      var empty : List<Submission> ;
      return if ( en == null ) empty else en.getChildren();
    }
    static function getChildren ( ens : List<Submission> ) : List<Submission>
    {
      var r : List<Submission> ;
      for
      (
      en
      in
      ens
      )
      {
        r.addAll(en.getChildren());
      }
      return r;
    }
    enrollment : Enrollment
    function getEnrollment ( ) : Enrollment
    {
      return this.enrollment;
    }
    static function getEnrollment ( en : Submission ) : Enrollment
    {
      return if ( en == null ) ( null as Enrollment ) else en.getEnrollment();
    }
    static function getEnrollment ( ens : List<Submission> ) : List<Enrollment>
    {
      return [ en.getEnrollment() | en : Submission in ens where en.getEnrollment() != null ];
    }
    parent : Submission ( inverse = children )
    function getParent ( ) : Submission
    {
      return this.parent;
    }
    static function getParent ( en : Submission ) : Submission
    {
      return if ( en == null ) ( null as Submission ) else en.getParent();
    }
    static function getParent ( ens : List<Submission> ) : List<Submission>
    {
      return [ en.getParent() | en : Submission in ens where en.getParent() != null ];
    }
    student : Student ( inverse = submissions )
    function getStudent ( ) : Student
    {
      return this.student;
    }
    static function getStudent ( en : Submission ) : Student
    {
      return if ( en == null ) ( null as Student ) else en.getStudent();
    }
    static function getStudent ( ens : List<Submission> ) : List<Student>
    {
      return [ en.getStudent() | en : Submission in ens where en.getStudent() != null ];
    }
  }

/*
section  ui

  define

  applicationmenu

  (

  )

  {

  navbaritem
    {
    navigate manageAssignment() [ ] { "Assignment" }
      }

  navbaritem
    {
    navigate manageCourse() [ ] { "Course" }
      }

  navbaritem
    {
    navigate manageEnrollment() [ ] { "Enrollment" }
      }

  navbaritem
    {
    navigate manageStudent() [ ] { "Student" }
      }

  navbaritem
    {
    navigate manageSubmission() [ ] { "Submission" }
      }

  }

  derive

  CRUD

  Assignment

  derive

  CRUD

  Course

  derive

  CRUD

  Enrollment

  derive

  CRUD

  Student

  derive

  CRUD

  Submission
  */