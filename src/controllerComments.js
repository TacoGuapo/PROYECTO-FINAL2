import { pool } from './db.js'

export const createComm = async (req, res) => {
  const { commUser, comment, idPosts } = req.body
  if (!commUser || !comment || !idPosts) {
    return res.status(400).json({ error: 'commUser, comment, idPosts are required!' })
  }

  const creationDate = new Date().toISOString().slice(0, 19).replace('T', ' ')

  try {
    const result = await pool.execute('INSERT INTO comments (id_users, creation_date, content, id_posts) VALUES (?, ?, ?, ?)', [commUser, creationDate, comment, idPosts])
    const newComm = {
      id: result.insertId,
      commUser,
      creationDate,
      comment,
      idPosts
    }
    res.status(201).json(newComm)
  } catch (error) {
    console.error('Error create Comments:', error)
    res.status(500).json({ error: 'Error create Comments' })
  }
}

export const updateComm = async (req, res) => {
  const commId = parseInt(req.params.id, 10)
  const { comment } = req.body

  const creationDate = new Date().toISOString().slice(0, 19).replace('T', ' ')

  try {
    const [result] = await pool.execute('UPDATE comments SET content = ?, creation_date = ? WHERE id_comments = ?', [comment, creationDate, commId])
    if (result.affectedRows === 0) {
      return res.status(404).json({ error: 'comment not found' })
    }
    res.json({ id: commId, comment, creationDate })
  } catch (error) {
    console.error('Error updating comment:', error)
    res.status(500).json({ error: 'Error updating comment' })
  }
}

export const deleteComm = async (req, res) => {
  const commId = parseInt(req.params.id, 10)

  try {
    const [result] = await pool.execute('DELETE FROM comments WHERE id_comments = ?', [commId])
    if (result.affectedRows === 0) {
      return res.status(404).json({ error: 'Comment not found' })
    }
    res.status(204).send()
  } catch (error) {
    console.error('Error delete comment:', error)
    res.status(500).json({ error: 'Error delete comment' })
  }
}

export const commentList = async (req, res) => {
  const commId = parseInt(req.params.id, 10)
  try {
    const [rows] = await pool.execute('SELECT * FROM comments WHERE id_posts = ?', [commId])
    res.json(rows)
  } catch (error) {
    console.error('Error getting users list:', error)
    res.status(500).json({ error: 'Error getting users list' })
  }
}
