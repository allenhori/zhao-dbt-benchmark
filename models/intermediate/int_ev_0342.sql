select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v8 * 0.5 + p.v4 * 0.5 as v1,
    p.v5 - p.v4 as v2,
    case when p.v4 > 700 then p.v4 else 0 end as v3,
    round(p.v5 / 2.0, 4) as v4,
    p.v5 * 5 as v5,
    coalesce(p.v5, 0) + 3 as v6,
    p.v8 * 13 as v7,
    coalesce(p.v4, 0) + 3 as v8
from {{ ref('int_ev_0018') }} as p
