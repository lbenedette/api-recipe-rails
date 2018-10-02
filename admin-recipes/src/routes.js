import Login from './components/Login'
import Index from './components/recipes/Index'
import Show from './components/recipes/Show'

export const routes = [
    {path: '/recipes', component: Index},
    {path: '/recipes/:id', component: Show, name: 'show'},
    {path: '/login', component: Login}
];