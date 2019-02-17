package com.sxt.realm;

import com.sxt.bean.User;
import com.sxt.service.CustomerService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;


public class MyRealm extends AuthorizingRealm {

    @Autowired
    CustomerService customerService;

    /**
     * 认证信息
     */
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
//        String username = ((UsernamePasswordToken) token).getUsername();
//        if ("zhangsan".equals(username)){
//            String passwordFromDB = "123";
//            return new SimpleAuthenticationInfo(username,passwordFromDB,getName());
//        }
//        return null;

        String username = ((UsernamePasswordToken) token).getUsername();
        char[] psw = ((UsernamePasswordToken) token).getPassword();
        String password = new String(psw);
        User user = customerService.getUser(username);
        if (user==null){
            throw new UnknownAccountException();
        }
        if (null!=username && user.getPassword().equals(password)){
            return new SimpleAuthenticationInfo(username,password,getName());
        }else {
            return null;
        }
    }

    /**
     * 授权信息
     * @param
     * @return
     */
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        String username = (String)principals.getPrimaryPrincipal();
        User user = customerService.getUser(username);
        System.out.println(user);
        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
        authorizationInfo.addRole(user.getRoles());
        return authorizationInfo;
    }
}
