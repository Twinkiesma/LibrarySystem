# 基于SSM的图书馆管理系统——用户管理模块
本系统是一个B/S模式的管理系统，基于Spring + SpringMVC + MyBatis框架，MySql作为后台数据库，AdminLTE作为后台前端框架，使用Maven进行包管理。这是本人的小组大作业，分为管理员和读者用户，读者：用户登录，个人信息修改，图书查询借还；管理员：读者管理，图书管理，借还管理，超期管理等功能。实现了一个较为基本的图书管理系统，由于本人负责的模块为用户管理模块，所以只对此模块进行详细讲解。
## 开发工具
IntelliJ IDEA 2021.2.3 + Jdk1.8.0 + Tomcat 9.0.43 + Maven 3.8.3 + MySql 5.7
## 问题描述
![1](https://github.com/Twinkiesma/LibrarySystem/blob/master/picture/1.jpg)
## 一、数据库设计
### 1、属性描述
![2](https://github.com/Twinkiesma/LibrarySystem/blob/master/picture/2.jpg)
### 2、主要源码(Library.sql)
详细可在Library.sql文件中查看
### 3、连接成功后的数据库表
管理员表(admin)
![3](https://github.com/Twinkiesma/LibrarySystem/blob/master/picture/3.jpg)
读者表(reader)
![4](https://github.com/Twinkiesma/LibrarySystem/blob/master/picture/4.jpg)
读者信息表(reader_info)
![5](https://github.com/Twinkiesma/LibrarySystem/blob/master/picture/5.jpg)
## 二、项目创建
### 1、首先创建一个maven项目,项目结构如下：
![6](https://github.com/Twinkiesma/LibrarySystem/blob/master/picture/6.jpg)
根据SpringMVC三层架构，我们可以将项目分为Model（模型）、View（视图）、Controller（控制器）这三大部分，在此三大模型之上可以再细分为以下四层：  
 * 实体层(Bean)：如果想要对数据库进行一些操作，就要先写实体层。
 * 持久层(Dao)：存放对数据库底层进行操作的类。与数据库进行交互,封装了增删改查操作。
 * 业务层(Service)：负责模块间的数据交互与逻辑操作，对Dao层的再封装，有利于业务逻辑的独立性和重复利用性。
 * 控制层(Controller)：控制前端界面与后台的数据交互与逻辑操作，负责请求转发，接收页面传过来的参数，传给Service处理，接到返回值，再传回给页面。
### 2、导入相关依赖(pom.xml)
详细可在pom.xml文件中查看
### 3、准备数据库配置文件(druid.properties)
![7](https://github.com/Twinkiesma/LibrarySystem/blob/master/picture/7.jpg)
### 4、创建Spring核心配置文件(applicationContext.xml)
使用JDBC与MyBatis对数据库资源进行管理，详细可在applicationContext.xml文件中查看
 * SqlSessionFactory是MyBatis框架中十分重要的对象，它是单个数据库映射关系经过编译后的内存镜像，其主要作用是创建SqlSession。SqlSessionFactory对象是线程安全的。它一旦被创建，在整个应用执行期间都会存在。为了防止数据库资源的耗尽，使用单例模式。
 * SqlSession是MyBatis框架中另一个重要的对象，是应用程序与持久层之间执行交互操作的一个单线程对象，可直接执行已映射的SQL语句。SqlSession是线程不安全的，每次使用都需要及时关闭。
 * SqlSessionTemplate是MyBatis-Spring的核心，对MyBatis的SqlSession进行了简易替换,它调用MyBatis的SQL方法。SqlSessionTemplate是线程安全的，可以被多个Dao所共享使用。
### 5、创建Springmvc配置文件(book-servlet.xml)
详细可在applicationContext.xml文件中查看
### 6、要在web项目使用，还需设置web.xml
详细可在web.xml文件中查看
## 三、功能性需求 - 用户模块功能列表
![8](https://github.com/Twinkiesma/LibrarySystem/blob/master/picture/8.jpg)
### 1、创建与数据库表对应的实体类(bean)
详细可在bean文件中查看

可以看到以上实体类都包含有”implements Serializable”，这是为了实现对象的序列化。Serializable是一个空接口，没有什么具体内容，它的目的只是简单的标识一个类的对象可以被序列化。序列化的目的有两个，一是便于存储，二是便于传输。

Java中定义的实体类对象，大多是为了进行与数据库的读写，读写的本质是通过底层的IO操作，而IO操作是以字节流方式进行的，需要有编程语言数据类型⇔字节流的变化过程。所以如果实体类与数据库有交互，就必须进行序列化。
### 2、创建与数据库连接的持久层(dao)及其映射文件(xml)
#### 持久层(dao)
详细可在dao文件中查看
Bean的装配方式：

@Autowired注解由Spring提供，默认按照类型注入。
 * required属性：默认为true，表示依赖对象必须存在，不存在则会报错；如果要允许null值，则需设置为false，表示依赖对象存在就注入，不存在则不注入。
 * @Primary注解：按类型装配时，如果该类型的bean不止一个时，会直接报错。这时在其中一个使用该注解，表示它会被选中，作为自动装配的bean。
 * @Qualifier注解：如果想使用名称装配可以结合进行使用。

@Resource注解由J2EE提供，默认按照名称注入。
 * 两个重要的属性：name和type
 * 都没指定，自动按照名称装配，如果没有匹配，则按照类型装配，找不到则抛出异常。
 * 都指定了，会找到唯一bean进行装配，找不到则抛出异常。
 * 只指定name属性，就只会按照名称进行装配，找不到则抛出异常。
 * 只指定type属性，按照类型找到唯一bean进行装配，找不到或找到多个，都抛出异常。
#### 映射文件(xml)
详细可在MyBatis文件中查看
![9](https://github.com/Twinkiesma/LibrarySystem/blob/master/picture/9.jpg)
 * resultType：指定sql输出结果类型，共四种：Map、List、基本数据类型、pojo类型。
 * parameterType：传入sql参数类型，共两种：基本数据类型(int,string,long,Date)、复杂数据类型(类,Map)。

MyBatis获取参数值的两种方式：#{ }，${ }字符串拼接。
 * ＃{ }是占位符赋值，会根据传递进来的值选择是否加双引号，不会产生字符串拼接，更安全。
 * ${ }是字符串拼接，传递后会与sql语句进行字符拼接，需要手动加单引号，且存在sql注入问题。
 * SQL注入：攻击者在事先定义好的 sql 语句中添加额外的sql语句欺骗数据库服务器，以此执行计划外的命令或访问未被授权的数据。

### 3、创建各种功能文件(Controller)
详细可在controller文件中查看
![10](https://github.com/Twinkiesma/LibrarySystem/blob/master/picture/10.jpg)
![11](https://github.com/Twinkiesma/LibrarySystem/blob/master/picture/11.jpg)
值得注意的是在“管理员删除读者”功能中有一行“不可使用”的备注，同样是传递参数，在“跳转读者查看个人信息页面”功能中使用的方法为何不同？这里就要提到getParameter()与getAttribute()区别了。
 * getParameter()：用于获取客户端通过get或post方式（表单提交）传递的参数，代表Http请求数据，只能返回字符串。
 * getAttribute()：用于获取请求作用域中的数据，只能获取到服务器通过setAttribute()设置的数据，返回任意类型。
## 四、应用程序设计-功能模块组成列表
### 1、登录界面
![12](https://github.com/Twinkiesma/LibrarySystem/blob/master/picture/12.jpg)
![13](https://github.com/Twinkiesma/LibrarySystem/blob/master/picture/13.jpg)
### 2、读者管理个人信息界面
 * a.查看个人信息
![14](https://github.com/Twinkiesma/LibrarySystem/blob/master/picture/14.jpg)
 * b.修改个人信息
![15](https://github.com/Twinkiesma/LibrarySystem/blob/master/picture/15.jpg)
 * c.修改登录密码
![16](https://github.com/Twinkiesma/LibrarySystem/blob/master/picture/16.jpg)
![17](https://github.com/Twinkiesma/LibrarySystem/blob/master/picture/17.jpg)
### 3、管理员管理读者界面
a.查看全部读者信息
![18](https://github.com/Twinkiesma/LibrarySystem/blob/master/picture/18.jpg)
b.修改读者信息
![19](https://github.com/Twinkiesma/LibrarySystem/blob/master/picture/19.jpg)
c.删除读者
![20](https://github.com/Twinkiesma/LibrarySystem/blob/master/picture/20.jpg)
c.添加读者
![21](https://github.com/Twinkiesma/LibrarySystem/blob/master/picture/21.jpg)
### 4、出错界面
![22](https://github.com/Twinkiesma/LibrarySystem/blob/master/picture/22.jpg)
