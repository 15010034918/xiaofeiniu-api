const express=require('express');
const pool=require('../../pool');
var router=express.Router();

/* GET请求有主题吗
*API: GET /admin/login
*请求数据:{aname:'xxx', apwd:'xxx'}
*完成用户登录验证(提示:有的项目中此处选择用POST请求)
*返回数据
*{code:200, msg: "login succ"}
*{code:400, msg: "aname or upwd err"}
*/
router.get('/login/:aname/:apwd',(req,res)=>{
 var aname=req.params.aname;
 var apwd=req.params.apwd;
 console.log(aname)
 console.log(apwd)
//  需要对用户输入的面执行加密函数
 pool.query('SELECT aid FROM xfn_admin WHERE anama=? AND apwd=? AND apwd=PASSWORD(?)',[aname,apwd],(err,result)=>{
   if(err) throw err;
   if(result.length>0){//查询到一条数据
    res.send({code:200, msg: "login succ"})
   }else{//没查询到数据
    res.send({code:400, msg: "aname or apwd err"})
   }
 })
})
/* 
*API: PATCH /admin    //修改部分数据用PATCH   
*请求数据:{aname: 'xxx',oldPwd:'xxx',newPwd:'xxx'}
*根据管理员名和密码修改管理员密码
*返回数据
*{code:200, msg: "modified succ"}
*{code:400, msg: "aname or apwd err"}
*{code:401, msg: "apwd not modified"}
*/
router.patch('/',(req,res)=>{
  var data=req.body;//{aname:'',oldPwd:'',newPwd:''}
  // 首先根据aname/oldPwd查询用户是否存在
  pool.query('SELECT aid FROM xfn_admin WHERE aname=? AND apwd=PASSWORD(?)',[data.aname,data.oldPwd],(err,result)=>{
    if(err) throw err;
    if(result.length==0){
      res.send({code:400,msg: 'password err'})
      return;
    }
    // 如果查询到用户,在修改其密码
    pool.query('UPDATE  xfn_ADMIN SET apwd=PASSWORD(?) WHERE aname=?',[data.newPwd,data.aname],(err,result)=>{
      if(err) throw err;
      if(result.changedRows>0){//密码修改完成
        res.send({code:200,msg: 'modify succ'})
      }else{//新旧密码一样,未做修改
        res.send({code:401,msg: 'pwd not modified'})
      }
    })
  })
})

module.exports=router;