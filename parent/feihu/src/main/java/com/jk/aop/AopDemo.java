package com.jk.aop;

import com.jk.pojo.MongoLog;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.aop.AfterReturningAdvice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Component;

import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.Date;

@Aspect
@Component
public class AopDemo {

	/*@Resource（name=“AomRapsService”）*/
	@Autowired
	private MongoTemplate mongoTemplate;
	
	
	//returnVals:返回值      method :方法的对象        params: 方法的参数    url：实现类的类路径

	@Before("execution(* com.jk.service.impl.*.*(..))")
	public void afterReturning(JoinPoint jp) throws Throwable {
		Date date1 = new Date();
		MongoLog logPojo = new MongoLog();
		System.out.println("前置通知");
		System.out.println("方法所在类:" + jp.getTarget().getClass().getName());
		System.out.println("" + jp.getSignature().getName() + "方法");
		// 操作参数-----------------
		String descArgs = "";
		if (jp.getArgs() != null && jp.getArgs().length > 0) {
			for (int i = 0; i < jp.getArgs().length; i++) {
				if(jp.getArgs()[i]!=null){
					//System.out.println(jp.getArgs()[i].toString());
					descArgs += jp.getArgs()[i].toString()+",";
				}else{
					descArgs +="null"+",";
				}
			}
			System.out.println("------参数" + descArgs);
		}
		logPojo.setMethodWhere(jp.getTarget().getClass().getName());
		logPojo.setParameter(descArgs);
		logPojo.setMethodname(jp.getSignature().getName());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		logPojo.setStartTime(sdf.format(date1));
		logPojo.setState(1);
		logPojo.setExceptionInfo("NoException");
		logPojo.setEndTime(sdf.format(new Date()));
		System.out.println("---------------------------------------前置通知结束");
		if(logPojo.getMethodname()=="queryLog"){

		}else{
			mongoTemplate.insert(logPojo);
		}

	}
	
	
	  /**
     * 在目标方法出现异常时会执行的代码
     * 可以访问出现的异常信息，可以指定出现指定异常时执行
     * 方法参数Exception改为其它异常可以指定出现指定异常时执行
     * @param jp

     */
    @AfterThrowing(value = "execution(* com.jk.service.impl.*.*(..))",throwing = "error")
    public  void afterThrowing(JoinPoint jp,Throwable error){
    	
        System.err.println("异常通知");
        
        try {

			Date date  =new Date();
			MongoLog logPojo = new MongoLog();
		String methodName=jp.getSignature().getName();
		logPojo.setMethodname(methodName);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		logPojo.setStartTime(sdf.format(date));
		//异常详细信息
		String message = error.getMessage();
		logPojo.setExceptionInfo(message);
		System.out.println("方法所在类:" + jp.getTarget().getClass().getName());
		System.out.println("" + jp.getSignature().getName() + "方法");
		System.out.println("------异常信息" + message);
			// 操作参数-----------------
			String descArgs = "";
			if (jp.getArgs() != null && jp.getArgs().length > 0) {
				for (int i = 0; i < jp.getArgs().length; i++) {
					if(jp.getArgs()[i]!=null){
						//System.out.println(jp.getArgs()[i].toString());
						descArgs += jp.getArgs()[i].toString()+",";
					}else{
						descArgs +="null"+",";
					}
				}
				System.out.println("------参数" + descArgs);
			}
			logPojo.setParameter(descArgs);
		logPojo.setState(2);
		logPojo.setMethodWhere(jp.getTarget().getClass().getName());
		mongoTemplate.insert(logPojo);
		System.err.println("The method "+methodName+" occurs exection: "+ error);
			System.out.println("--------------------------------------------------异常通知结束");
        } catch (Exception ex) {
			// TODO: handle exception
		}
    }

}