module app.lib.JwtToken;

import hunt.shiro.authc.AuthenticationToken;

/**
 * 自定义一个对象用来封装token
 *
 **/
class JwtToken : AuthenticationToken {

    private string token;

    this(string token) {
        this.token = token;
    }

    string getPrincipal() {
        return token;
    }

    char[] getCredentials() {
        return cast(char[])token;
    }
}