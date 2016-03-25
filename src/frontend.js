//import App from './components'
App = {}
//import {render} from 'react-dom'
render = require('react-dom').render

render(App, document.querySelector('#root'))

require('offline-plugin/runtime').install()
