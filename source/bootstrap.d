
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
	
	app.onBreadcrumbsInitializing((BreadcrumbsManager breadcrumbs) {

        breadcrumbs.register("home", (Breadcrumbs trail, Object[] params...) {
            trail.push("HuntCMS", url("admin:system.dashboard.dashboard"));
        });

        breadcrumbs.register("projects", (Breadcrumbs trail, Object[] params...) {
            trail.parent("home");
            trail.push("Project Manager", url("admin:project.project.list"));
        });

        breadcrumbs.register("documents", (Breadcrumbs trail, Object[] params...) {
            trail.parent("projects");
            trail.push("Document Manager", url("admin:document.document.history"));
        });

    });

	app.run();
}
