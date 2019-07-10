import Layout from '@/page/index/'
export default [{
    path: '/wel',
    component: Layout,
    redirect: '/wel/index',
    children: [{
        path: 'index',
        name: '首页',
        component: () =>
            import ( /* webpackChunkName: "views" */ '@/page/wel')
    }]
}, {
    path: '/info',
    component: Layout,
    redirect: '/info/index',
    children: [{
        path: 'index',
        name: '个人信息',
        component: () =>
            import ( /* webpackChunkName: "page" */ '@/views/admin/user/info'),
    }]
}, {
    path: '/activti',
    component: Layout,
    redirect: '/activti/detail',
    children: [{
        path: 'detail/:id',
        component: () =>
            import ( /* webpackChunkName: "views" */ '@/views/activiti/detail')
    }]

},{
    path: '/message',
    component: Layout,
    redirect: '/message/index',
    children:[{
        path:'index',
        name:"消息中心",
        component:()=>
            import ( /* webpackChunkName: "views" */  '@/views/admin/message/info')
    }]
},{
    path: '/pay',
    component: Layout,
    redirect: '/pay/info',
    children:[{
        path:'info',
        name:"确认订单",
        component:()=>
            import ( /* webpackChunkName: "views" */  '@/views/admin/pay/info')
    },{
        path:'success',
        name:'支付完成',
        component:()=>
            import ('@/views/admin/pay/success')
    }]
},{
    path:'/pan',
    component:Layout,
    redirect: '/pan/index',
    children:[{
        path:'index',
        name:'网盘管理',
        component:()=> import('@/views/pan/index')
    }]
}]
