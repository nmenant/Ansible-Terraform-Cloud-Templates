resource "aws_cloudformation_stack" "f5-standalone-hourly" {
  name         = "${var.owner}-f5-standalone"
  capabilities = ["CAPABILITY_IAM"]

  parameters {
    #NETWORKING CONFIGURATION

    Vpc                          = "${var.vpc_id}"
    subnet1Az1                   = "${var.f5_subnet1_id}"
    
    managementGuiPort = "${var.bigip_https_port}"

    #INSTANCE CONFIGURATION

    imageName            = "Good25Mbps"
    instanceType         = "m4.xlarge"
    restrictedSrcAddress = "${var.AllowedIPs}"
    restrictedSrcAddressApp = "${var.AllowedIPs}"
    sshKey               = "${var.key_name}"
    ntpServer            = "${var.ntp_pool}"
    allowUsageAnalytics = "Yes"

    #AS3 configuration
    declarationUrl = "${var.AS3_declaration_url}"

    #BIG-IQ LICENSING CONFIGURATION


    # bigiqAddress         = "${var.bigiqLicenseManager}"
    # bigiqUsername        = "admin"
    # bigiqPasswordS3Arn   = "arn:aws:s3:::f5-public-cloud/passwd"
    # bigiqLicensePoolName = "${var.bigiqLicensePoolName}"


    #TAGS

    application = "f5app"
    environment = "f5env"
    group       = "f5group"
    owner       = "${var.owner}"
    costcenter  = "f5costcenter"
  }

  #CloudFormation templates triggered from Terraform must be hosted on AWS S3. Experimental hosted in non-canonical S3 bucket.
  template_url = "https://s3.amazonaws.com/f5-cft/f5-existing-stack-payg-1nic-bigip.template"
}