import hunt.framework;
import app.component.system.helper.MyAuthProxy;
import hunt.framework.application.ApplicationConfig;
import hunt.framework.i18n.I18n;
import hunt.framework.security.acl;
import hunt.util.DateTime;
import hunt.logging;
import std.datetime.systime;
import std.random;
import std.json;

import hunt.entity.DefaultEntityManagerFactory;
import app.component.system.model.LangPackage;
import app.component.system.repository.LangPackageRepository;
import app.component.system.repository.LanguageRepository;

import hunt.shiro;
import app.lib.CmsRealm;

void main()
{
    DateTimeHelper.startClock();
    auto app = Application.getInstance();
	app.addGroupMiddleware(new AuthenticateMiddleware([
		"system.user.login", 
		"system.user.tryLogin", 
		"system.dashboard.dashboard", 
		"system.user.logout"
	]), "admin");
	app.accessManager.initAuthenticateProxy(new MyAuthProxy());
	

    auto defaultLanguage = configManager().config("hunt").hunt.application.defaultLanguage.value;
    EntityManager _myAuthManager;
    _myAuthManager = defaultEntityManagerFactory().createEntityManager();
    auto langPackageRepository = new LangPackageRepository(_myAuthManager);
    auto allData = langPackageRepository.initLangPackage();
    _myAuthManager.close();
    I18n i18n = I18n.instance();
    foreach(key, oneArray; allData){
        i18n.merge(key, oneArray);
    }

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



void initializeShiro() {
		CmsRealm realm = new CmsRealm();
		// DefaultWebSecurityManager sm = new DefaultWebSecurityManager();
        // sm.setSessionMode(DefaultWebSecurityManager.NATIVE_SESSION_MODE);
		DefaultSecurityManager sm = new DefaultSecurityManager();
		sm.setRealm(realm);
        SecurityUtils.setSecurityManager(sm);
}