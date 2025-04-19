module "database" {
  source = "./database"
}

module "backend" {
  source = "./backend"
  visitors_table_arn = module.database.visitors_table_arn

}
