module app.auth.AdminIdentity;

import hunt.security.acl.Identity;
import hunt.http.request;
import hunt.security.acl.User;

import app.auth.Login;
import kiss.logger;


class AdminIdentity : Identity
{

	bool[string] _allowAction;

	this()
	{
		_allowAction["system.user.login"] = true;
		_allowAction["user.login"] = true;
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
		auto user = UserInfo.get(req);
		// import std.stdio;
		// import kiss.util.serialize;
		// writeln(toJson(user));
		return user;
	}
}

