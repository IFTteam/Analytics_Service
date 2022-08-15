package com.dukejiang.email_analytics.model.request;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class IndividualAnalyticsRequest extends Request{
    private int audienceId;
}
