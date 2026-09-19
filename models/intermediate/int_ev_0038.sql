select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    coalesce(p.m2, 0) + 7 as v1,
    coalesce(p.m2, 0) + 3 as v2,
    round(p.m11 / 2.0, 4) as v3,
    p.m2 * 5 as v4,
    p.m11 * 11 as v5,
    p.m11 * 0.5 + p.m2 * 0.5 as v6,
    p.m2 + p.m11 as v7
from {{ ref('stg_ev_03') }} as p
where p.customer_id % 97 <> 0
