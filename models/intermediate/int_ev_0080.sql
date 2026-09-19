select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.m5 > 300 then p.m5 else 0 end as v1,
    coalesce(p.m1, 0) + 2 as v2,
    p.m5 + p.m1 as v3,
    p.m1 * 7 as v4,
    case when p.m5 > p.m1 then p.m5 else p.m1 end as v5,
    case when p.m1 > 200 then p.m1 else 0 end as v6,
    p.m5 + 3 as v7
from {{ ref('stg_ev_05') }} as p
