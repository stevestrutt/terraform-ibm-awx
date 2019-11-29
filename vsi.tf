resource ibm_is_instance "vsi" {
  name           = "${var.basename}-vsi"
  vpc            = "${ibm_is_vpc.awxvpc.id}"
  zone           = "${var.subnet_zone}"
  keys           = ["${ibm_is_ssh_key.sshkey.id}"]
  image          = "${data.ibm_is_image.image1.id}"
  profile        = "cc1-2x4"
  resource_group = "${data.ibm_resource_group.group.id}"

  primary_network_interface = {
    subnet          = "${ibm_is_subnet.awxsubnet.id}"
    security_groups = ["${ibm_is_security_group.awxsg.id}"]
  }
}
