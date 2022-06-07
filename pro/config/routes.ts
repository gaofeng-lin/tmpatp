export default [
  {
    name: 'resultsManager',
    icon: 'icon-results',
    path: '/results',
    component: './Results',
  },
  {
    path: '/results/caseinfo',
    hideInMenu: true,
    name: 'resultsCaseInfo',
    component: './ResultsCaseInfo',
    parentKeys: ['/results'],
  },
  {
    name: 'caseManager',
    icon: 'icon-cases',
    path: '/cases',
    routes: [
      {
        name: 'Index',
        icon: 'icon-cases',
        path: '/cases/index',
        component: './Cases/index',
      },
    ],
  },

  {
    name: 'jobManager',
    icon: 'icon-icon-jobs',
    path: '/jobs',
    component: './Jobs',
  },
  {
    path: '/',
    redirect: '/results',
  },
  {
    path: '/cases',
    redirect: '/cases/index',
  },
  {
    component: './404',
  },
];
