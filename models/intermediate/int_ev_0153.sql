select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.m4 > p.m6 then p.m4 else p.m6 end as v1,
    p.m4 * 3 as v2,
    coalesce(p.m6, 0) + 13 as v3,
    p.m1 - p.m6 as v4,
    round(p.m1 / 11.0, 4) as v5,
    p.m1 * 2 as v6,
    round(p.m6 / 13.0, 4) as v7,
    p.m1 * 0.5 + p.m4 * 0.5 as v8
from {{ ref('stg_ev_07') }} as p
