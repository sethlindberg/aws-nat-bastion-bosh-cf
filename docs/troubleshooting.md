# Troubleshooting / Known Issues + Workarounds

## OptInRequired

If this message is received:
```
Error applying plan:

1 error(s) occurred:

* aws_instance.bastion: Error launching source instance: OptInRequired: In order to use this AWS Marketplace product you need to accept terms and subscribe. To do so please visit http://aws.amazon.com/marketplace/pp?sku=aw0evgkw8e5c1q413zgy5pjce
  status code: 401, request id:

Terraform does not automatically rollback in the face of errors.
Instead, your Terraform state file has been partially updated with
any resources that successfully completed. Please address the error
above and apply again to incrementally change your infrastructure.
```
Go to the URL in the error message and click "Manual Launch" tab (for EC2 APIs / CLI) and click the giant orange button to "Accept Software Terms". Then re-run the commands.

## What's xip.io and sslip.io?

Historically, the project used [xip.io](http://xip.io) for development and "easy" DNS resolution; however, we found in some cases that xip.io could be a little flaky in terms of uptime. That led us to use [sslip.io](http://sslip.io), which was/is a similar service that *used to* provide SSL certificates as well; they stopped providing that feature in the past, however the DNS resolution magic still works and it's apparently more stable than xip.io has been in our experience.
