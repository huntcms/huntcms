module app.identity.AdminIdentity;

import hunt.framework.security.acl.Identity;
import hunt.framework.http.request;
import hunt.framework.security.acl.User;

import app.auth.UserAuth;

import kiss.logger;

class AdminIdentity : Identity
{

	bool[string] _allowAction;

	this()
	{
		_allowAction["system.user.login"] = true;
		_allowAction["system.user.logout"] = true;
	}

	string group()
	{
		return "admin";
	}

	bool isAllowAction(string persident)
	{
		return (persident in _allowAction) != null;
	}

	void addAllowAction(string persident)
	{
		_allowAction[persident] = true;
	}

	User login(Request req)
	{
		auto user = UserAuth.get(req);
		import std.stdio;
		import kiss.util.serialize;
		return user;
	}
}
