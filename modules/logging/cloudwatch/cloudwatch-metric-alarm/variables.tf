variable "alarm_name" {
    type = string
    description = "The descriptive name for the alarm. This name must be unique within the user's AWS account"
}

variable "alarm_description" {
    type = string
    default = null
    description = "The description for the alarm."
}

variable "comparison_operator" {
    type = string
    description = "The arithmetic operation to use when comparing the specified Statistic and Threshold. The specified Statistic value is used as the first operand. Either of the following is supported: GreaterThanOrEqualToThreshold, GreaterThanThreshold, LessThanThreshold, LessThanOrEqualToThreshold. Additionally, the values LessThanLowerOrGreaterThanUpperThreshold, LessThanLowerThreshold, and GreaterThanUpperThreshold are used only for alarms based on anomaly detection models."
    validation {
        condition     = contains(["GreaterThanOrEqualToThreshold", "GreaterThanThreshold", "LessThanThreshold", "LessThanOrEqualToThreshold", "LessThanLowerOrGreaterThanUpperThreshold", "LessThanLowerThreshold", "GreaterThanUpperThreshold"], var.comparison_operator)
        error_message = "Valid values for var: comparison_operator are (GreaterThanOrEqualToThreshold, GreaterThanThreshold, LessThanThreshold, LessThanOrEqualToThreshold, LessThanLowerOrGreaterThanUpperThreshold, LessThanLowerThreshold, GreaterThanUpperThreshold)."
    }
}

variable "evaluation_periods" {
    type = number
    description = "The number of periods over which data is compared to the specified threshold."
}

variable "threshold" {
    type = number
    description = "The value against which the specified statistic is compared. This parameter is required for alarms based on static thresholds, but should not be used for alarms based on anomaly detection models."
    default = null
}

variable "unit" {
    type = string
    description = "The unit for the alarm's associated metric."
    default = null
}

variable "namespace" {
    type = string
    default = null
    description = "The namespace for the alarm's associated metric. https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/aws-services-cloudwatch-metrics.html"
}

variable "metric_name" {
    type = string
    default = null
    description = "The name for the alarm's associated metric. https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/aws-services-cloudwatch-metrics.html"
}

variable "period" {
    type        = number
    default     = null
    description = "The period in seconds over which the specified statistic is applied. Valid values are 10, 30, or any multiple of 60"
    validation {
        condition     = contains([10, 30, 60], var.period)
        error_message = "Valid values for var: comparison_operator are (10, 30, 60)."
    }
}

variable "statistic" {
    type = string
    description = "The statistic to apply to the alarm's associated metric. Either of the following is supported: SampleCount, Average, Sum, Minimum, Maximum"
    default = null
    validation {
        condition     = contains(["SampleCount", "Average", "Sum", "Minimum", "Maximum"], var.statistic)
        error_message = "Valid values for var: statistic are (SampleCount, Average, Sum, Minimum, Maximum)."
    }
}

variable "alarm_actions" {
    type = list(string)
    description = "The list of actions to execute when this alarm transitions into an ALARM state from any other state. Each action is specified as an Amazon Resource Name (ARN)."
    default = null
}

variable "ok_actions" {
    type = list(string)
    description = "The list of actions to execute when this alarm transitions into an OK state from any other state. Each action is specified as an Amazon Resource Name (ARN)."
    default = null
}

variable "actions_enabled" {
    type = bool
    description = "Indicates whether or not actions should be executed during any changes to the alarm's state. Defaults to true."
    default = true
}

variable "dimensions" {
    type = any
    description = "The dimensions for the alarm's associated metric."
    default = null
}

variable "insufficient_data_actions" {
    type = list(string)
    description = "The list of actions to execute when this alarm transitions into an INSUFFICIENT_DATA state from any other state. Each action is specified as an Amazon Resource Name (ARN)."
    default = null
}

variable "datapoints_to_alarm" {
    description = "The number of datapoints that must be breaching to trigger the alarm."
    type        = number
    default     = null
}

variable "treat_missing_data" {
    description = "Sets how this alarm is to handle missing data points. The following values are supported: missing, ignore, breaching and notBreaching."
    type        = string
    default     = "missing"
}

variable "evaluate_low_sample_count_percentiles" {
    description = "Used only for alarms based on percentiles. If you specify ignore, the alarm state will not change during periods with too few data points to be statistically significant. If you specify evaluate or omit this parameter, the alarm will always be evaluated and possibly change state no matter how many data points are available. The following values are supported: ignore, and evaluate."
    type        = string
    default     = null
}

variable "extended_statistic" {
    description = "The percentile statistic for the metric associated with the alarm. Specify a value between p0.0 and p100."
    type        = string
    default     = null
}

variable "metric_query" {
  description = "Enables you to create an alarm based on a metric math expression. You may specify at most 20."
  type        = any
  default     = []
}

variable "threshold_metric_id" {
  description = "If this is an alarm based on an anomaly detection model, make this value match the ID of the ANOMALY_DETECTION_BAND function."
  type        = string
  default     = null
}

