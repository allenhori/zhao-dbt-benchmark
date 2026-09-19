select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.m2 * 7 as v1,
    round(p.m2 / 13.0, 4) as v2,
    case when p.m11 > 700 then p.m11 else 0 end as v3,
    p.m11 + 3 as v4,
    p.m2 + p.m11 as v5,
    case when p.m11 > 200 then p.m11 else 0 end as v6,
    case when p.m2 > p.m11 then p.m2 else p.m11 end as v7
from {{ ref('stg_ev_05') }} as p
