package com.lnzz.pojo;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.Proxy;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * ClassName：Sc
 *
 * @author 冷暖自知
 * @version 1.0
 * @date 2019/12/11 18:52
 * @Description:
 */
@Entity
@Table(name = "t_sc")
@Data
@NoArgsConstructor
@Proxy(lazy = false)
public class Sc {
    @Id
    @GeneratedValue
    @Column(name = "sc_id", nullable = false, length = 10)
    private Long scId;
    @Column(name = "course_id", nullable = false, length = 10)
    private Long courseId;//课程编号
    @Column(name = "student_id", nullable = false, length = 10)
    private Long studentId;//学生编号

    @Column(name = "score", nullable = false, length = 10)
    private Double score;//所得成绩
    @Column(name = "create_time")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createTime;
}
