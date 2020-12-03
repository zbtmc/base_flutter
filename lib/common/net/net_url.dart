

const base_url = 'http://test.jiazhengq.com/hms/';
const base_url_without_path = "http://test.jiazhengq.com/";

const common_question_url = "${base_url_without_path}h5-mobile/service_personal_member_question";

const login = 'login';
const resetPwd = 'resetPwd';  //修改密码
const userInfoUrl = 'userInfoUrl';  //获取用户信息
const courseList = 'courseList';
const hotCert = 'hotCert';  //其他热门证书查询
const certSummary = 'cert-summary';  //学习成果查询
const certDetail= 'certDetail';  //证书详情查询
const studyCourse= 'study-course';  //在学课程查询接口
const purchaseCourse= 'purchase-course';  //已购买课程 – 继续学习课程查询
const userInterestedStudyCourse= 'user-interested-study-course';  //阿姨们都在学接口
const userInterestedPaidCourse= 'user-interested-paid-course';  //您可能感兴趣的接口
const updateStatus= 'update-status';  //更改阿姨服务状态
const servicePersonal= 'service-personal';  //会员费信息查询接口
const placeOrder= 'place-order';  //开通、续费会员下单
const transfer= 'transfer'; //阿姨转交接口
const memberShipCourseDetail= 'member-shi-course-detail'; //赠送课程详情查询接口

const servicePath = {
  login:'app/sys/login',
  resetPwd:'app/sys/user/password',
  userInfoUrl:'app/mine/user/info',
  courseList:'app/course/all/page',
  hotCert:'app/mine/certificate/hot',
  certSummary:'app/mine/cert-summary',
  certDetail:'app/mine/certificate/detail',
  studyCourse:'app/mine/study-course',
  purchaseCourse:'app/mine/purchase-course',
  userInterestedStudyCourse:'app/mine/user-interested-study-course',
  userInterestedPaidCourse:'app/mine/user-interested-paid-course',
  updateStatus:'app/mine/user/update-status',
  servicePersonal:'app/member-ship/service-personal/info',
  placeOrder:'app/member-ship/place-order',
  transfer:'app/mine/user/transfer',
  memberShipCourseDetail:'app/member-ship/course-detail',

};