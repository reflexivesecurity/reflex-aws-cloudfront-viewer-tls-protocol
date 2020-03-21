# reflex-aws-cloudfront-tls-version
TODO: Write a brief description of your rule and what it does.

## Usage
To use this rule either add it to your `reflex.yaml` configuration file:  
```
rules:
  - reflex-aws-cloudfront-tls-version:
      version: latest
```

or add it directly to your Terraform:  
```
...

module "reflex-aws-cloudfront-tls-version" {
  source           = "github.com/cloudmitigator/reflex-aws-cloudfront-tls-version"
}

...
```

## License
This Reflex rule is made available under the MPL 2.0 license. For more information view the [LICENSE](https://github.com/cloudmitigator/reflex-aws-cloudfront-tls-version/blob/master/LICENSE) 