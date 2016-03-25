express = require 'express'
router = express.Router()
os = require 'os'

router.get '/stats/cpu', (req, res) -> res.json os.cpus()

router.get '/stats/arch', (req, res) -> res.json os.arch()

router.get '/', (req, res) -> res.send """
<h1>It works!</h1>
"""

module.exports = router
