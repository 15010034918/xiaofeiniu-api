/* 
*菜品类别相关的路由
*/
const express=require('express');
const pool=require('./pool');
var router=express.Router();
module.express=router;

/* 
*API: GET /admin/category
*客户端获取所有的菜品类别,按编号升序排序
*返回值行如
*[{cid:1,cname:'..'},{....}]
*/
