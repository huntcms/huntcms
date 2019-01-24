
import hunt.framework;

import app.component.system.helper.MyAuthProxy;
import hunt.framework.security.acl;

void main()
{
    auto app = Application.getInstance();
	app.addGroupMiddleware(new AuthenticateMiddleware([
		"system.user.login", 
		"system.user.tryLogin", 
		"system.dashboard.dashboard", 
		"system.user.logout"
	]), "admin");
	app.accessManager.initAuthenticateProxy(new MyAuthProxy());
	app.run();
}
