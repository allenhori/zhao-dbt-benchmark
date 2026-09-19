select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.m3 * 2 as v1,
    case when p.m5 > p.m3 then p.m5 else p.m3 end as v2,
    case when p.m3 > 300 then p.m3 else 0 end as v3,
    round(p.m3 / 11.0, 4) as v4,
    round(p.m5 / 5.0, 4) as v5,
    case when p.m5 > p.m3 then p.m5 else p.m3 end as v6,
    p.m3 * 0.5 + p.m5 * 0.5 as v7,
    p.m3 * 3 as v8
from {{ ref('stg_ev_02') }} as p
