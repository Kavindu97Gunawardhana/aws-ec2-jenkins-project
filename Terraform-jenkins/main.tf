module "kp" {
  source = "./modules/kp"
}

module "sg" {
  source = "./modules/sg"
}

module "ec2" {
  source = "./modules/ec2"
  sg_id = module.sg.sg_id
}