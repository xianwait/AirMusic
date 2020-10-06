package com.airmusic.dao;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.Reader;


//mybatis操作类
public class BaseMapper {
    private static final String resources = "mybatis-config.xml";
    private static SqlSession session = null;

    /*以线程安全获取SqlSession对象*/
    public static synchronized SqlSession getSession() {
        return session;
    }

    /*释放SqlSession占用资源防止内存泄漏*/
    public static synchronized void closeSession(){
        getSession().close();
    }

    /*使用SqlSession提交事务*/
    public static synchronized void commit(){
        getSession().commit();
        System.out.println("进入提交了");
    }

    /*使用SqlSession回滚事务*/
    public static synchronized void rollback(){
        getSession().rollback();
    }
    /*获取SqlSession对象*/
    public static SqlSessionFactory getSqlSessionFactory() {
        Reader reader = null;
        try {
            reader = Resources.getResourceAsReader(resources);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return new SqlSessionFactoryBuilder().build(reader);
    }

    /*获取Mapper代理接口对象*/
    public static UserMapper getMapperAgency() {
        session = getSqlSessionFactory().openSession();
        return session.getMapper(UserMapper.class); //根据业务接口动态修改
    }

}
