/* 
*小肥牛扫码点餐项目API子系统
*/
console.log('准备启动API服务器...');
console.log(new Date().toLocaleString());

const PORT =8090;
const cors=require('cors')
const express =require('express');
const categoryRouter=require('./routes/admin/category');

var app=express();

/* 跨域处理 */
app.use(cors({
  origin: ["http://127.0.0.1:5500","http://127.0.0.1:8090"]
}))

/* 创建HTTP应用服务器 */
app.listen(PORT,()=>{
  console.log('API服务器启动成功...:'+PORT);
})

// 挂载路由器
app.use('/admin/category',categoryRouter);