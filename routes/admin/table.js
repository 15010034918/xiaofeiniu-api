/* 桌台相关的路由器 */
const express=require('express');
const pool=require('../../pool');
const router=express.Router();
module.exports=router;

/**
 * Get/admin/table
 * 获取所有的桌台信息
 * 返回数据:
 * [
 *  {tid:'xxx',tname:'xxx', status:'xxx'}
 *  .......
 * ]
 */
router.get('/',(req,res)=>{
  pool.query('SELECT * FROM xfn_table ORDER BY tid',(err,result)=>{
    if(err) throw err;
    res.send(result);
  })
})

/**
 * PUT/admin/table
 * 根据指定id修改桌台信息
 * 返回数据:
 * [
 *  {tid:'xxx',tname:'xxx', status:'xxx'}
 *  .......
 * ]
 */
router.put('/',(req,res)=>{
  var data=req.data;
  pool.query('UPDATE xfn_table SET ? WHERE tid=?',[data, data.tid],(err,result)=>{
    if(err) throw err;
    if(result.changedRows>0){  //实际修改了一行
      res.send({code:200, msg: '1 table modified'})
    }else if(result.affectedRows==0){  //影响到0行
      res.send({code:400, msg:'table not exits'})
    }else if(result.affectedRows==1 && result.changedRows==0){ //影响到1行，但修改了0行——新值与旧值完全一样
      res.send({code:401, msg:'no table modified'})
    }
  })
})

/*
*API:  POST /admin/table
*请求参数：{cname:'xxx'}
*含义：添加新的桌台
*返回值形如：
*  {code: 200, msg: '1 table added', cid: x }
*/
router.post('/', (req, res)=>{
  var data = req.body;   //形如{cname: 'xxx', }
  pool.query('INSERT INTO xfn_table SET ?', data, (err, result)=>{  //注意此处SQL语句的简写
    if(err)throw err;
    res.send({code: 200, msg: '1 table added',cid: result.insertId});
  })
})

/*
*API:  DELETE /admin/table/:cid
*含义：根据表示菜品编号的路由参数，删除该桌台
*返回值形如：
*  {code: 200, msg: '1 table deleted' }
*  {code: 400, msg: '0 table deleted' }
*/
router.delete('/:tid', (req, res) => {
  //注意：删除桌台
  pool.query('UPDATE xfn_table  WHERE tid=?', req.params.tid, (err, result) => {
    if (err) throw err;
    //至此指定类别的菜品已经修改完毕
    pool.query('DELETE FROM xfn_table WHERE cid=?', req.params.cid, (err, result) => {
      if (err) throw err;
      //获取DELETE语句在数据库中影响的行数
      if (result.affectedRows > 0) {
        res.send({ code: 200, msg: '1 table deleted' })
      } else {
        res.send({ code: 400, msg: '0 table deleted' })
      }
    })
  })
})