package com.lnzz.pojo;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.Proxy;

import javax.persistence.*;
import java.util.Date;

/**
 * ClassName：Grade
 *
 * @author 冷暖自知
 * @version 1.0
 * @date 2019/12/11 18:58
 * @Description:
 */
@Entity
@Table(name = "t_grade", uniqueConstraints = @UniqueConstraint(columnNames = "name"))
@Data
@NoArgsConstructor
@Proxy(lazy = false)//hibernate延时加载
public class Grade {
    @Id
    @GeneratedValue
    private Long id;
    private String name;

    @Column(name = "create_time")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createTime;

    @Column(name = "class_grade", nullable = false)
    private String classGrade;//课程对应年级

    @ManyToOne
    private College college;//所属院系

    @ManyToOne
    private Major major;//所属专业
}
