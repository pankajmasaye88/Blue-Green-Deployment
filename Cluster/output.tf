output "cluster_id" {
  value = aws_eks_cluster.pankajm.id
}

output "node_group_id" {
  value = aws_eks_node_group.pankajm.id
}

output "vpc_id" {
  value = aws_vpc.pankajm_vpc.id
}

output "subnet_ids" {
  value = aws_subnet.pankajm_subnet[*].id
}

