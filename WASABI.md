For each backed-up host, a new Wasabi bucket should be created, along with a new Policy and User. This Bucket, Policy, and User shall be used by a single backed-up host.

To create a new set of bucket, policy, and user, complete the following steps from within the Wasabi console:

# 1.  Create a new bucket
    
1.  **Bucket Name**: The bucket name should be the same as the host, followed by `-restic-backups-` and a random string.
    1.  For example, if backing up [www.foobar.net](http://www.foobar.net), the bucket may be called `www.foobar.net-restic-backups-xt1r27w8wq7tkvhj5w64`
    2.  Wasabi will not accept a name that is longer than 64 characters. If the full hostname and random string is too long, it is appropriate to use the hostname subdomain without the parent domain. For example, `foobar-restic-backups-xt1r27w8wq7tkvhj5w64` or `www.foobar-restic-backups-xt1r27w8wq7tkvhj5w64`.
2.  **Region**: The region doesn’t matter, but I typically use a North American region (us-east-1, us-east-2, or us-west-1, or us-central-1).
1.  Leave all optional options at their default state. We do not use bucket versioning, object locking, or bucket logging.

# 2.  Create a new policy

1.  **Policy Name**: name the policy to be the same as the bucket name but prefixed with `custom-`.
    1.  i.e. If the bucket is called called `www-restic-backups-xt1r27w8wq7tkvhj5w64`, the policy will be called `custom-www-restic-backups-xt1r27w8wq7tkvhj5w64`.
    2.  Prefixing all policy names with `custom-` makes it easier to find all custom policies in the interface.
2.  **Policy Document**:
    1.  The policy document below will allow the remote host to write new backups and read existing backups. It will prevent the remote host from deleting any backups.
    2.  Replace all instances of BUCKETNAME below with the name of the bucket:
        
```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AllowObjects",
            "Effect": "Allow",
            "Action": [
            "s3:PutObject",
            "s3:GetObject"
            ],
            "Resource": "arn:aws:s3:::BUCKETNAME/*"
        },
        {
            "Sid": "AllowDeleteLocks",
            "Effect": "Allow",
            "Action": "s3:DeleteObject",
            "Resource": "arn:aws:s3:::BUCKETNAME/locks/*"
        },
        {
            "Sid": "AllowBucket",
            "Effect": "Allow",
            "Action": [
            "s3:ListBucket",
            "s3:GetBucketLocation"
            ],
            "Resource": "arn:aws:s3:::BUCKETNAME"
        }
        ]
    }
```
# 3. Create a new user

1.  **Username**: The username should be the same as the bucket name
2.  **Type of access**: check Programmatic (create API key)
3.  **Groups**: the user should not be a member of any groups
4.  **Policies**: add the policy created above (type “custom” and select the policy named for the buck)
    - Note the user API key and secret key.