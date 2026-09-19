select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v2 > p.v1 then p.v2 else p.v1 end as v1,
    p.v2 * 0.5 + p.v1 * 0.5 as v2,
    p.v2 - p.v1 as v3,
    round(p.v2 / 13.0, 4) as v4,
    p.v1 + p.v7 as v5,
    coalesce(p.v7, 0) + 7 as v6,
    case when p.v7 > 1300 then p.v7 else 0 end as v7
from {{ ref('int_ev_0015') }} as p
