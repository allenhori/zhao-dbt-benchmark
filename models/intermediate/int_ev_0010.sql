select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    round(p.m9 / 2.0, 4) as v1,
    round(p.m1 / 2.0, 4) as v2,
    p.m9 * 13 as v3,
    coalesce(p.m1, 0) + 7 as v4,
    p.m9 + 3 as v5,
    p.m9 + 2 as v6,
    p.m1 + 7 as v7
from {{ ref('stg_ev_03') }} as p
where p.customer_id % 97 <> 0
