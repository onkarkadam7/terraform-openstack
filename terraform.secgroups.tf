resource "openstack_compute_secgroup_v2" "default" {
  name = "default"
  description = "Security group for bigdata SRX servers"
  region = "${var.region}"

  rule {
    from_port = -1
    to_port = -1
    ip_protocol = "icmp"
    cidr = "172.31.0.0/16"
  }

  rule {
    from_port = 1
    to_port = 65535
    ip_protocol = "udp"
    cidr = "172.31.0.0/16"
  }

  rule {
    from_port = 1
    to_port = 65535
    ip_protocol = "tcp"
    cidr = "172.31.0.0/16"
  }

  rule {
    from_port = 1
    to_port = 65535
    ip_protocol = "udp"
    cidr = "10.0.0.0/8"
  }

  rule {
    from_port = 1
    to_port = 65535
    ip_protocol = "tcp"
    cidr = "10.0.0.0/8"
  }

  rule {
    from_port = -1
    to_port = -1
    ip_protocol = "icmp"
    cidr = "10.0.0.0/8"
  }
  
   rule {
    from_port = 1
    to_port = 65535
    ip_protocol = "udp"
    cidr = "10.253.58.0/24"
  }

  rule {
    from_port = 1
    to_port = 65535
    ip_protocol = "tcp"
    cidr = "10.253.58.0/24"
  }

  rule {
    from_port = -1
    to_port = -1
    ip_protocol = "icmp"
    cidr = "10.253.58.0/24"
  }
  
  rule {
    from_port = 80
    to_port = 80
    ip_protocol = "tcp"
    cidr = "0.0.0.0/0"
  }
  
  rule {
    from_port = 443
    to_port = 443
    ip_protocol = "tcp"
    cidr = "0.0.0.0/0"
  }

  rule {
    from_port = 8081
    to_port = 8081
    ip_protocol = "tcp"
    cidr = "0.0.0.0/0"
  }
  
  rule {
    from_port = 5070
    to_port = 5070
    ip_protocol = "tcp"
    cidr = "0.0.0.0/0"
  }
  
  rule {
    from_port = 8080
    to_port = 8080
    ip_protocol = "tcp"
    cidr = "0.0.0.0/0"
  }
   
  rule {
    from_port = 8082
    to_port = 8082
    ip_protocol = "tcp"
    cidr = "0.0.0.0/0"
  }
   
  rule {
    from_port = 8088
    to_port = 8088
    ip_protocol = "tcp"
    cidr = "0.0.0.0/0"
  }
  
  rule {
    from_port = 15672
    to_port = 15672
    ip_protocol = "tcp"
    cidr = "0.0.0.0/0"
  }
  
  rule {
    from_port = 18080
    to_port = 18082
    ip_protocol = "tcp"
    cidr = "0.0.0.0/0"
  }
  
  rule {
    from_port = 21050
    to_port = 21050
    ip_protocol = "tcp"
    cidr = "0.0.0.0/0"
  }
  
  rule {
    from_port = 25010
    to_port = 25010
    ip_protocol = "tcp"
    cidr = "0.0.0.0/0"
  }
  
  rule {
    from_port = 25020
    to_port = 25020
    ip_protocol = "tcp"
    cidr = "0.0.0.0/0"
  }
}
