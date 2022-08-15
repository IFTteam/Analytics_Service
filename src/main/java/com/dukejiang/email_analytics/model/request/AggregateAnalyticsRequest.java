package com.dukejiang.email_analytics.model.request;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AggregateAnalyticsRequest extends Request{
    private int userId;
}
