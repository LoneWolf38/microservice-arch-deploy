resource "aws_vpc" "kubecluster"{
	cidr_block = "172.31.0.0/16"
	enable_dns_hostnames = "true"
	tags = {
		Name = "kubecluster"
	}
}


resource "aws_internet_gateway" "kubegateway" {
	vpc_id = "${aws_vpc.kubecluster.id}"
	tags = {
		Name = "KubeGateWay"
	}
}


resource "aws_subnet" "kubecluster_pub" {
	vpc_id = "${aws_vpc.kubecluster.id}"
	cidr_block = "172.31.1.0/24"
	tags = {
	 	Name = "PublicSubnet"
	}
}

resource "aws_subnet" "kubecluster_pri" {
	vpc_id = "${aws_vpc.kubecluster.id}"
	cidr_blocks = "172.31.50.0/24"
	tags = {
		Name = "PrivateSubnet"
	}
}

resource "aws_route_table" "kuberoutetable" {
	vpc_id = "${aws_vpc.kubecluster.id}"
	route {
		cidr_block = "172.31.50.0/24"
		gateway_id = "${aws_internet_gateway.kubegateway.id}"
	}
	route {
		cidr_block = "172.31.1.0/24"
	}
}

resource ""