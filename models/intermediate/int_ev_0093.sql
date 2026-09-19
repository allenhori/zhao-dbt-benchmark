select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v1 * 0.5 + p.v8 * 0.5 as v1,
    p.v1 + p.v8 as v2,
    round(p.v4 / 3.0, 4) as v3,
    case when p.v1 > 1100 then p.v1 else 0 end as v4,
    p.v8 * 0.5 + p.v4 * 0.5 as v5,
    p.v1 + p.v8 as v6,
    case when p.v1 > 500 then p.v1 else 0 end as v7,
    coalesce(p.v4, 0) + 5 as v8
from {{ ref('int_ev_0051') }} as p
