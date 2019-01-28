/* 
*小肥牛扫码点餐项目API子系统
*/
console.log('准备启动API服务器...');
console.log(new Date().toLocaleString());

const PORT =8090;
const cors=require('cors')
const bodyParser=require('body-parser')
const express =require('express');
const categoryRouter=require('./routes/admin/category');
const adminRouter=require('./routes/admin/admin');

var app=express();

/* 跨域处理 */
app.use(cors({}))
// app.use(bodyParset.urlencoded({}))
// 把app
/* 把application/JSON格式的请求数据解析出来放入req.body属性 */
app.use(bodyParser.json());
/* 创建HTTP应用服务器 */
app.listen(PORT,()=>{
  console.log('API服务器启动成功...:'+PORT);
})

// 挂载路由器
app.use('/admin/category',categoryRouter);
app.use('/admin/admin',adminRouter);