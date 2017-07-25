import path from 'path'

const dataFilePath = path.join(__dirname, '../data/demo-data.sl3')

const knexCfg = { 
  client: 'sqlite3',
  connection: {
    filename: dataFilePath 
  },
  useNullAsDefault: true
}

if ('pg' == process.env.JM_DB) {
  knexCfg.client = 'pg'
  knexCfg.connection = process.env.DATABASE_URL
  knexCfg.useNullAsDefault = true
}

if ('mysql2' == process.env.JM_DB) {
  knexCfg.client = 'mysql2'
  knexCfg.connection = {
    host : 'mysql',
    user : 'root',
    password : 'joinMonster',
    database : 'join_monster'
  }
  knexCfg.useNullAsDefault = true
}

console.log('Using database config: ', knexCfg)
// knex is a convenient library that can connect to various SQL databases
// you can use any library you wish
export default require('knex')(knexCfg)
