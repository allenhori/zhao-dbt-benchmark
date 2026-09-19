select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    round(p.m5 / 2.0, 4) as v1,
    coalesce(p.m2, 0) + 2 as v2,
    case when p.m2 > 200 then p.m2 else 0 end as v3,
    p.m2 + p.m5 as v4,
    p.m4 * 13 as v5,
    p.m5 + p.m2 as v6,
    p.m4 * 7 as v7
from {{ ref('stg_ev_01') }} as p
