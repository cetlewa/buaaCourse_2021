class Course {
  final String id; //课程代码 B3J063860
  final String name; //课程名称 Android平台开发技术
  final String property; //课程性质 选修/必修
  final String campus; //校区 学院路校区/沙河校区
  final String teacher; //课程教师 李莹
  final String type; //课程类别 博雅类/核心专业类/一般专业类/核心通识类/一般通识类
  final String college; //开课院系 计算机学院
  final int point; //学分 1.5
  final int capacity; //容量 80

  Course(
    this.id,
    this.name,
    this.property,
    this.campus,
    this.teacher,
    this.type,
    this.college,
    this.point,
    this.capacity,
  );

  Course.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        property = json["property"],
        campus = json["campus"],
        teacher = json["teacher"],
        type = json["type"],
        college = json["college"],
        point = json["point"],
        capacity = json["capacity"];

  Map<String, dynamic> toJson() =>
      <String, dynamic>{
        "id": id,
        "name": name,
        "property": property,
        "campus": campus,
        "teacher": teacher,
        "type": type,
        "college": college,
        "point": point,
        "capacity": capacity,
      };
}
