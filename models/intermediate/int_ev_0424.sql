select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.m3 * 7 as v1,
    case when p.m5 > 300 then p.m5 else 0 end as v2,
    case when p.m5 > 1100 then p.m5 else 0 end as v3,
    case when p.m5 > p.m3 then p.m5 else p.m3 end as v4,
    p.m5 - p.m3 as v5,
    p.m3 * 5 as v6
from {{ ref('stg_ev_05') }} as p
