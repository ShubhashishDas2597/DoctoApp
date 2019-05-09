package template;

import org.hibernate.*;
import org.hibernate.cfg.*;

public class HibernateTemplate {

	static Configuration cfg;
	static SessionFactory sf;
	static Session s ;
	
	
	public static void setConfiguration()
	{
		cfg = new Configuration();
		cfg.configure("doc.cfg.xml");
		sf =  cfg.buildSessionFactory();
		s = sf.openSession();
	}
	
	public static Query select(String str)
	{
		Query q = s.createQuery(str);
		return q;
	}

	public static void InsertOperation(Object c) 
	{
		Transaction tx = s.beginTransaction();
		s.save(c);
		tx.commit();
	}
	
	public static void deleteOperation(Object o)
	{
		Transaction tx = s.beginTransaction();
		s.delete(o);
		tx.commit();
	}

	public static Object findOperation(Class c,String id)
	{
		Object o = s.get(c, Integer.parseInt(id));
		return o;
	}
	public static Object findOperation(Class c,int id)
	{
		Object o = s.get(c, id);
		return o;
	}
	public static void updateOperation(Object o)
	{
		
		Transaction tx = s.beginTransaction();
		s.update(o);
		tx.commit();
	}
	public static void closeConn() 
	{
		sf.close();
	}
}
