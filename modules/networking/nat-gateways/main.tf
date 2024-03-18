module "eip" {
  source = "../eip"
  eip_count = var.natgw_count
}

resource "aws_nat_gateway" "natgw" {
  count = var.natgw_count 
  #this element funtion will retrieves a single element from a list.If the given index is greater than the length of the list then the index is "wrapped around" by taking the index modulo the length of the list:
  allocation_id = element(module.eip.natgw_ids, count.index)
  subnet_id     = element(var.subnet_ids, count.index)
  tags          = merge(var.tags, lookup(var.tags_for_resource, "aws_nat_gateway", {}))
}
