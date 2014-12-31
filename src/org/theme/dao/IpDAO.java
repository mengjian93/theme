package org.theme.dao;

import org.hibernate.Session;
import com.theme.imp.base.HibernateSessionFactory;
import com.theme.vo.Ip;

public class IpDAO {
	Session session=null;
	public boolean filter(String ipAddrr,String themeId ) {
		boolean tag;
		String sql="select * from tb_ip where ip_address='"+ipAddrr+"'and themeId="+themeId;
		session=HibernateSessionFactory.getSession();
		if(session.createSQLQuery(sql).list().size()!=0){
			tag=false;
		}else {
			Ip ip=new Ip();
			ip.setIp_address(ipAddrr);
			ip.setThemeId(themeId);
			session.save(ip);
			tag=true;
		}
		session.close();
		return tag;
	}

}
