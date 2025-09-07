import { Router } from 'express'
import { authMiddleware } from '../middlewares/auth'

const router = Router()

// GET /transactions
router.get('/', authMiddleware, async (req, res) => {
  const user = (req as any).user

  // Aqui no futuro você buscaria as transações do banco filtrando por user.id
  res.json({
    message: `Bem-vindo, ${user.email}`,
    transactions: []
  })
})

export default router
