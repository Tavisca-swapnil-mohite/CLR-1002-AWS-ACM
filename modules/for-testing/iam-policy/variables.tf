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