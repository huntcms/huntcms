module app.component.system.authentication.JwtUtil;

import jwt;
import hunt.logging.ConsoleLogger;
import hunt.util.DateTime;

// import core.time;
// import std.datetime;

/**
 * 用来进行签名和效验Token
 * https://www.itwork.club/2018/10/08/springboot-shiro-jwt/
 **/
class JwtUtil {

    /**
     * 过期时间
     */
    __gshared long EXPIRE_TIME = 5 * 60 * 1000;

    /**
     * 校验token是否正确
     *
     * @param token    密钥
     * @param username 用户名
     * @param secret   用户的密码
     * @return 正确: true；不正确：false
     */
    static bool verify(string token, string username, string secret) {
        // 根据密码生成JWT校验器
        try {
            // 校验TOKEN
            Token tk = jwt.verify(token, secret, [JWTAlgorithm.HS256, JWTAlgorithm.HS512]);
            return true;
        } catch (Exception e) {
            warning(e);
            return false;
        }
    }

    /**
     * 获取用户名
     *
     * @param token token中包含了用户名
     * @return
     */
    static string getUsername(string token) {
        try {
            Token tk = decode(token);
            return tk.claims().get("username");
            // DecodedJWT jwt = JWT.decode(token);
            // return jwt.getClaim("username").asString();
        } catch (Exception e) {
            warning(e);
            return null;
        }
    }

    /**
     * 生成签名
     *
     * @param username 用户名
     * @param secret   密码
     * @return 加密的TOKEN
     */
     static string sign(string username, string secret) {
        Token token = new Token(JWTAlgorithm.HS512);
        token.claims.exp = cast(int) DateTime.currentUnixTime() + EXPIRE_TIME;
        token.claims.set("username", username); // 附带用户信息
        return token.encode(secret);
    }
    
}