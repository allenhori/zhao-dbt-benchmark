select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v1 > 700 then p.v1 else 0 end as v1,
    coalesce(p.v4, 0) + 13 as v2,
    coalesce(p.v1, 0) + 2 as v3,
    round(p.v6 / 3.0, 4) as v4,
    coalesce(p.v4, 0) + 11 as v5,
    p.v4 + 7 as v6,
    p.v1 * 0.5 + p.v4 * 0.5 as v7,
    p.v1 - p.v4 as v8
from {{ ref('int_ev_0030') }} as p
