#
# Automation instance
#


# Management Server

resource "openstack_compute_instance_v2" "labs-mgt-01" {
  name                = "labs-mgt-01"
  count               = "1"
  region              = "${var.region}"
  image_name          = "${var.image_name}"
  flavor_name         = "${var.flavor_name_general}"
  config_drive        = "true"
  availability_zone   = "${var.availability_zone}"
  key_pair            = "${var.keypair}"
  security_groups     = [ "${var.security_group}" ]
  depends_on          = [ "openstack_compute_secgroup_v2.default" ]
}

# Output of slave instance instance
output "labs-mgt-01" {
  value = "${join(" ", openstack_compute_instance_v2.labs-mgt-01.*.access_ip_v4)}"
}

# Ui servers

resource "openstack_compute_instance_v2" "labs-ui-01" {
  name                = "labs-ui-01"
  count               = "1"
  region              = "${var.region}"
  image_name          = "${var.image_name}"
  flavor_name         = "${var.flavor_name_general}"
  config_drive        = "true"
  availability_zone   = "${var.availability_zone}"
  key_pair            = "${var.keypair}"
  security_groups     = [ "${var.security_group}" ]
  depends_on          = [ "openstack_compute_secgroup_v2.default" , "openstack_compute_instance_v2.labs-mgt-01" ]
}
# Output of slave instance instance
output "labs-ui-01" {
  value = "${join(" ", openstack_compute_instance_v2.labs-ui-01.*.access_ip_v4)}"
}


resource "openstack_compute_instance_v2" "labs-ui-02" {
  name                = "labs-ui-02"
  count               = "1"
  region              = "${var.region}"
  image_name          = "${var.image_name}"
  flavor_name         = "${var.flavor_name_general}"
  config_drive        = "true"
  availability_zone   = "${var.availability_zone}"
  key_pair            = "${var.keypair}"
  security_groups     = [ "${var.security_group}" ]
  depends_on          = [ "openstack_compute_secgroup_v2.default" , "openstack_compute_instance_v2.labs-ui-01" ]
}
# Output of slave instance instance
output "labs-ui-02" {
  value = "${join(" ", openstack_compute_instance_v2.labs-ui-02.*.access_ip_v4)}"
}


# Collector ETL servers

resource "openstack_compute_instance_v2" "labs-col-01" {
  name                = "labs-col-01"
  count               = "1"
  region              = "${var.region}"
  image_name          = "${var.image_name}"
  flavor_name         = "${var.flavor_name_general}"
  config_drive        = "true"
  availability_zone   = "${var.availability_zone}"
  key_pair            = "${var.keypair}"
  security_groups     = [ "${var.security_group}" ]
  depends_on          = [ "openstack_compute_secgroup_v2.default" , "openstack_compute_instance_v2.labs-ui-02" ]
}
# Output of slave instance instance
output "labs-col-01" {
  value = "${join(" ", openstack_compute_instance_v2.labs-col-01.*.access_ip_v4)}"
}


resource "openstack_compute_instance_v2" "labs-col-02" {
  name                = "labs-col-02"
  count               = "1"
  region              = "${var.region}"
  image_name          = "${var.image_name}"
  flavor_name         = "${var.flavor_name_general}"
  config_drive        = "true"
  availability_zone   = "${var.availability_zone}"
  key_pair            = "${var.keypair}"
  security_groups     = [ "${var.security_group}" ]
  depends_on          = [ "openstack_compute_secgroup_v2.default" , "openstack_compute_instance_v2.labs-col-01" ]
}
# Output of slave instance instance
output "labs-col-02" {
  value = "${join(" ", openstack_compute_instance_v2.labs-col-02.*.access_ip_v4)}"
}


# Alerting Servers

resource "openstack_compute_instance_v2" "labs-alert-01" {
  name                = "labs-alert-01"
  count               = "1"
  region              = "${var.region}"
  image_name          = "${var.image_name}"
  flavor_name         = "${var.flavor_name_general}"
  config_drive        = "true"
  availability_zone   = "${var.availability_zone}"
  key_pair            = "${var.keypair}"
  security_groups     = [ "${var.security_group}" ]
  depends_on          = [ "openstack_compute_secgroup_v2.default" ,  "openstack_compute_instance_v2.labs-col-02" ]
}
# Output of slave instance instance
output "labs-alert-01" {
  value = "${join(" ", openstack_compute_instance_v2.labs-alert-01.*.access_ip_v4)}"
}



resource "openstack_compute_instance_v2" "labs-alert-02" {
  name                = "labs-alert-02"
  count               = "1"
  region              = "${var.region}"
  image_name          = "${var.image_name}"
  flavor_name         = "${var.flavor_name_general}"
  config_drive        = "true"
  availability_zone   = "${var.availability_zone}"
  key_pair            = "${var.keypair}"
  security_groups     = [ "${var.security_group}" ]
  depends_on          = [ "openstack_compute_secgroup_v2.default" , "openstack_compute_instance_v2.labs-alert-01" ]
}
# Output of slave instance instance
output "labs-alert-02" {
  value = "${join(" ", openstack_compute_instance_v2.labs-alert-02.*.access_ip_v4)}"
}


# Loadbalancer Server

resource "openstack_compute_instance_v2" "labs-lb-01" {
  name                = "labs-lb-01"
  count               = "1"
  region              = "${var.region}"
  image_name          = "${var.image_name}"
  flavor_name         = "${var.flavor_name_general}"
  config_drive        = "true"
  availability_zone   = "${var.availability_zone}"
  key_pair            = "${var.keypair}"
  security_groups     = [ "${var.security_group}" ]
  depends_on          = [ "openstack_compute_secgroup_v2.default" , "openstack_compute_instance_v2.labs-alert-02" ]
}
# Output of slave instance instance
output "labs-lb-01" {
  value = "${join(" ", openstack_compute_instance_v2.labs-lb-01.*.access_ip_v4)}"
}


resource "openstack_compute_instance_v2" "labs-lb-02" {
  name                = "labs-lb-02"
  count               = "1"
  region              = "${var.region}"
  image_name          = "${var.image_name}"
  flavor_name         = "${var.flavor_name_general}"
  config_drive        = "true"
  availability_zone   = "${var.availability_zone}"
  key_pair            = "${var.keypair}"
  security_groups     = [ "${var.security_group}" ]
  depends_on          = [ "openstack_compute_secgroup_v2.default" , "openstack_compute_instance_v2.labs-lb-01" ]
}
# Output of slave instance instance
output "labs-lb-02" {
  value = "${join(" ", openstack_compute_instance_v2.labs-lb-02.*.access_ip_v4)}"
}



# Platform Master server

resource "openstack_compute_instance_v2" "labs-mst-01" {
  name                = "labs-mst-01"
  count               = "1"
  region              = "${var.region}"
  image_name          = "${var.image_name}"
  flavor_name         = "${var.flavor_name_master}"
  config_drive        = "true"
  availability_zone   = "${var.availability_zone}"
  key_pair            = "${var.keypair}"
  security_groups     = [ "${var.security_group}" ]
  depends_on          = [ "openstack_compute_secgroup_v2.default" , "openstack_compute_instance_v2.labs-lb-02" ]
}
# Output of slave instance instance
output "labs-mst-01" {
  value = "${join(" ", openstack_compute_instance_v2.labs-mst-01.*.access_ip_v4)}"
}


resource "openstack_compute_instance_v2" "labs-mst-02" {
  name                = "labs-mst-02"
  count               = "1"
  region              = "${var.region}"
  image_name          = "${var.image_name}"
  flavor_name         = "${var.flavor_name_master}"
  config_drive        = "true"
  availability_zone   = "${var.availability_zone}"
  key_pair            = "${var.keypair}"
  security_groups     = [ "${var.security_group}" ]
  depends_on          = [ "openstack_compute_secgroup_v2.default" , , "openstack_compute_instance_v2.labs-mst-01" ]
}
# Output of slave instance instance
output "labs-mst-02" {
  value = "${join(" ", openstack_compute_instance_v2.labs-mst-02.*.access_ip_v4)}"
}


# Platform Slave Servers

resource "openstack_compute_instance_v2" "labs-slv-01" {
  name                = "labs-slv-01"
  count               = "1"
  region              = "${var.region}"
  image_name          = "${var.image_name}"
  flavor_name         = "${var.flavor_name_slave}"
  config_drive        = "true"
  availability_zone   = "${var.availability_zone}"
  key_pair            = "${var.keypair}"
  user_data           = "${file(\"user-data-slave.sh\")}"
  security_groups     = [ "${var.security_group}" ]
  depends_on          = [ "openstack_compute_secgroup_v2.default" , "openstack_compute_instance_v2.labs-mst-02" ]
}

# Output of slave instance instance
output "labs-slv-01" {
  value = "${join(" ", openstack_compute_instance_v2.labs-slv-01.*.access_ip_v4)}"
}

resource "openstack_compute_instance_v2" "labs-slv-02" {
  name                = "labs-slv-02"
  count               = "1"
  region              = "${var.region}"
  image_name          = "${var.image_name}"
  flavor_name         = "${var.flavor_name_slave}"
  config_drive        = "true"
  availability_zone   = "${var.availability_zone}"
  key_pair            = "${var.keypair}"
  user_data           = "${file(\"user-data-slave.sh\")}"
  security_groups     = [ "${var.security_group}" ]
  depends_on          = [ "openstack_compute_secgroup_v2.default" , "openstack_compute_instance_v2.labs-slv-01" ]
}

# Output of slave instance instance
output "labs-slv-02" {
  value = "${join(" ", openstack_compute_instance_v2.labs-slv-02.*.access_ip_v4)}"
}


resource "openstack_compute_instance_v2" "labs-slv-03" {
  name                = "labs-slv-03"
  count               = "1"
  region              = "${var.region}"
  image_name          = "${var.image_name}"
  flavor_name         = "${var.flavor_name_slave}"
  config_drive        = "true"
  availability_zone   = "${var.availability_zone}"
  key_pair            = "${var.keypair}"
  user_data           = "${file(\"user-data-slave.sh\")}"
  security_groups     = [ "${var.security_group}" ]
  depends_on          = [ "openstack_compute_secgroup_v2.default" , "openstack_compute_instance_v2.labs-slv-02" ]
}

# Output of slave instance instance
output "labs-slv-03" {
  value = "${join(" ", openstack_compute_instance_v2.labs-slv-03.*.access_ip_v4)}"
}

resource "openstack_compute_instance_v2" "labs-slv-04" {
  name                = "labs-slv-04"
  count               = "1"
  region              = "${var.region}"
  image_name          = "${var.image_name}"
  flavor_name         = "${var.flavor_name_slave}"
  config_drive        = "true"
  availability_zone   = "${var.availability_zone}"
  key_pair            = "${var.keypair}"
  user_data           = "${file(\"user-data-slave.sh\")}"
  security_groups     = [ "${var.security_group}" ]
  depends_on          = [ "openstack_compute_secgroup_v2.default" , "openstack_compute_instance_v2.labs-slv-03" ]
}

# Output of slave instance instance
output "labs-slv-04" {
  value = "${join(" ", openstack_compute_instance_v2.labs-slv-04.*.access_ip_v4)}"
}

resource "openstack_compute_instance_v2" "labs-slv-05" {
  name                = "labs-slv-05"
  count               = "1"
  region              = "${var.region}"
  image_name          = "${var.image_name}"
  flavor_name         = "${var.flavor_name_slave}"
  config_drive        = "true"
  availability_zone   = "${var.availability_zone}"
  key_pair            = "${var.keypair}"
  user_data           = "${file(\"user-data-slave.sh\")}"
  security_groups     = [ "${var.security_group}" ]
  depends_on          = [ "openstack_compute_secgroup_v2.default" , "openstack_compute_instance_v2.labs-slv-04" ]
}

# Output of slave instance instance
output "labs-slv-05" {
  value = "${join(" ", openstack_compute_instance_v2.labs-slv-05.*.access_ip_v4)}"
}

resource "openstack_compute_instance_v2" "labs-slv-06" {
  name                = "labs-slv-06"
  count               = "1"
  region              = "${var.region}"
  image_name          = "${var.image_name}"
  flavor_name         = "${var.flavor_name_slave}"
  config_drive        = "true"
  availability_zone   = "${var.availability_zone}"
  key_pair            = "${var.keypair}"
  user_data           = "${file(\"user-data-slave.sh\")}"
  security_groups     = [ "${var.security_group}" ]
  depends_on          = [ "openstack_compute_secgroup_v2.default" , "openstack_compute_instance_v2.labs-slv-05" ]
}

# Output of slave instance instance
output "labs-slv-06" {
  value = "${join(" ", openstack_compute_instance_v2.labs-slv-06.*.access_ip_v4)}"
}

resource "openstack_compute_instance_v2" "labs-slv-07" {
  name                = "labs-slv-07"
  count               = "1"
  region              = "${var.region}"
  image_name          = "${var.image_name}"
  flavor_name         = "${var.flavor_name_slave}"
  config_drive        = "true"
  availability_zone   = "${var.availability_zone}"
  key_pair            = "${var.keypair}"
  user_data           = "${file(\"user-data-slave.sh\")}"
  security_groups     = [ "${var.security_group}" ]
  depends_on          = [ "openstack_compute_secgroup_v2.default" , "openstack_compute_instance_v2.labs-slv-06" ]
}

# Output of slave instance instance
output "labs-slv-07" {
  value = "${join(" ", openstack_compute_instance_v2.labs-slv-07.*.access_ip_v4)}"
}

resource "openstack_compute_instance_v2" "labs-slv-08" {
  name                = "labs-slv-08"
  count               = "1"
  region              = "${var.region}"
  image_name          = "${var.image_name}"
  flavor_name         = "${var.flavor_name_slave}"
  config_drive        = "true"
  availability_zone   = "${var.availability_zone}"
  key_pair            = "${var.keypair}"
  user_data           = "${file(\"user-data-slave.sh\")}"
  security_groups     = [ "${var.security_group}" ]
  depends_on          = [ "openstack_compute_secgroup_v2.default" , "openstack_compute_instance_v2.labs-slv-07" ]
}

# Output of slave instance instance
output "labs-slv-08" {
  value = "${join(" ", openstack_compute_instance_v2.labs-slv-08.*.access_ip_v4)}"
}

resource "openstack_compute_instance_v2" "labs-slv-09" {
  name                = "labs-slv-09"
  count               = "1"
  region              = "${var.region}"
  image_name          = "${var.image_name}"
  flavor_name         = "${var.flavor_name_slave}"
  config_drive        = "true"
  availability_zone   = "${var.availability_zone}"
  key_pair            = "${var.keypair}"
  user_data           = "${file(\"user-data-slave.sh\")}"
  security_groups     = [ "${var.security_group}" ]
  depends_on          = [ "openstack_compute_secgroup_v2.default" , "openstack_compute_instance_v2.labs-slv-08" ]
}

# Output of slave instance instance
output "labs-slv-09" {
  value = "${join(" ", openstack_compute_instance_v2.labs-slv-09.*.access_ip_v4)}"
}
