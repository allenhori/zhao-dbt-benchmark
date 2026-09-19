select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.m1 > p.m10 then p.m1 else p.m10 end as v1,
    p.m10 + p.m1 as v2,
    p.m10 * 0.5 + p.m1 * 0.5 as v3,
    case when p.m10 > 700 then p.m10 else 0 end as v4,
    coalesce(p.m1, 0) + 3 as v5,
    case when p.m10 > 200 then p.m10 else 0 end as v6,
    p.m1 - p.m10 as v7
from {{ ref('stg_ev_06') }} as p
