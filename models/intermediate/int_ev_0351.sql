select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v2 > 300 then p.v2 else 0 end as v1,
    p.v4 * 0.5 + p.v6 * 0.5 as v2,
    p.v4 * 3 as v3,
    round(p.v2 / 2.0, 4) as v4,
    coalesce(p.v4, 0) + 2 as v5,
    case when p.v4 > p.v2 then p.v4 else p.v2 end as v6,
    p.v4 - p.v2 as v7,
    case when p.v2 > p.v6 then p.v2 else p.v6 end as v8
from {{ ref('int_ev_0015') }} as p
