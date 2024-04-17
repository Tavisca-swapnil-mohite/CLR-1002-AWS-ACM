variable "statements" {
    type = list(
        object({

            actions = list(string)
            resources = list(string)
            condition = list(object({
                test = string
                variable = string
                values = list(string)
            }))
        })
    )
}

#[{
#    actions = ["ec2:*"]
#    resources = ["*"]
#}, {
#    actions = ["lambda:*"]
#    resources = ["*"]
#    condition = [{
#        test = "StringEquals"
#        variable = "s3:prefix"
#        values = ["home/"]
#    }]
#}]