import Login from './components/Login'
import Index from './components/recipes/Index'
import Show from './components/recipes/Show'
import New from './components/recipes/New'
import Edit from './components/recipes/Edit'

export const routes = [
    {path: '/recipes', component: Index},
    {path: '/recipes/new', component: New},
    {path: '/recipes/edit/:id', component: Edit, name: 'edit'},
    {path: '/recipes/:id', component: Show, name: 'show'},
    {path: '/login', component: Login}
];