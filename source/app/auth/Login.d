module app.auth.Login;

import app.system.model.User;
import app.system.model.Permission;
import app.system.model.Menu;
import app.system.model.Role;
import app.system.repository.UserRepository;
import app.system.repository.PermissionRepository;
import kiss.logger;

import entity.repository;
import entity.domain;
import hunt.security.acl.User;
import hunt.security.acl.permission.Permission;
import hunt;
import kiss.util.serialize;

import entity.DefaultEntityManagerFactory;

alias AclUser = hunt.security.acl.User.User;
alias AclPermission = hunt.security.acl.permission.Permission.Permission;

class UserInfo
{
	static void put(Request req, AclUser user)
	{
		req.session.set("USER", cast(string) serialize!AclUser(user));
	}

	static AclUser get(Request req)
	{
		auto str = req.session.get("USER");
		if (str == null)
			return null;
		return unserialize!AclUser(cast(byte[]) str);

	}
	static AclUser login(string username, string password)
	{
		auto em = defaultEntityManagerFactory.createEntityManager(); 

		CriteriaBuilder builder = em.getCriteriaBuilder();

		CriteriaQuery!(app.system.model.User.User) criteriaQuery = builder.createQuery!(
				app.system.model.User.User);
		Root!(app.system.model.User.User) root = criteriaQuery.from();
		Predicate p1 = builder.equal(root.User.email, username);
		Predicate p2 = builder.equal(root.User.password, password);
		TypedQuery!(app.system.model.User.User) typedQuery = em.createQuery(
				criteriaQuery.select(root).where(p1, p2));
		auto user = cast(app.system.model.User.User) typedQuery.getSingleResult();

		if (user !is null)
		{
			if (user.status == 0)
			{
				return null;
			}

			// auto acl = Application.getInstance().getAccessManager();
			// auto acl_user = acl.createUser(cast(int)user.id , user.email);
			// auto acl_per = new AclPermission();
			// if (cast(int)user.supered == 1)
			// {
			// 	auto repository = new PermissionRepository();
			// 	auto alldata = repository.findAll();
			// 	int num = alldata.length ;
			// 	for(int i = 0 ; i < num ; i ++){
			// 		writeln(alldata[i]["id"]);
			// 	}
			// }
			// else
			// {

			// }
			auto acl = Application.getInstance().getAccessManager();
			auto acl_user = acl.createUser(cast(int) user.id, user.email);
			auto acl_per = new AclPermission();
			acl_per.addPermission("article.article.list", "文章列表");
			acl_per.addPermission("article.article.add", "添加文章");
			acl_per.addPermission("article.article.edit", "编辑文章");
			acl_per.addPermission("article.article.del", "删除文章");

			acl_per.addPermission("article.category.list", "分类列表");
			acl_per.addPermission("article.category.add", "添加分类");
			acl_per.addPermission("article.category.edit", "编辑分类");
			acl_per.addPermission("system.user.list", "员工列表");

			auto acl_role = acl.createRole(1, "test", acl_per);
			acl_user.assignRole(acl_role);

			acl_user.can("system.user.list");
			writeln(acl_user.can("system.user.list"));
			writeln("++++++++++++++++++++++++++++++++");
			return acl_user;
		}

		return null;
	}

}
