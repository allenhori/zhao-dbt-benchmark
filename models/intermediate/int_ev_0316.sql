select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v1 * 11 as v1,
    round(p.v2 / 11.0, 4) as v2,
    case when p.v2 > p.v3 then p.v2 else p.v3 end as v3,
    p.v1 - p.v3 as v4,
    round(p.v1 / 3.0, 4) as v5,
    p.v2 + p.v1 as v6,
    p.v2 + p.v1 as v7,
    case when p.v3 > 200 then p.v3 else 0 end as v8
from {{ ref('int_ev_0019') }} as p
