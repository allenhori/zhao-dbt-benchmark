select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.m11 * 5 as v1,
    p.m10 - p.m11 as v2,
    p.m11 * 5 as v3,
    case when p.m10 > 300 then p.m10 else 0 end as v4,
    p.m10 + p.m11 as v5,
    case when p.m10 > p.m11 then p.m10 else p.m11 end as v6,
    p.m10 - p.m11 as v7
from {{ ref('stg_ev_07') }} as p
