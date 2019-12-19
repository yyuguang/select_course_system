package com.lnzz.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.Proxy;

import javax.persistence.*;
import java.util.Date;

/**
 * ClassName：Student
 *
 * @author 冷暖自知
 * @version 1.0
 * @date 2019/12/11 18:37
 * @Description:
 */
@Entity
@Table(name = "t_student")
@Data
@NoArgsConstructor
@Proxy(lazy = false)
public class Student {
    @Id
    @GeneratedValue
    @Column(name = "stu_id",nullable = false,length = 10)
    private Long stuId;

    @Column(name = "stu_code", length = 20, nullable = false, unique = true)
    private String stuCode;// 学号/教师编号

    @Column(name = "stu_password", length = 100, nullable = false)
    private String stuPassword;//密码

    @Column(name = "stu_type", length = 4, nullable = false)
    private Integer stuType;// 类型（1：学生 2：教师）

    @Column(name = "stu_name", length = 30, nullable = false)
    private String stuName; // 姓名

    @Column(name = "stu_sex", length = 4, nullable = false)
    private Integer stuSex;//性别

    @Column(name = "stu_img", length = 255, nullable = false)
    private String stuImg;// 头像

    @Column(name = "stu_birthday")
    @Temporal(TemporalType.TIMESTAMP)
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private Date stuBirthday;// 出生日期

    @ManyToOne
    private College college;// 所属学院
    @ManyToOne
    private Major major;// 所属专业
    @ManyToOne
    private Grade grade;// 所属班级

    @Column(name = "stu_phone", length = 20, nullable = false)
    private String stuPhone;// 电话

    @Column(name = "stu_email", length = 100, nullable = false)
    private String stuEmail;//邮箱

    @Column(name = "remarks", length = 2000,nullable = true)
    private String remarks;//备注

    @Column(name = "role", length = 4, nullable = false)
    private Integer role;//权限（0：管理员 1：学生 2：教师）

    @Column(name = "create_time")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createTime;

    @Column(name = "update_time")
    @Temporal(TemporalType.TIMESTAMP)
    private Date updateTime;

    @Transient
    private Integer collegeId;
    @Transient
    private Integer gradeId;
    @Transient
    private Integer majorId;

}
