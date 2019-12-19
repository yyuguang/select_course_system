package com.lnzz.pojo;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.Proxy;

import javax.persistence.*;
import java.util.Date;

/**
 * ClassName：Course
 *
 * @author 冷暖自知
 * @version 1.0
 * @date 2019/12/11 18:47
 * @Description:
 */
@Entity
@Table(name = "t_course")
@Data
@NoArgsConstructor
@Proxy(lazy = false)
public class Course {
    @Id
    @GeneratedValue
    @Column(name = "course_id", nullable = false, length = 10)
    private Long courseId;

    @Column(name = "course_name", nullable = false, length = 50)
    private String courseName;// 课程名称

    @ManyToOne
    @JoinColumn(name = "course_teacher_id")
    private Student courseTeacher;// 任课教师（教师编号）



    @Column(name = "course_credit", nullable = false, length = 10)
    private Double courseCredit;// 学分

    @Column(name = "course_cycle", nullable = false, length = 40)
    private String courseCycle;// 课程周期

    @Column(name = "course_grade", nullable = false, length = 20)
    private String courseGrade;// 对应年级

    @Column(name = "create_time")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createTime;
    @ManyToOne
    private CourseType courseType;// 课程类型

    @Column(name = "remarks", nullable = true, length = 2000)
    private String remarks;

    @Transient
    private Integer teacherId;
    private Integer courseTypeId;

}
