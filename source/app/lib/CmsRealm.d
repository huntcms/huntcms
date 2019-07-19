module app.lib.CmsRealm;

import app.lib.Exceptions;
import app.component.system.helper.Password;
import app.component.system.model.User;
import app.component.system.model.Permission;
import app.component.system.model.Menu;
import app.component.system.model.Role;
import app.component.system.model.UserRole;

import app.component.system.repository.PermissionRepository;
import app.component.system.repository.RoleRepository;
import app.component.system.repository.RolePermissionRepository;
import app.component.system.repository.UserRepository;
import app.component.system.repository.UserRoleRepository;

import hunt.shiro;

import hunt.collection;
import hunt.entity;
import hunt.entity.DefaultEntityManagerFactory;
import hunt.logging.ConsoleLogger;
import hunt.String;

alias PermissionModel = app.component.system.model.Permission.Permission;

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

    ~this() {
        if(_cManager !is null) {
            _cManager.close();
        }
    }

    void initEntityManager() {
        if(_cManager is null) {
            _cManager = defaultEntityManagerFactory().createEntityManager();
        }
    }

    override protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) {
        initEntityManager();
        // EntityManager 
        // _cManager = defaultEntityManagerFactory().createEntityManager();
        // scope(exit) {
        //     _cManager.close();
        // }
        string username = token.getPrincipal();
        string password = cast(string)token.getCredentials();
        version(HUNT_DEBUG) infof("principal: %s", username);
        User userModel = (new UserRepository(_cManager)).findByEmail(username);

        if(userModel !is null) { 
            string checkSalt = generateUserPassword(password, userModel.salt);
            if(checkSalt == userModel.password) {
                String credentials = new String(password);
                SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(userModel, credentials, getName());
                return info;  
            } else {
                warning("Wrong password!");
                throw new WrongPasswordException(username);
            }
        } 

        warning("Your email has not been found or has been banned");
        throw new WrongEmailException(username);

        // return null;
    }

    override protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        initEntityManager();
        // EntityManager _cManager = defaultEntityManagerFactory().createEntityManager();
        // scope(exit) {
        //     _cManager.close();
        // }
        // infof("principals: %s", typeid(cast(Object)principals).name);
        // infof("principals: %s", typeid(cast(Object)principals).toString());

        // TODO: Tasks pending completion -@zhangxueping at 2019/5/30 12:30:04 pm
        // To cache the user's roles and permissions
        User user = cast(User) principals.getPrimaryPrincipal();
        if(user is null) {
            warning("no principals");
            return null;
        }
        version(HUNT_DEBUG) infof("principals: %s", user.name);

        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();

        RoleRepository roleRep = new RoleRepository(_cManager);
        Role[] userRoles = roleRep.getUserRoles(user.id);

        RolePermissionRepository rpRep = new RolePermissionRepository(_cManager);
        foreach(Role r; userRoles) {

            // roles
            info.addRole(r.name);
            version(HUNT_DEBUG) tracef("Role: id=%d, name=%s", r.id,  r.name);

            // permissions
            if(r.name == "admin" || r.name == "administrator" || r.name == "超级管理员" )  {
                info.addStringPermission("*"); // for administrator
            } else {
                foreach(PermissionModel p; rpRep.getRolePermissions(r.id)) {
                    // tracef("Permission: id=%d, uid=%s, title=%s", p.id, p.mca, p.title);
                    info.addStringPermission(p.mca);
                }
            }
        }

        return info;
    }

}