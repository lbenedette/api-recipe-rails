import Register from './components/auth/Register'
import Login from './components/auth/Login'
import Index from './components/recipe/Index'
import Show from './components/recipe/Show'
import New from './components/recipe/New'
import Edit from './components/recipe/Edit'

export const routes = [
    {path: '/recipes', component: Index},
    {path: '/recipes/new', component: New},
    {path: '/recipes/edit/:id', component: Edit, name: 'edit'},
    {path: '/recipes/:id', component: Show, name: 'show'},
    {path: '/register', component: Register},
    {path: '/login', component: Login}
];