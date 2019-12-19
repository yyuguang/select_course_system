package com.lnzz.pojo;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.Proxy;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * ClassName：College
 *
 * @author 冷暖自知
 * @version 1.0
 * @date 2019/12/11 18:55
 * @Description:
 */
@Entity
@Table(name = "t_college",uniqueConstraints=@UniqueConstraint(columnNames="name"))
@Data
@NoArgsConstructor
@Proxy(lazy = false)//hibernate延时加载
public class College{
    @Id
    @GeneratedValue
    private Long id;

    private String name;

    @Column(name = "create_time")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createTime;
}
