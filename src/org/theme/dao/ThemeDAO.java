package org.theme.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.theme.imp.base.HibernateSessionFactory;
import com.theme.vo.Options;
import com.theme.vo.Theme;

public class ThemeDAO {
	Session session;
    //查询数据库中所有主题
	@SuppressWarnings("unchecked")
	public List<Theme> allTheme() {
		String sql = "select * from tb_theme where deflag=0";
		session = HibernateSessionFactory.getSession();
		List<Theme> list=(List<Theme>) session.createSQLQuery(sql).addEntity(Theme.class).list();
		session.close();
		return list;
	}
	//获取单个主题
	public Theme getOneTheme(String id) {
		String sql = "select * from tb_theme where id='"+id+"'and deflag=0";
		session = HibernateSessionFactory.getSession();
		Theme t=(Theme) session.createSQLQuery(sql).addEntity(Theme.class).list().get(0);
		session.close();
		//System.out.println(t.getTheme_name());
		return t;
	}
	//删除主题，软删除，设置标记为1
	public void delete(String id) {
			String sql = "select * from tb_theme where id='"+id+"'";
			session = HibernateSessionFactory.getSession();
			Transaction tc=session.beginTransaction();
			Theme t=(Theme) session.createSQLQuery(sql).addEntity(Theme.class).list().get(0);
			t.setDeflag("1");
			session.update(t);
			tc.commit();
			session.close();
		}
	//保存主题和选项
	public void saveTheme(String tag,String themeName,List<Options> optArr) {
		Theme theme=new Theme();
		theme.setTag(tag);
		theme.setTheme_name(themeName);
		session=HibernateSessionFactory.getSession();
		Transaction tc=session.beginTransaction();
		session.save(theme);
		for(int i=0;i<optArr.size();i++){
			optArr.get(i).setThemeId(theme);
			session.save(optArr.get(i));
		}
		tc.commit();
		session.close();
		//System.out.println(theme.getId());
	}
	//通过theme id查询选项
	public List<String> findOpt(String id) {
		String sql="select option_name from tb_options where themeId="+id;
		session=HibernateSessionFactory.getSession();
		@SuppressWarnings("unchecked")
		List<String> list=(List<String>) session.createSQLQuery(sql).list();
		session.close();
		//System.out.println(list.get(0));
		return list;
	}
	public List<Options> queryOpt(String themeId) {
		String sql="select * from tb_options where themeId="+themeId;
		session=HibernateSessionFactory.getSession();
		@SuppressWarnings("unchecked")
		List<Options> list=(List<Options>) session.createSQLQuery(sql).addEntity(Options.class).list();
		session.close();
		//System.out.println(list.get(0));
		return list;
	}
	//通过theme id查询选项
		public List<Integer> findCount(String id) {
			String sql="select count from tb_options where themeId="+id;
			session=HibernateSessionFactory.getSession();
			@SuppressWarnings("unchecked")
			List<Integer> list=(List<Integer>) session.createSQLQuery(sql).list();
			session.close();
			//System.out.println(list.get(0));
			return list;
		}
	//更新
	@SuppressWarnings("unchecked")
	public void updateTheme(String tid,String tag,String themeName,List<String> optin) {
		Theme theme=this.getOneTheme(tid);
		theme.setTag(tag);
		theme.setTheme_name(themeName);
		session=HibernateSessionFactory.getSession();
		Transaction tc=session.beginTransaction();
		session.update(theme);
		String sql1="select * from tb_options where themeId="+tid;
		List<Options> list=(List<Options>) session.createSQLQuery(sql1).addEntity(Options.class).list();
		for(int i=0;i<list.size();i++){
			session.createSQLQuery("delete from tb_options where id ="+list.get(i).getId()).executeUpdate();
		}
		for(int i=0;i<optin.size();i++){
			Options o=new Options();
			o.setThemeId(theme);
			o.setOption_name(optin.get(i));
			session.save(o);
		}
		tc.commit();
		session.close();
		System.out.println("sucees");
	}
	
	public void countAll(List<String> optionId) {
		session=HibernateSessionFactory.getSession();
		String sql="";
		for (int i = 0; i < optionId.size(); i++) {
			sql="update tb_options set count=count+1 where id='"+optionId.get(i)+"'";
			session.createSQLQuery(sql).executeUpdate();
		}
		session.close();
	}
	
}
