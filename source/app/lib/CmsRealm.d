module app.lib.CmsRealm;

import app.lib.Exceptions;
import app.component.system.helper.Password;
import app.component.system.model.User;
import app.component.system.repository.UserRepository;

import hunt.shiro;

import hunt.collection;
import hunt.entity;
import hunt.entity.DefaultEntityManagerFactory;
import hunt.logging.ConsoleLogger;
import hunt.String;

/**
https://blog.csdn.net/eaphyy/article/details/70918792
https://blog.csdn.net/qq_20641565/article/details/78772938
https://blog.csdn.net/u013087513/article/details/75051134
https://blog.csdn.net/u013087513/article/details/75051134
https://blog.csdn.net/bigwatermel/article/details/82730906
*/
class CmsRealm : AuthorizingRealm {

    EntityManager _cManager;

    this() {
        super();
        setCredentialsMatcher(new AllowAllCredentialsMatcher());
    }

    void initEntityManager() {
        if(_cManager is null) {
            _cManager = defaultEntityManagerFactory().createEntityManager();
        }
    }

    override protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) {
        initEntityManager();
        string username = token.getPrincipal();
        string password = cast(string)token.getCredentials();
        infof("principal: %s", username);
        User userModel = (new UserRepository(_cManager)).findByEmail(username);

        if(userModel !is null) { 
            string checkSalt = generateUserPassword(password, userModel.salt);
            if(checkSalt == userModel.password) {
                String credentials = new String(password);
                SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(userModel, credentials, getName());
                return info;                
                // auto user = Application.getInstance().accessManager.addUser(find.id);

                // if(user !is null){
                //     // return new RedirectResponse(request, "/admincp/");
                //     logError(find.language);
                //     setLocale(find.language);
                //     auto userInfo = Application.getInstance().accessManager.user;
                //     logError(toJson(userInfo));
                //     return new RedirectResponse(request, url("system.dashboard.dashboard", null, "admin"));
                // }
            }else{
                warning("Wrong password!");
                throw new WrongPasswordException(username);
            }
        } 
        
        warning("Your email has not been found or has been banned");
        throw new WrongEmailException(username);

        // User userModel = userHelper.findAccount(UserHelper.USERNAME_ACCOUNT, username);
        // bool r1 = userHelper.checkAccountLogin(userModel);
        
        // bool r2 = userHelper.checkPassword(userModel, password);
        // if(userModel !is null && r1 && r2) {
        //     String credentials = new String(password);
        //     SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(userModel, credentials, getName());
        //     return info;
        // }
        // return null;
    }

    override protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        initEntityManager();
        infof("principals: %s", typeid(cast(Object)principals).name);
        // User user = cast(User) principals.getPrimaryPrincipal();
        // if(user !is null) {
        //     SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        //     List!string permiss = getPermiss(user.username);
        //     info.addStringPermissions(permiss);
        //     // authorizationInfo.setRoles(userDao.getRoles(con,userName));
        //     return info;
        // }

        return null;
    }
    
    private List!string getPermiss(string userName) {
        List!string permiss = new ArrayList!string();
        permiss.add("user:profile");
        return permiss;
    }
}