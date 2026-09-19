select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v7 * 3 as v1,
    case when p.v7 > 1100 then p.v7 else 0 end as v2,
    coalesce(p.v4, 0) + 2 as v3,
    p.v7 * 0.5 + p.v1 * 0.5 as v4,
    round(p.v7 / 7.0, 4) as v5,
    coalesce(p.v4, 0) + 5 as v6,
    p.v1 + p.v7 as v7
from {{ ref('int_ev_0305') }} as p
