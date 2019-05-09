package bao;

import java.io.*;
import java.security.NoSuchAlgorithmException;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import javax.servlet.http.*;

import org.hibernate.cfg.*;
import org.hibernate.metamodel.source.hbm.HierarchyBuilder;
import org.hibernate.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.*;
import template.*;

@Controller
public class Controllerrrr {

	@RequestMapping("/index")
	public ModelAndView disp_index()
	{
		return new ModelAndView();
	}
	@RequestMapping("/addpatient")
	public ModelAndView patientadd(HttpServletRequest request, HttpServletResponse response) throws IOException, NoSuchAlgorithmException
	{
		
			PrintWriter pw = response.getWriter();
			String name = request.getParameter("name");
			String mob = request.getParameter("mob");
			String sex = request.getParameter("gender");
			String age = request.getParameter("age");
			String pwd = request.getParameter("pwd");
			String pwd_sha = Encryption.SHA1(pwd);
			String addr = request.getParameter("state") + ", " + request.getParameter("city") + ", " + request.getParameter("addr");
			
			String desig = request.getParameter("desig");
			
			Configuration cfg =  new Configuration();
			cfg.configure("doc.cfg.xml");
			SessionFactory sf =  cfg.buildSessionFactory();
			Session s = sf.openSession();
			
			Query q = s.createQuery("from patient p where p.mob = :x");
			q.setParameter("x", mob);
			List lst = q.list();
		
			if (lst.isEmpty()) {

				patient p = new patient();
				//p.setPid(""); auto incremented
				p.setPpass(pwd_sha);
				p.setPname(name);
				p.setMob(mob);
				p.setAge(age);
				p.setSex(sex);
				p.setAddr(addr); 
				Transaction tx = s.beginTransaction();
				s.save(p);
				tx.commit();
				pw.println("<script type=\"text/javascript\">alert('Successfully Registered')</script>");
				
				return new ModelAndView("redirect:index.aks");
			} else 
				return new ModelAndView("redirect:index.aks", "msg", "Already Patient is available");
	}
	@RequestMapping("/services")
	public String disp_services()
	{
		return "services";
		
	}
	@RequestMapping("/about")
	public ModelAndView disp1()
	{
		return new ModelAndView();
		
	}
	@RequestMapping("/contact")
	public ModelAndView disp3()
	{
		return new ModelAndView();
		
	}
	
	@RequestMapping("/contactprocess")
	public ModelAndView disp_contact(HttpServletRequest request, HttpServletResponse response)
	{
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String subj = request.getParameter("subj");
		String mess = request.getParameter("mess");
		String date_time = Date_format.tareek();
		
		Configuration cfg =  new Configuration();
		cfg.configure("doc.cfg.xml");
		SessionFactory sf =  cfg.buildSessionFactory();
		Session s = sf.openSession();
		
		contact c = new contact();
		c.setDate_time(date_time);
		c.setSubject(subj);
		c.setEmail(email);
		c.setMess(mess);
		c.setName(name);
		
		Transaction tx = s.beginTransaction();
		s.save(c);
		tx.commit();
		
		
		return new ModelAndView("redirect:index.aks");
		
	}
	
	@RequestMapping("/registration_user")
	public ModelAndView disp4()
	{
		return new ModelAndView();
		
	}
	
	@RequestMapping("/dashboard_d")
	public ModelAndView dash()
	{
		return new ModelAndView();
	}
	@RequestMapping("/dashboard_p")
	public ModelAndView dash_p()
	{
		return new ModelAndView();
	}
	
	@RequestMapping("/checkuserlogin")
	public ModelAndView decide_user1(HttpServletRequest req, HttpServletResponse res) throws IOException, NoSuchAlgorithmException
	{	
		
		String hidden  = req.getParameter("decide");
		if (hidden.equals("doc"))
		{
		String uid  = req.getParameter("uid");
		String pass = req.getParameter("pass");
		String pass_sha = Encryption.SHA1(pass);
		String split = uid.substring(0, 3);
		String split2 = uid.substring(3, uid.length());
		
		PrintWriter pw = res.getWriter();
		
		HibernateTemplate.setConfiguration();
		
		if (split.equals("doc")) {
			
			String str =  "from doctor d where d.docid = :x and d.docpass = :y";
			Query q = HibernateTemplate.select(str);
			q.setParameter("x",Integer.parseInt(split2));
			q.setParameter("y",pass_sha);
			
			List lst = q.list();
			Iterator it = lst.iterator();
			
			if (lst.size() == 1)
			{
				doctor dobj = (doctor)it.next();
				pw.println("<script type=\"text/javascript\">alert('Welcome "+dobj.getDocname()+"');</script>");
				HttpSession session = req.getSession();
				session.setAttribute("name", dobj.getDocname());
				session.setAttribute("doctid", dobj.getDocid());
				
				return new ModelAndView("redirect:dashboard_d.aks");
			} else 
			{
				pw.println("<script type=\"text/javascript\">alert('No such Doctors are available');</script>");
				return new ModelAndView("redirect:index.aks", "msg", "No such Doctors are available");
			}
			
			
		} else {
			//opr
			String str =  "from opr o where o.oprid = :x and o.oprpass = :y";
			Query q = HibernateTemplate.select(str);
			q.setParameter("x",Integer.parseInt(split2));
			q.setParameter("y",pass_sha);
			
			List lst = q.list();
			Iterator it = lst.iterator();
			
			if (lst.size() == 1)
			{
				opr oobj = (opr)it.next();
				pw.println("<script type=\"text/javascript\">alert('Welcome Dr."+oobj.getOprname()+"');</script>");
				HttpSession session = req.getSession();
				session.setAttribute("oname", oobj.getOprname());
				
				return new ModelAndView("redirect:dashboard_o.aks");
			} else 
			{
				pw.println("<script type=\"text/javascript\">alert('No such Operators are available');</script>");
				return new ModelAndView("redirect:index.aks", "msg", "No such Operators are available");
			}
		}
	}else {
		
		String mob = req.getParameter("mob");
		String ppass = req.getParameter("ppass");
		String ppass_sha = Encryption.SHA1(ppass);
		
		HibernateTemplate.setConfiguration();
		String str1 = "from patient p where p.mob = :x and p.ppass = :y";
		Query q = HibernateTemplate.select(str1);
		q.setParameter("x", mob);
		q.setParameter("y", ppass_sha);
		
		List lst = q.list();
		Iterator it = lst.iterator();
		HttpSession session_p = req.getSession();
		if(lst.size() == 1)
		{
			patient pobj = (patient) it.next();
			session_p.setAttribute("pname", pobj.getPname());
			session_p.setAttribute("pid", pobj.getPid());
			session_p.setAttribute("pmob", pobj.getMob());
			session_p.setAttribute("page", pobj.getAge());
			session_p.setAttribute("psex", pobj.getSex());
			
			return new ModelAndView("redirect:dashboard_p.aks");
		} else 
		{
			//pw.println("<script type=\"text/javascript\">alert('No such Doctors are available');</script>");
			return new ModelAndView("redirect:index.aks", "msg", "No such Patients are available");
		}

	}
	}
	
	@RequestMapping("/logout")
	public ModelAndView dash_p_logout(HttpServletRequest req, HttpServletResponse res)
	{
		HttpSession session_p = req.getSession();
		session_p.removeAttribute("pname");
		session_p.invalidate();
		return new ModelAndView("redirect:index.aks");
	}
	

/////////////////////////////////////////////////////////dashboard controller mappings////////////////////////
	
	@RequestMapping("/givefeedback")
	public ModelAndView disp_givefeed(HttpServletRequest req, HttpServletResponse res)
	{
		return new ModelAndView();
	}
	
	@RequestMapping("/viewfeedbacks")
	public ModelAndView disp_viewfeed(HttpServletRequest req, HttpServletResponse res)
	{
		return new ModelAndView();
	}
	
	
	@RequestMapping("/feedsubmit")
	public ModelAndView disp_feedsubmit(HttpServletRequest req, HttpServletResponse res)
	{
		HttpSession session_p_feed = req.getSession();
		int pid = (int) session_p_feed.getAttribute("pid");
		
		String givebtn = req.getParameter("give");
		
		if (givebtn != null) {
			String rating = req.getParameter("rating");
			String description = req.getParameter("description");
			String posteddate = Date_format.tareek();

			HibernateTemplate.setConfiguration();
			feedback f = new feedback();
			f.setRate(rating);
			f.setDescrp(description);
			f.setPosteddate(Date_format.tareek());
			f.setPid(pid);

			HibernateTemplate.InsertOperation(f);

			return new ModelAndView("redirect:dashboard_p.aks");
		
		} else 
		{
			return new ModelAndView("redirect:dashboard_p.aks");
		}
		
	}
	
	
	@RequestMapping("/delete")
	public ModelAndView delete_feed(HttpServletRequest req, HttpServletResponse res)
	{
		String fid = req.getParameter("id");
		HibernateTemplate.setConfiguration();
		Object o = HibernateTemplate.findOperation(feedback.class, fid);
		feedback fobj = (feedback)o;
		HibernateTemplate.deleteOperation(fobj);
		return new ModelAndView("redirect:viewfeedbacks.aks");
	}
	@RequestMapping("/delete_o")
	public ModelAndView delete_feedo(HttpServletRequest req, HttpServletResponse res)
	{
		String fid = req.getParameter("id");
		HibernateTemplate.setConfiguration();
		Object o = HibernateTemplate.findOperation(feedback.class, fid);
		feedback fobj = (feedback)o;
		HibernateTemplate.deleteOperation(fobj);
		return new ModelAndView("redirect: dashboard_o.aks");
	}
	@RequestMapping("/del")
	public ModelAndView del_feed(HttpServletRequest req, HttpServletResponse res)
	{
		String fid = req.getParameter("id");
		HibernateTemplate.setConfiguration();
		Object o = HibernateTemplate.findOperation(feedback.class, fid);
		feedback fobj = (feedback)o;
		HibernateTemplate.deleteOperation(fobj);
		return new ModelAndView("redirect:index.aks");
	}
	
	
	@RequestMapping("/makeappointments")
	public ModelAndView disp_makeappointments(HttpServletRequest req, HttpServletResponse res)
	{
		return new ModelAndView();
	}
	
	@RequestMapping("/askforpayment")
	public ModelAndView disp_askforpayments(HttpServletRequest req, HttpServletResponse res)
	{
		return new ModelAndView();
	}
	
	@RequestMapping("/invoice")
	public ModelAndView disp_invoice(HttpServletRequest req, HttpServletResponse res)
	{
		return new ModelAndView();
	}
	
	@RequestMapping("/viewappointments")
	public ModelAndView disp_viewappointments(HttpServletRequest req, HttpServletResponse res)
	{
		return new ModelAndView();
	}
	
	@RequestMapping("/addapp")
	public ModelAndView disp_addapp(HttpServletRequest req, HttpServletResponse res)
	{
		String did = req.getParameter("dept");
		
		HttpSession sess = req.getSession();
		int pid = (int) sess.getAttribute("pid");
		
		String date_time = req.getParameter("appdate");
		String takendate = Date_format.tareek();
		String payment = "not";
		String status  = "unattended";
		
		//System.out.println(did + " " + pid + " " + date_time + " " + takendate + " " + payment + " " + status);
		
		HibernateTemplate.setConfiguration();
		
		Query q =  HibernateTemplate.select("from appointment a where a.did = :x and a.pid = :y and a.date_time = :z");
		q.setParameter("x", Integer.parseInt(did));
		q.setParameter("y", pid);
		q.setParameter("z", date_time);
		List lst = q.list();
		
		if (lst.isEmpty())
		{
			appointment a = new appointment();
			//a.setAid(); a is auto incremented;
			a.setDid(Integer.parseInt(did));
			a.setPid(pid);
			a.setDate_time(date_time);
			a.setTakendate(takendate);
			a.setPayment(payment);
			a.setStatus(status);
			
			HttpSession session_app = req.getSession();
			session_app.setAttribute("did", Integer.parseInt(did));
			session_app.setAttribute("payment", payment);
			session_app.setAttribute("appdate", date_time);
			session_app.setAttribute("tareek", takendate);
			
			HibernateTemplate.InsertOperation(a);

			return new ModelAndView("redirect: askforpayment.aks");
		} else {
			return new ModelAndView("redirect: makeappointments.aks","msg", "Already Appointment is available");
		}
			
	}
	
	@RequestMapping("/makepayments")
	public ModelAndView disp_makepayments(HttpServletRequest req, HttpServletResponse res)
	{
		return new ModelAndView();
	}
	
	@RequestMapping("/viewpayments")
	public ModelAndView disp_viewpayments(HttpServletRequest req, HttpServletResponse res)
	{
		return new ModelAndView();
	}
	
	@RequestMapping("/pgResponse")
	public ModelAndView disp_pgResponse(HttpServletRequest req, HttpServletResponse res)
	{
		return new ModelAndView();
	}
	
	@RequestMapping("/pgRedirect")
	public ModelAndView disp_pgRedirect(HttpServletRequest req, HttpServletResponse res)
	{
		String ORDER_ID = req.getParameter("ORDER_ID");
		String aid = req.getParameter("CUST_ID");
		
		System.out.println(aid + " " + ORDER_ID);
		
		Configuration cfg =  new Configuration();
		cfg.configure("doc.cfg.xml");
		SessionFactory sf =  cfg.buildSessionFactory();
		Session s = sf.openSession();
		Object o = s.get(appointment.class, Integer.parseInt(aid));
		appointment a = (appointment) o ; 
		Transaction tx = s.beginTransaction();
		a.setPayment(ORDER_ID);
		tx.commit();
		return new ModelAndView();
	}
	
/////////////////////////////opr/////////////////////////////////////////
	
	@RequestMapping("/dashboard_o") 
	public ModelAndView dash_o()
	{
		return new ModelAndView();
	}
	
	@RequestMapping("/viewfeedbacks_o") 
	public ModelAndView viewfeedbacks_o()
	{
		return new ModelAndView();
	}
	
	@RequestMapping("/registration_user_o")
	public ModelAndView disp4_o()
	{
		return new ModelAndView();
		
	}
	
	@RequestMapping("/addpatient_o")
	public ModelAndView patientadd_o(HttpServletRequest request, HttpServletResponse response) throws IOException, NoSuchAlgorithmException
	{
		
			PrintWriter pw = response.getWriter();
			String name = request.getParameter("name");
			String mob = request.getParameter("mob");
			String sex = request.getParameter("gender");
			String age = request.getParameter("age");
			String pwd = request.getParameter("pwd");
			String pwd_sha = Encryption.SHA1(pwd);
			String addr = request.getParameter("state") + ", " + request.getParameter("city") + ", " + request.getParameter("addr");
			
			String desig = request.getParameter("desig");
			
			Configuration cfg =  new Configuration();
			cfg.configure("doc.cfg.xml");
			SessionFactory sf =  cfg.buildSessionFactory();
			Session s = sf.openSession();
			
			Query q = s.createQuery("from patient p where p.mob = :x");
			q.setParameter("x", mob);
			List lst = q.list();
		
			if (lst.isEmpty()) {

				patient p = new patient();
				//p.setPid(""); auto incremented
				p.setPpass(pwd_sha);
				p.setPname(name);
				p.setMob(mob);
				p.setAge(age);
				p.setSex(sex);
				p.setAddr(addr); 
				Transaction tx = s.beginTransaction();
				s.save(p);
				tx.commit();
				pw.println("<script type=\"text/javascript\">alert('Successfully Registered')</script>");
				
				return new ModelAndView("redirect:dashboard_o.aks");
			} else 
				return new ModelAndView("redirect:dashboard_o.aks", "msg", "Already Patient is available");
	}
	
	@RequestMapping("/makeappointments_o")
	public ModelAndView disp_makeappointments_o(HttpServletRequest req, HttpServletResponse res)
	{
		return new ModelAndView();
	}
	
	@RequestMapping("/addapp_o")
	public ModelAndView disp_addapp_o(HttpServletRequest req, HttpServletResponse res)
	{
		String did = req.getParameter("dept");
		String name = req.getParameter("name"); //no use in the database
		String mob = req.getParameter("mob");
		String date_time = req.getParameter("appdate");
		String takendate = Date_format.tareek();
		String payment = "OprCleared";
		String status  = "unattended";
		
		System.out.println(did + " " +name+ " " +mob+ " " +date_time+ " " +takendate+ " " +payment);
		
		Configuration cfg =  new Configuration();
		cfg.configure("doc.cfg.xml");
		SessionFactory sf =  cfg.buildSessionFactory();
		Session s = sf.openSession();
		// Object o = s.get(patient.class, mob); bec primary key chaiye iske liye
		int pid = 0;
		Query q1 = s.createQuery("from patient p where p.mob = :y");
		q1.setParameter("y", mob);
		
		List lst1 = q1.list();
		Iterator it1 = lst1.iterator();
		HttpSession session_app_o = req.getSession();
		while (it1.hasNext()) {
			patient pobj = (patient) it1.next();
			pid = pobj.getPid();
			//System.out.println(pid);
			session_app_o.setAttribute("sess_name", pobj.getPname());
		}
		
		if (!lst1.isEmpty())
		{
		Query q =  HibernateTemplate.select("from appointment a where a.did = :x and a.pid = :y and a.date_time = :z");
		q.setParameter("x", Integer.parseInt(did));
		q.setParameter("y", pid);
		q.setParameter("z", date_time);
		List lst = q.list();
		
		if (lst.isEmpty())
		{
			appointment a = new appointment();
			//a.setAid(); a is auto incremented;
			a.setDid(Integer.parseInt(did));
			a.setPid(pid);
			a.setDate_time(date_time);
			a.setTakendate(takendate);
			a.setPayment(payment);
			a.setStatus(status);
			
			session_app_o.setAttribute("sess_o", a);
			
			
			HibernateTemplate.InsertOperation(a);
			
			return new ModelAndView("redirect: invoice_o.aks");
			
		} else {
			
			return new ModelAndView("redirect: makeappointments_o.aks","msg", "Already Appointment is available");
			
		}
		
		} else
		{
			return new ModelAndView("redirect: dashboard_o.aks", "msg", "No such mobile number is available");
		}
		
			
	}
	
	@RequestMapping("/invoice_o")
	public ModelAndView disp_invoice_o(HttpServletRequest req, HttpServletResponse res)
	{
		return new ModelAndView();
	}
	
	
	@RequestMapping("/emailing")
	public ModelAndView emailing(HttpServletRequest req, HttpServletResponse res)
	{
		return new ModelAndView();
	}
	
	@RequestMapping("/reply")
	public ModelAndView reply(HttpServletRequest req, HttpServletResponse res)
	{
		String cid = req.getParameter("cid");
		String email = req.getParameter("email");
		String mess = req.getParameter("mess");
		String subj = req.getParameter("subj");
		
		System.out.println(cid + " " + email + " " + subj + " " + mess);
		
		mailing.email(email, subj, mess);
		
		Object o = HibernateTemplate.findOperation(contact.class, cid);
		contact c = (contact) o;
		HibernateTemplate.deleteOperation(c);
		
		return new ModelAndView("redirect: dashboard_o.aks");
	}
	
	
	@RequestMapping("/viewappointments_o") 
	public ModelAndView disp_viewappointments_o(HttpServletRequest req, HttpServletResponse res)
	{
		return new ModelAndView();
	}
	
	@RequestMapping("/viewqueries_o")
	public ModelAndView viewqueries_o(HttpServletRequest req, HttpServletResponse res)
	{
		return new ModelAndView();
	}
	
	@RequestMapping("/paid")
	public ModelAndView disp_paid(HttpServletRequest req, HttpServletResponse res)
	{
		int aid = Integer.parseInt(req.getParameter("aid"));
		
		
		Configuration cfg = new Configuration();
		cfg.configure("doc.cfg.xml"); 
		
		
		SessionFactory factory = cfg.buildSessionFactory();
		Session session = factory.openSession();
		
		Object o = session.get(appointment.class, aid);
		appointment a = (appointment) o;
		Transaction tx = session.beginTransaction();
		a.setPayment("OprCleared");
		HttpSession sess_paid =  req.getSession();
		sess_paid.setAttribute("paid_aid", aid);
		tx.commit();
		
		return new ModelAndView("redirect: invoice_paid.aks");
	}
	
	@RequestMapping("/paidd")
	public ModelAndView disp_paidd(HttpServletRequest req, HttpServletResponse res)
	{
		int aid = Integer.parseInt(req.getParameter("aid"));
		
		
		HttpSession sess_paidd =  req.getSession();
		sess_paidd.setAttribute("paid_aid", aid);
		
		return new ModelAndView("redirect: invo	ice_paid.aks");
	}
	
	@RequestMapping("/invoice_paid")
	public ModelAndView disp_invoice_paid(HttpServletRequest req, HttpServletResponse res)
	{
		return new ModelAndView();
	}
//////////////////////////////////////////////doctor/////////////////////////////////////////////////////////
	
	@RequestMapping("/viewpatients_d")
	public ModelAndView disp_viewpatients_d(HttpServletRequest req, HttpServletResponse res)
	{
		return new ModelAndView();
	}
	
	@RequestMapping("/appointments") 
	public ModelAndView appointments(HttpServletRequest req, HttpServletResponse res)
	{
		return new ModelAndView();
	}
	
	@RequestMapping("/prescrption") 
	public ModelAndView prescrption(HttpServletRequest req, HttpServletResponse res)
	{
		return new ModelAndView();
	}
	
	@RequestMapping("/prescrp") 
	public ModelAndView prescrp(HttpServletRequest req, HttpServletResponse res)
	{
		return new ModelAndView();
	}
	
	@RequestMapping("/writepres") 
	public ModelAndView writepres(HttpServletRequest req, HttpServletResponse res)
	{
		int aid  = Integer.parseInt(req.getParameter("aid"));
		String medcn = req.getParameter("medcn");
		String date_time =  Date_format.tareek();
		
		Configuration cfg =  new Configuration();
		cfg.configure("doc.cfg.xml");
		SessionFactory sf =  cfg.buildSessionFactory();
		Session s = sf.openSession();
		
		Object o = s.get(appointment.class, aid);
		appointment a = (appointment) o;
		
		Transaction tx = s.beginTransaction();
		a.setStatus("attended");
		
		prescripton pr = new prescripton();
		pr.setAid(aid);
		pr.setMedcn(medcn);
		pr.setDate_time(date_time);
		s.save(pr);
		
		HttpSession pres = req.getSession();
		pres.setAttribute("pres", pr);
		
		tx.commit();
		
		return new ModelAndView("redirect: prescrption.aks");
	}
	
	
	@RequestMapping("/prescrption_p")  
	public ModelAndView prescrption_p(HttpServletRequest req, HttpServletResponse res)
	{
		return new ModelAndView();
	}
	
	@RequestMapping("/addopr")  
	public ModelAndView addopr(HttpServletRequest req, HttpServletResponse res)
	{
		return new ModelAndView();
	}
	
	@RequestMapping("/opradd")
	public ModelAndView opradd(HttpServletRequest req, HttpServletResponse res) throws NoSuchAlgorithmException
	{
		String oprpass = req.getParameter("oprpass");
		String oprpass_sha = Encryption.SHA1(oprpass);
		String oprname = req.getParameter("oprname");
		String oprmob = req.getParameter("oprmob");
		String opradd  = req.getParameter("opradd");
		
		HibernateTemplate.setConfiguration();
		
		opr o =  new opr();
		//o.setOprid(oprid);
		o.setOprname(oprname);
		o.setOprpass(oprpass_sha);
		o.setOprph(oprmob);
		o.setOprdet(opradd);
		
		HibernateTemplate.InsertOperation(o);
		
		return new ModelAndView("redirect:dashboard_d.aks");
	}
	
	@RequestMapping("/allprescrp")
	public ModelAndView allprescrp(HttpServletRequest req, HttpServletResponse res) throws NoSuchAlgorithmException
	{
		return new ModelAndView();
	}
	
	
	@RequestMapping("/forget")
	public ModelAndView forget(HttpServletRequest req, HttpServletResponse res) throws NoSuchAlgorithmException
	{
		return new ModelAndView();
	}
	
	@RequestMapping("/forget_withcode")
	public ModelAndView forget_withcode(HttpServletRequest req, HttpServletResponse res) throws NoSuchAlgorithmException
	{
		return new ModelAndView();
	}
	
	@RequestMapping("/reset_pass")
	public ModelAndView reset_pass(HttpServletRequest req, HttpServletResponse res) throws NoSuchAlgorithmException
	{
		HttpSession sessioncode =  req.getSession();
		String code = (String)sessioncode.getAttribute("otp");
		String code1 = req.getParameter("code");
		String pwd = req.getParameter("pwd");
		int pid = (int)sessioncode.getAttribute("otpid");
		
		Configuration cfg =  new Configuration();
		cfg.configure("doc.cfg.xml");
		SessionFactory sf =  cfg.buildSessionFactory();
		Session s = sf.openSession();
		
		if (code.equals(code1))
		{
			Object o = s.get(patient.class, pid);
			patient p = (patient) o;
			Transaction tx = s.beginTransaction();
			p.setPpass(Encryption.SHA1(pwd));
			tx.commit();

			return new ModelAndView("redirect: index.aks");
			
		}else {
			return new ModelAndView("redirect: index.aks");
		}
	}
	
	@RequestMapping("/das")
	public ModelAndView sunidhi(HttpServletRequest req, HttpServletResponse res) throws Exception
	{
		String mob = req.getParameter("mob");
		
		Configuration cfg =  new Configuration();
		cfg.configure("doc.cfg.xml");
		SessionFactory sf =  cfg.buildSessionFactory();
		Session s = sf.openSession();
		
		Query q = s.createQuery("from patient p where p.mob = :x");
		q.setParameter("x", mob);
		List lst = q.list();
		Iterator it = lst.iterator();
		
		if (!lst.isEmpty())
		{
			patient p = (patient)it.next();
			
			String code = rand.send(mob);
			System.out.println(code);
			HttpSession sessioncode =  req.getSession();
			sessioncode.setAttribute("otp", code);
			sessioncode.setAttribute("otpid", p.getPid());
			return new ModelAndView("redirect: forget_withcode.aks");
			
		} else {
			return new ModelAndView("redirect: index.aks");
		}
	}
	
}// end of Controller







