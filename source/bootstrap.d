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
import app.component.system.authentication.CmsRealm;
import hunt.framework.Simplify;

void main()
{
    auto app = Application.getInstance();
	// app.addGroupMiddleware(new AuthenticateMiddleware([
	// 	"system.user.login", 
	// 	"system.user.tryLogin", 
	// 	"system.dashboard.dashboard", 
	// 	"system.user.logout"
	// ]), "admin");
	// app.accessManager.initAuthenticateProxy(new MyAuthProxy());
	

    auto defaultLanguage = configManager().config("hunt").hunt.application.defaultLanguage.value;
    // EntityManager _myAuthManager;
    // _myAuthManager = defaultEntityManagerFactory().createEntityManager();
    auto langPackageRepository = new LangPackageRepository();
    auto allData = langPackageRepository.initLangPackage();
    // _myAuthManager.close();
    closeDefaultEntityManager();
    I18n i18n = I18n.instance();
    foreach(key, oneArray; allData){
        i18n.merge(key, oneArray);
    }

	app.onBreadcrumbsInitializing((BreadcrumbsManager breadcrumbs) {

        breadcrumbs.register("home", (Breadcrumbs trail, Object[] params...) {
            trail.push("HuntCMS", url("admin:system.dashboard.dashboard"));
        });

        // admin tag manager breadcrumbs.
        breadcrumbs.register("tagList", (Breadcrumbs trail, Object[] params...) {
            trail.parent("home");
            trail.push("Tag Manager", url("admin:tag.tag.list"));
        });
        breadcrumbs.register("tagAdd", (Breadcrumbs trail, Object[] params...) {
            trail.parent("tagList");
            trail.push("Tag Add", url("admin:tag.tag.add"));
        });
        breadcrumbs.register("tagEdit", (Breadcrumbs trail, Object[] params...) {
            trail.parent("tagList");
            trail.push("Tag Edit", url("admin:tag.tag.edit"));
        });

        // admin article manager breadcrumbs.
        breadcrumbs.register("articleCategoryList", (Breadcrumbs trail, Object[] params...) {
            trail.parent("home");
            trail.push("Article Category Manager", url("admin:article.category.list"));
        });
        breadcrumbs.register("articleCategoryAdd", (Breadcrumbs trail, Object[] params...) {
            trail.parent("articleCategoryList");
            trail.push("Article Category Add", url("admin:article.category.add"));
        });
        breadcrumbs.register("articleCategoryEdit", (Breadcrumbs trail, Object[] params...) {
            trail.parent("articleCategoryList");
            trail.push("Article Category Edit", url("admin:article.category.edit"));
        });

        breadcrumbs.register("articleList", (Breadcrumbs trail, Object[] params...) {
            trail.parent("home");
            trail.push("Article Manager", url("admin:article.article..list"));
        });
        breadcrumbs.register("articleAdd", (Breadcrumbs trail, Object[] params...) {
            trail.parent("articleList");
            trail.push("Article Add", url("admin:article.article..add"));
        });
        breadcrumbs.register("articleEdit", (Breadcrumbs trail, Object[] params...) {
            trail.parent("articleList");
            trail.push("Article Edit", url("admin:article.article..edit"));
        });

        // admin banner manager breadcrumbs.
        breadcrumbs.register("bannerList", (Breadcrumbs trail, Object[] params...) {
            trail.parent("home");
            trail.push("Banner Manager", url("admin:portal.banner.list"));
        });
        breadcrumbs.register("bannerAdd", (Breadcrumbs trail, Object[] params...) {
            trail.parent("bannerList");
            trail.push("Banner Add", url("admin:portal.banner.add"));
        });
        breadcrumbs.register("bannerEdit", (Breadcrumbs trail, Object[] params...) {
            trail.parent("bannerList");
            trail.push("Banner Edit", url("admin:portal.banner.edit"));
        });

        // admin package manager breadcrumbs.
        breadcrumbs.register("packageList", (Breadcrumbs trail, Object[] params...) {
            trail.parent("home");
            trail.push("Package Manager", url("admin:system.langpackage.list"));
        });
        breadcrumbs.register("packageAdd", (Breadcrumbs trail, Object[] params...) {
            trail.parent("packageList");
            trail.push("Package Add", url("admin:system.langpackage.add"));
        });
        breadcrumbs.register("packageEdit", (Breadcrumbs trail, Object[] params...) {
            trail.parent("packageList");
            trail.push("Package Edit", url("admin:system.langpackage.edit"));
        });

        // admin log manager breadcrumbs.
        breadcrumbs.register("logList", (Breadcrumbs trail, Object[] params...) {
            trail.parent("home");
            trail.push("Log Manager", url("admin:system.log.list"));
        });

        // admin menu manager breadcrumbs.
        breadcrumbs.register("menuList", (Breadcrumbs trail, Object[] params...) {
            trail.parent("home");
            trail.push("Menu Manager", url("admin:system.menu.list"));
        });
        breadcrumbs.register("menuAdd", (Breadcrumbs trail, Object[] params...) {
            trail.parent("menuList");
            trail.push("Menu Add", url("admin:system.menu.add"));
        });
        breadcrumbs.register("menuEdit", (Breadcrumbs trail, Object[] params...) {
            trail.parent("menuList");
            trail.push("Menu Edit", url("admin:system.menu.edit"));
        });

        // admin permission manager breadcrumbs.
        breadcrumbs.register("permissionList", (Breadcrumbs trail, Object[] params...) {
            trail.parent("home");
            trail.push("Permission Manager", url("admin:system.permission.list"));
        });
        breadcrumbs.register("permissionAdd", (Breadcrumbs trail, Object[] params...) {
            trail.parent("permissionList");
            trail.push("Permission Add", url("admin:system.permission.add"));
        });
        breadcrumbs.register("permissionEdit", (Breadcrumbs trail, Object[] params...) {
            trail.parent("permissionList");
            trail.push("Permission Edit", url("admin:system.permission.edit"));
        });

        // admin permissionGroup manager breadcrumbs.
        breadcrumbs.register("permissionGroupList", (Breadcrumbs trail, Object[] params...) {
            trail.parent("home");
            trail.push("Permission Group Manager", url("admin:system.permissiongroup.list"));
        });
        breadcrumbs.register("permissionGroupAdd", (Breadcrumbs trail, Object[] params...) {
            trail.parent("permissionGroupList");
            trail.push("Permission Group Add", url("admin:system.permissiongroup.add"));
        });
        breadcrumbs.register("permissionGroupEdit", (Breadcrumbs trail, Object[] params...) {
            trail.parent("permissionGroupList");
            trail.push("Permission Group Edit", url("admin:system.permissiongroup.edit"));
        });




    });

    initializeShiro();
	app.run();
}

void initializeShiro() {
	CmsRealm realm = new CmsRealm();
    auto cacheManager = new MemoryConstrainedCacheManager!(Object, AuthorizationInfo)();
	// DefaultWebSecurityManager sm = new DefaultWebSecurityManager();
    // sm.setSessionMode(DefaultWebSecurityManager.NATIVE_SESSION_MODE);
	DefaultSecurityManager sm = new DefaultSecurityManager();
	sm.setRealm(realm);
    sm.setCacheManager(cacheManager);
    SecurityUtils.setSecurityManager(sm);
}