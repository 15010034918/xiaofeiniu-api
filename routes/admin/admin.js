const express=require('express');
const pool=require('../../pool');
var router=express.Router();
module.exports=router;


/* 
*API: GET /admin/login
*请求数据:{aname:'xxx', apwd:'xxx'}
*完成用户登录验证
*返回数据
*{code:200, msg: "login succ"}
*{code:400, msg: "aname or upwd err"}
*/

/* 
*API: PATCH /admin/login
*请求数据:{aname: 'xxx',oldPwd:'xxx',newPwd:'xxx'}
*根据管理员名和密码修改管理员密码
*返回数据
*{code:200, msg: "modified succ"}
*{code:400, msg: "aname or apwd err"}
*{code:401, msg: "apwd not modified"}
*/