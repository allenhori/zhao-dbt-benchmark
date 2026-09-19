select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.m7 - p.m5 as v1,
    case when p.m5 > 200 then p.m5 else 0 end as v2,
    p.m5 - p.m3 as v3,
    p.m3 - p.m7 as v4,
    case when p.m7 > 1100 then p.m7 else 0 end as v5,
    case when p.m5 > p.m3 then p.m5 else p.m3 end as v6,
    p.m7 * 0.5 + p.m3 * 0.5 as v7
from {{ ref('stg_ev_05') }} as p
