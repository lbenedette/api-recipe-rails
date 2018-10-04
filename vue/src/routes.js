import Register from './components/auth/Register'
import Login from './components/auth/Login'

import Index from './components/recipe/Index'
import Show from './components/recipe/Show'
import New from './components/recipe/New'
import Edit from './components/recipe/Edit'

import Profile from './components/user/Profile'

import store from './store'

const ifNotAuthenticated = (to, from, next) => {
  if (!store.getters.isAuthenticated) {
    next()
    return
  }
  next('/recipes')
}
  
const ifAuthenticated = (to, from, next) => {
  if (store.getters.isAuthenticated) {
    next()
    return
  }
  next('/login')
}

export const routes = [
  {path: '/recipes', component: Index, beforeEnter: ifAuthenticated },
  {path: '/recipes/new', component: New, beforeEnter: ifAuthenticated},
  {path: '/recipes/edit/:id', component: Edit, name: 'edit', beforeEnter: ifAuthenticated},
  {path: '/recipes/:id', component: Show, name: 'show', beforeEnter: ifAuthenticated},
  {path: '/register', component: Register, beforeEnter: ifNotAuthenticated},
  {path: '/login', component: Login, beforeEnter: ifNotAuthenticated},
  {path: '/users/profile/:id', component: Profile, name: 'profile', beforeEnter: ifAuthenticated},
];