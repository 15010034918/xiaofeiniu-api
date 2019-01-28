SET NAMES UTF8;
DROP DATABASE IF EXISTS xiaofeiniu;
CREATE DATABASE xiaofeiniu CHARSET=UTF8;
USE xiaofeiniu;

/* 管理员 */
CREATE TABLE xfn_admin(
  aid INT PRIMARY KEY AUTO_INCREMENT,
  aname VARCHAR(32) UNIQUE,
  apwd  VARCHAR(64)
);
INSERT INTO xfn_admin VALUES(NULL,'admin',PASSWORD(123456));
INSERT INTO xfn_admin VALUES(NULL,'boss',PASSWORD(999999));
INSERT INTO xfn_admin VALUES(NULL,'tom',PASSWORD(123456));

/* 项目全局设置 */
CREATE TABLE xfn_settings(
  sid INT PRIMARY KEY AUTO_INCREMENT,
  appName  VARCHAR(32),
  apiUrl  VARCHAR(64),
  adminUrl  VARCHAR(64),
  appUrl  VARCHAR(64),
  icp  VARCHAR(64),
  copyright  VARCHAR(128)
);
INSERT INTO xfn_settings VALUES(NULL,'小肥牛','http://127.0.0.1:8000','http://127.0.0.1:8091','http://127.0.0.1:8092','京ICP备12003709号-3','北京达内金桥科技有限公司版权所有');

/* 桌台表 */
CREATE TABLE xfn_table(
  tid INT PRIMARY KEY AUTO_INCREMENT,
  tname VARCHAR(64),
  type  VARCHAR(16),
  status INT
);
INSERT INTO xfn_table VALUES(NULL,'福满堂','6-8人桌','1');
INSERT INTO xfn_table VALUES(NULL,'金镶玉','4-6人桌','1');
INSERT INTO xfn_table VALUES(NULL,'寿齐天','8-10人桌','1');
INSERT INTO xfn_table VALUES(NULL,'全家福','10-12人桌','1');

/* 桌台预定信息 */
  CREATE TABLE xfn_reservation(
    rid INT PRIMARY KEY AUTO_INCREMENT,
    contactName VARCHAR(32),
    phone  VARCHAR(16),
    contactTime BIGINT,
    dinnerTime BIGINT,
    tableId   INT,
    Foreign key(tableId) REFERENCES xfn_table(tid)
  );
  INSERT INTO xfn_reservation VALUES(NULL,'丁丁','13501234567','1548404890420','1548410400000',1);
  INSERT INTO xfn_reservation VALUES(NULL,'当当','13501114567','1548409730420','1549410400000',2);
  INSERT INTO xfn_reservation VALUES(NULL,'豆豆','13501231467','1548404520420','1548810400000',3);
  INSERT INTO xfn_reservation VALUES(NULL,'丫丫','13509994567','1548084880420','1548880400000',4);

/* 菜品名称 */
CREATE TABLE xfn_category(
  cid INT PRIMARY KEY AUTO_INCREMENT,
  cname VARCHAR(32)
);
INSERT INTO xfn_category VALUES(NULL,'肉类');
INSERT INTO xfn_category VALUES(NULL,'豆制品');
INSERT INTO xfn_category VALUES(NULL,'海鲜类');
INSERT INTO xfn_category VALUES(NULL,'素菜');
INSERT INTO xfn_category VALUES(NULL,'小料');
INSERT INTO xfn_category VALUES(NULL,'酒水');

/* 菜品 */
CREATE TABLE xfn_dish(
  did INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(32),
  imgRrl VARCHAR(128),
  price DECIMAL(6,2),
  detail VARCHAR(128),
  categoryId INT, 
  Foreign key(categoryId) REFERENCES  xfn_category(cid)
);
INSERT INTO xfn_dish VALUES(10000,'草鱼片','CE7I9470.jpg',35,'选鲜活草鱼，切出鱼片冷鲜保存。锅开后再煮1分钟左右即可食用。',1);
INSERT INTO xfn_dish VALUES(NULL,'脆皮肠','CE7I9017.jpg',25,'锅开后再煮3分钟左右即可食用。',2);
INSERT INTO xfn_dish VALUES(NULL,'酥肉','HGS_4760.jpg',40,'选用冷鲜五花肉，加上鸡蛋，淀粉等原料炸制，色泽黄亮，酥软醇香，肥而不腻。锅开后再煮3分钟左右即可食用。',3);
INSERT INTO xfn_dish VALUES(NULL,'牛百叶','CE7I9302_.jpg',28,'毛肚切丝后，配以调味料腌制而成。锅开后再煮2分钟左右即可食用。',4);
INSERT INTO xfn_dish VALUES(NULL,'腰花','CE7I9287_.jpg',30,'选用大型厂家冷鲜腰花，经过解冻、清洗、切片而成。锅开后涮30秒左右即可食用。',5);

/* 订单表详情 */
CREATE TABLE xfn_order(
  oid INT PRIMARY KEY AUTO_INCREMENT,
  startTime BIGINT,
  endTime BIGINT,
  customerCount INT,
  tableld INT,
  Foreign key(tableld) REFERENCES  xfn_table(tid)
);
INSERT INTO xfn_order VALUES(NULL,'1548404890420','1548410400000',5,2);


/* 订单表 */
CREATE TABLE xfn_order_detail(
    did INT PRIMARY KEY AUTO_INCREMENT,
    dishId INT,
    dishCount INT,
    customerName VARCHAR(64),
    odderId INT,
    Foreign key(dishId) REFERENCES xfn_dish(did),
    Foreign key(odderId) REFERENCES xfn_order(oid)
);
INSERT INTO xfn_order_detail VALUES(NULL,10000,1,'丁丁',1);
